// TopoR PCB (.fst) reader/writer tests.
#include <gtest/gtest.h>

#include <cmath>
#include <algorithm>
#include <map>
#include <set>
#include <tuple>

#include "core/Connectivity.h"
#include "io/BoardIO.h"
#include "io/topor/Fst.h"
#include "io/xml/Xml.h"

using namespace xr;

static std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

static double dist(Point a, Point b) { return (a.v() - b.v()).len(); }

// Copper indices (0 = top) of the layers a pad sits on; layer ids differ between readers.
static std::set<int> copperIndices(const Board& b, const Pad& p) {
  std::set<int> s;
  for (LayerId l : b.copperLayers())
    if (p.onLayer(l)) s.insert(b.layers[l].copperIndex);
  return s;
}

// Pads of a component keyed by pad number.
static std::map<std::string, const Pad*> padsByNumber(const Board& b, const Component& c) {
  std::map<std::string, const Pad*> m;
  for (int pi : c.pads) m.emplace(b.pads[pi].number, &b.pads[pi]);
  return m;
}

TEST(Xml, ParseBasics) {
  auto doc = xml::parse(
      "\xEF\xBB\xBF<?xml version=\"1.0\"?>\r\n<!-- c -->\r\n"
      "<a x=\"1.5\" s=\"a &amp; b\">\r\n <b/>\r\n <b y=\"on\">text</b>\r\n</a>");
  ASSERT_TRUE(doc) << doc.error();
  EXPECT_EQ(doc->name, "a");
  EXPECT_DOUBLE_EQ(doc->num("x"), 1.5);
  EXPECT_EQ(doc->attr("s"), "a & b");
  ASSERT_EQ(doc->findAll("b").size(), 2u);
  EXPECT_TRUE(doc->findAll("b")[1]->flag("y"));
  EXPECT_EQ(doc->findAll("b")[1]->text, "text");
  EXPECT_FALSE(xml::parse("<a><b></a>"));
  xml::Writer w;
  w.open("A", {{"k", "v\"<"}});
  w.empty("B");
  w.close();
  EXPECT_EQ(w.str(), "<A k=\"v&quot;&lt;\">\r\n\t<B/>\r\n</A>\r\n");
}

TEST(FstIO, ReadExample03) {
  auto r = io::loadBoard(data("topor/Example_03/arz_2L.fst"));
  ASSERT_TRUE(r) << r.error();
  const Board& b = **r;
  EXPECT_EQ(b.copperCount(), 2);
  EXPECT_EQ(b.layers[b.topCopper()].name, "Top");
  EXPECT_EQ(b.layers[b.bottomCopper()].name, "Bottom");
  EXPECT_GT(b.components.size(), 50u);
  EXPECT_GT(b.pads.size(), 500u);
  EXPECT_GT(b.nets.size(), 50u);
  EXPECT_GT(b.tracks.size(), 1000u);
  EXPECT_GT(b.vias.size(), 100u);
  ASSERT_EQ(b.outline.size(), 1u);  // the Specctra signal boundary is not a cutout
  BBox bb;
  for (auto& p : b.outline[0]) bb.add(p);
  EXPECT_NEAR(bb.width(), 102.2e6, 1e3);
  EXPECT_NEAR(bb.height(), 112.2e6, 1e3);
  // Rules: width 0.2, clearance 0.3 nominal, default via CCTVIA 1.016/0.6
  EXPECT_EQ(b.netClasses[0].trackWidth, mmToNm(0.2));
  EXPECT_EQ(b.netClasses[0].clearance, mmToNm(0.3));
  // Through-hole pads span both layers, SMD pads one layer on the component side.
  int c12 = b.findComponent("C12");
  ASSERT_GE(c12, 0);
  EXPECT_EQ(b.components[c12].side, Side::Bottom);
  EXPECT_DOUBLE_EQ(b.components[c12].angle, 270);
  for (int pi : b.components[c12].pads) {
    EXPECT_EQ(b.pads[pi].drill, 0);
    EXPECT_EQ(b.pads[pi].copper, LayerMask(1) << b.bottomCopper());
    EXPECT_EQ(b.pads[pi].shape.kind, PadShapeKind::Rect);
  }
  int fp1 = b.findComponent("FP1");
  ASSERT_GE(fp1, 0);
  ASSERT_EQ(b.components[fp1].pads.size(), 1u);
  EXPECT_EQ(b.pads[b.components[fp1].pads[0]].drill, mmToNm(1.1));
  EXPECT_EQ(b.pads[b.components[fp1].pads[0]].pos, Point(mmToNm(75.3), -mmToNm(15.3)));
  // Fully routed by TopoR.
  EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), 0u);
}

// The same board imported by TopoR from Specctra: pad positions and nets must agree with our
// DSN reader, which validates placement/mirroring/rotation conventions.
TEST(FstIO, MatchesDsn) {
  auto fst = io::loadBoard(data("topor/Example_03/arz_2L.fst"));
  auto dsn = io::loadBoard(data("topor/Example_03/arz_master.dsn"));
  ASSERT_TRUE(fst) << fst.error();
  ASSERT_TRUE(dsn) << dsn.error();
  const Board& f = **fst;
  const Board& d = **dsn;
  EXPECT_EQ(f.nets.size(), d.nets.size());
  int compared = 0, netMismatch = 0;
  for (auto& fc : f.components) {
    int di = d.findComponent(fc.ref);
    if (di < 0) continue;  // FreePads are not components in the DSN
    const Component& dc = d.components[di];
    EXPECT_EQ(fc.side, dc.side) << fc.ref;
    EXPECT_NEAR(dist(fc.pos, dc.pos), 0, 1000) << fc.ref;
    auto fp = padsByNumber(f, fc), dp = padsByNumber(d, dc);
    ASSERT_EQ(fp.size(), dp.size()) << fc.ref;
    for (auto& [num, pad] : fp) {
      auto it = dp.find(num);
      ASSERT_NE(it, dp.end()) << fc.ref << "-" << num;
      EXPECT_NEAR(dist(pad->pos, it->second->pos), 0, 1000) << fc.ref << "-" << num;
      EXPECT_EQ(pad->isThrough(), it->second->isThrough()) << fc.ref << "-" << num;
      std::string fn = pad->net >= 0 ? f.nets[pad->net].name : "";
      std::string dn = it->second->net >= 0 ? d.nets[it->second->net].name : "";
      if (fn != dn) ++netMismatch;
      ++compared;
    }
  }
  EXPECT_GT(compared, 500);
  EXPECT_EQ(netMismatch, 0);
  EXPECT_EQ(d.components.size() + 0u, size_t(std::count_if(f.components.begin(), f.components.end(),
                                                            [&](const Component& c) { return d.findComponent(c.ref) >= 0; })));
}

TEST(FstIO, Arcs) {
  auto r = io::loadBoard(data("topor/Example_04/Arcs.fst"));
  ASSERT_TRUE(r) << r.error();
  const Board& b = **r;
  int arcs = 0;
  for (auto& t : b.tracks) {
    if (!t.isArc()) continue;
    ++arcs;
    auto g = ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v());
    ASSERT_TRUE(g.valid);
    EXPECT_NEAR((t.b.v() - g.center).len(), g.radius, g.radius * 1e-3 + 100);
    EXPECT_LT(std::abs(g.sweep), kPi + 1e-6);  // TopoR arcs are at most a half turn in practice
  }
  EXPECT_GT(arcs, 10);
  // First arc of the file: TrackArcCW centre (215.36,120.4) from (216.4599,121.035) to (216.63,120.4).
  const Track* first = nullptr;
  for (auto& t : b.tracks)
    if (t.isArc() && t.b == Point(mmToNm(216.63), -mmToNm(120.4))) { first = &t; break; }
  ASSERT_NE(first, nullptr);
  auto g = ArcGeom::fromThreePoints(first->a.v(), first->mid->v(), first->b.v());
  EXPECT_NEAR(g.center.x, mmToNm(215.36), 2000);
  EXPECT_NEAR(g.center.y, -mmToNm(120.4), 2000);
  // Clockwise on screen (Y up) = clockwise in our Y-down frame as drawn: the mid point lies
  // above the chord's right side; check via the DSN-style rule: sweep sign flips with the Y axis.
  EXPECT_GT(g.sweep, 0);  // CW in Y-up appears as positive sweep in Y-down math
  EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), 0u);
}

TEST(FstIO, ReadAllExamples) {
  const char* files[] = {"topor/Example_01/SingleLayer.fst", "topor/Example_02/Placement.fst",
                         "topor/Example_02/Placement_standard_routing.fst", "topor/Example_03/arz_4L.fst",
                         "topor/Example_05/MinVia.fst", "topor/Example_06/Signals.fst"};
  for (auto* f : files) {
    auto r = io::loadBoard(data(f));
    ASSERT_TRUE(r) << f << ": " << r.error();
    EXPECT_GT((*r)->components.size(), 0u) << f;
    EXPECT_GT((*r)->pads.size(), 0u) << f;
    EXPECT_GE((*r)->outline.size(), 1u) << f;
  }
  auto s = io::loadBoard(data("topor/Example_06/Signals.fst"));
  ASSERT_TRUE(s);
  EXPECT_GT((*s)->zones.size(), 0u);
  EXPECT_GT((*s)->copperCount(), 2);
}

TEST(FstIO, RoundTrip) {
  auto r = io::loadBoard(data("topor/Example_03/arz_2L.fst"));
  ASSERT_TRUE(r) << r.error();
  const Board& a = **r;
  std::string text = io::writeFst(a);
  EXPECT_EQ(text.substr(0, 3), "\xEF\xBB\xBF");
  EXPECT_NE(text.find("<Version>1.2.0</Version>\r\n"), std::string::npos);
  auto again = io::readFst(text, "rt.fst");
  ASSERT_TRUE(again) << again.error();
  const Board& c = **again;
  EXPECT_EQ(c.copperCount(), a.copperCount());
  EXPECT_EQ(c.components.size(), a.components.size());
  EXPECT_EQ(c.pads.size(), a.pads.size());
  EXPECT_EQ(c.nets.size(), a.nets.size());
  EXPECT_EQ(c.tracks.size(), a.tracks.size());
  EXPECT_EQ(c.vias.size(), a.vias.size());
  EXPECT_EQ(c.outline.size(), a.outline.size());
  EXPECT_EQ(c.netClasses[0].trackWidth, a.netClasses[0].trackWidth);
  EXPECT_EQ(c.netClasses[0].clearance, a.netClasses[0].clearance);
  EXPECT_EQ(c.netClasses[0].viaDrill, a.netClasses[0].viaDrill);
  for (size_t i = 0; i < a.components.size(); ++i) {
    const Component& ca = a.components[i];
    int ci = c.findComponent(ca.ref);
    ASSERT_GE(ci, 0) << ca.ref;
    const Component& cc = c.components[ci];
    EXPECT_EQ(cc.side, ca.side);
    EXPECT_NEAR(cc.angle, ca.angle, 1e-3);
    auto pa = padsByNumber(a, ca), pc = padsByNumber(c, cc);
    ASSERT_EQ(pa.size(), pc.size()) << ca.ref;
    for (auto& [num, pad] : pa) {
      const Pad* q = pc.at(num);
      EXPECT_NEAR(dist(pad->pos, q->pos), 0, 100) << ca.ref << "-" << num;
      EXPECT_EQ(pad->copper, q->copper) << ca.ref << "-" << num;
      EXPECT_EQ(pad->drill, q->drill) << ca.ref << "-" << num;
      EXPECT_EQ(pad->shape.kind, q->shape.kind) << ca.ref << "-" << num;
      EXPECT_EQ(pad->shape.w, q->shape.w) << ca.ref << "-" << num;
      EXPECT_EQ(pad->shape.h, q->shape.h) << ca.ref << "-" << num;
      EXPECT_NEAR(std::fmod(pad->angle - q->angle + 720.0, 360.0) < 180 ? std::fmod(pad->angle - q->angle + 720.0, 360.0)
                                                                        : 360 - std::fmod(pad->angle - q->angle + 720.0, 360.0),
                  0, 1e-3);
      std::string na = pad->net >= 0 ? a.nets[pad->net].name : "", nc = q->net >= 0 ? c.nets[q->net].name : "";
      EXPECT_EQ(na, nc) << ca.ref << "-" << num;
    }
  }
  // Routing survives: same multiset of track end points.
  auto ends = [](const Board& b) {
    std::multiset<std::tuple<Coord, Coord, Coord, Coord, int>> s;
    for (auto& t : b.tracks) {
      Point p = t.a, q = t.b;
      if (std::tie(q.x, q.y) < std::tie(p.x, p.y)) std::swap(p, q);
      s.emplace(p.x, p.y, q.x, q.y, t.layer);
    }
    return s;
  };
  EXPECT_EQ(ends(a), ends(c));
  EXPECT_EQ(Connectivity::compute(c).ratsnest.size(), 0u);
}

TEST(FstIO, RoundTripArcsAndZones) {
  for (auto* f : {"topor/Example_04/Arcs.fst", "topor/Example_06/Signals.fst"}) {
    auto r = io::loadBoard(data(f));
    ASSERT_TRUE(r) << r.error();
    auto again = io::readFst(io::writeFst(**r), "rt.fst");
    ASSERT_TRUE(again) << again.error();
    const Board& a = **r;
    const Board& c = **again;
    EXPECT_EQ(c.tracks.size(), a.tracks.size()) << f;
    EXPECT_EQ(c.zones.size(), a.zones.size()) << f;
    EXPECT_EQ(c.copperCount(), a.copperCount()) << f;
    int arcsA = 0, arcsC = 0;
    for (auto& t : a.tracks) arcsA += t.isArc();
    for (auto& t : c.tracks) arcsC += t.isArc();
    EXPECT_EQ(arcsA, arcsC) << f;
    for (size_t i = 0; i < std::min(a.tracks.size(), c.tracks.size()); ++i) {
      if (!a.tracks[i].isArc()) continue;
      // Tracks are regrouped per net/layer, so look the arc up by its end points.
      bool found = false;
      for (auto& t : c.tracks) {
        if (!t.isArc()) continue;
        bool same = (dist(t.a, a.tracks[i].a) < 100 && dist(t.b, a.tracks[i].b) < 100) ||
                    (dist(t.a, a.tracks[i].b) < 100 && dist(t.b, a.tracks[i].a) < 100);
        if (same && dist(*t.mid, *a.tracks[i].mid) < 200) { found = true; break; }
      }
      EXPECT_TRUE(found) << f << " arc " << i;
    }
  }
}

// A KiCad board written as .fst and read back keeps placement, including bottom-side parts.
TEST(FstIO, WriteKicadBoard) {
  auto r = io::loadBoard(data("astable.kicad_pcb"));
  ASSERT_TRUE(r) << r.error();
  const Board& a = **r;
  std::string text = io::writeFst(a);
  auto again = io::readFst(text, "astable.fst");
  ASSERT_TRUE(again) << again.error();
  const Board& c = **again;
  EXPECT_EQ(c.components.size(), a.components.size());
  EXPECT_EQ(c.pads.size(), a.pads.size());
  EXPECT_EQ(c.nets.size(), a.nets.size());
  EXPECT_EQ(c.tracks.size(), a.tracks.size());
  EXPECT_EQ(c.vias.size(), a.vias.size());
  EXPECT_EQ(c.outline.size(), a.outline.size());
  for (auto& ca : a.components) {
    int ci = c.findComponent(ca.ref);
    ASSERT_GE(ci, 0) << ca.ref;
    auto pa = padsByNumber(a, ca), pc = padsByNumber(c, c.components[ci]);
    ASSERT_EQ(pa.size(), pc.size()) << ca.ref;
    for (auto& [num, pad] : pa) {
      EXPECT_NEAR(dist(pad->pos, pc.at(num)->pos), 0, 100) << ca.ref << "-" << num;
      EXPECT_EQ(copperIndices(a, *pad), copperIndices(c, *pc.at(num))) << ca.ref << "-" << num;
    }
  }
  EXPECT_EQ(Connectivity::compute(c).ratsnest.size(), Connectivity::compute(a).ratsnest.size());
}
