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
#include "io/topor/FsProj.h"
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
  // Rules: width 0.2, clearance 0.2 minimum (0.3 nominal), default via CCTVIA 1.016/0.6
  EXPECT_EQ(b.netClasses[0].trackWidth, mmToNm(0.2));
  EXPECT_EQ(b.netClasses[0].clearance, mmToNm(0.2));
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
  EXPECT_EQ(d.components.size() + 0u, size_t(r::count_if(f.components, [&](const std::string& ref) { return d.findComponent(ref) >= 0; },
                                                         &Component::ref)));
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

// Figures keep their kind through a .fst: a rectangle of the outline, a polygon's arcs, a copper area's circle.
TEST(FstIO, FiguresKeepTheirKind) {
  auto r = io::loadBoard(data("topor/Example_03/arz_2L.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& a = **r;
  LayerId edge = -1;
  for (LayerId l = 0; l < LayerId(a.layers.size()); ++l)
    if (a.isEdge(l)) edge = l;
  ASSERT_GE(edge, 0);
  std::erase_if(a.graphics, [&](const Graphic& g) { return g.layer == edge; });
  Graphic rect;
  rect.kind = GraphicKind::Rect;
  rect.layer = edge;
  rect.width = mmToNm(0.1);
  rect.a = {0, -112.0 * kNmPerMm};
  rect.b = {102.0 * kNmPerMm, 0};
  a.graphics.push_back(rect);
  Graphic hole;
  hole.kind = GraphicKind::Poly;
  hole.layer = edge;
  hole.width = mmToNm(0.1);
  hole.pts = {{40e6, -40e6}, {60e6, -40e6}, {60e6, -60e6}, {40e6, -60e6}};
  hole.arcs = {0, -90, 0, 180};
  a.graphics.push_back(hole);
  io::rebuildOutline(a);
  ASSERT_EQ(a.outline.size(), 2u);
  Zone z;
  z.layer = a.topCopper();
  Graphic c;
  c.kind = GraphicKind::Circle;
  c.a = {20e6, -20e6};
  c.b = {23e6, -20e6};
  z.setShape(c);
  a.zones.push_back(z);
  auto again = io::readFst(io::writeFst(a), "rt.fst");
  ASSERT_TRUE(again) << again.error();
  const Board& b = **again;
  std::vector<const Graphic*> edges;
  for (auto& g : b.graphics)
    if (b.isEdge(g.layer)) edges.push_back(&g);
  ASSERT_EQ(edges.size(), 2u);
  EXPECT_EQ(edges[0]->kind, GraphicKind::Rect);
  EXPECT_EQ(edges[1]->kind, GraphicKind::Poly);
  ASSERT_EQ(edges[1]->pts.size(), 4u);
  ASSERT_EQ(edges[1]->arcs.size(), 4u);
  EXPECT_NEAR(edges[1]->arcs[1], -90, 1e-6);
  EXPECT_NEAR(edges[1]->arcs[3], 180, 1e-6);
  EXPECT_EQ(b.outline.size(), 2u);
  ASSERT_TRUE(b.zones.back().shape);
  EXPECT_EQ(b.zones.back().shape->kind, GraphicKind::Circle);
  EXPECT_NEAR((b.zones.back().shape->b - b.zones.back().shape->a).len(), 3e6, 10);
}

// A text of several lines as TopoR writes it (the lines parted by "\r\r\n" in the file) and one without an
// alignment (TopoR leaves out its default, the centre). The lines are laid out one character height apart, the
// block placed as TopoR places it: a top-aligned one hangs below its point by all its lines but one.
TEST(FstIO, TextsOfSeveralLines) {
  auto file = io::readFile(data("topor/Example_01/SingleLayer.fst"));
  ASSERT_TRUE(file) << file.error();
  std::string text = *file;
  size_t at = text.find("</Constructive>");
  ASSERT_NE(at, std::string::npos);
  text.insert(at, "<Texts>\r\n"
                  "<Text text=\"Плата 1:\r\r\nТолщина 1,5 мм.\r\r\nTOP\" align=\"CT\"><LayerRef name=\"TopSilk\"/>"
                  "<TextStyleRef name=\"(Default)\"/><Org x=\"10\" y=\"-20\"/></Text>\r\n"
                  "<Text text=\"2\"><LayerRef name=\"TopSilk\"/><TextStyleRef name=\"(Default)\"/>"
                  "<Org x=\"5\" y=\"5\"/></Text>\r\n</Texts>\r\n");
  auto r = io::readFst(text, "texts.fst");
  ASSERT_TRUE(r) << r.error();
  const Board& b = **r;
  ASSERT_EQ(b.texts.size(), 2u);
  const Text& t = b.texts[0];
  EXPECT_EQ(t.align, TextAlign::CT);
  EXPECT_EQ(b.texts[1].align, TextAlign::CM);
  const double h = mmToNm(2.54);
  TextLayout l = b.textLayout(t);
  ASSERT_EQ(l.lines.size(), 3u);
  EXPECT_EQ(l.lines[0], "Плата 1:");
  EXPECT_EQ(l.lines[1], "Толщина 1,5 мм.");
  EXPECT_EQ(l.lines[2], "TOP");
  EXPECT_EQ(l.lineHeight, h);
  EXPECT_NEAR(l.top, 2 * h, 1);         // below its point by two lines of three
  EXPECT_NEAR(l.left, -l.width / 2, 1);  // the block centred, its lines from its left edge
  EXPECT_NEAR(l.width, 0.5 * h * 15, 1);  // without the GUI's fonts: half the height a character
  auto box = b.textBox(t);
  EXPECT_NEAR(box[0].y, t.pos.y + 2 * h, 1);
  EXPECT_NEAR(box[3].y, t.pos.y + 5 * h, 1);
  TextLayout one = b.textLayout(b.texts[1]);
  EXPECT_NEAR(one.top, -h / 2, 1);  // the centre: on its point

  // Written and read again: the same lines.
  auto again = io::readFst(io::writeFst(b), "rt.fst");
  ASSERT_TRUE(again) << again.error();
  ASSERT_EQ((*again)->texts.size(), 2u);
  EXPECT_EQ((*again)->textLayout((*again)->texts[0]).lines, l.lines);
  EXPECT_EQ((*again)->texts[1].align, TextAlign::CM);
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

// Width/clearance rules for nets, net groups and layers become net classes and layer rules, and are
// written back through net groups.
TEST(FstIO, NetAndLayerRules) {
  auto r = io::loadBoard(data("topor/Example_02/Placement.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& a = **r;
  auto width = [](const Board& b, const char* net) { return b.trackWidth(b.findNet(net), b.topCopper()); };
  EXPECT_EQ(width(a, "UN000016"), mmToNm(0.4));  // default rule
  EXPECT_EQ(width(a, "UN000087"), mmToNm(1.0));  // group WD10000
  EXPECT_EQ(width(a, "+5V"), mmToNm(1.5));       // group WD15000
  EXPECT_EQ(a.clearance(a.findNet("+5V"), a.topCopper()), mmToNm(0.3));

  // A layer rule overrides the class on its layer only.
  int g = a.findNet("G");
  LayerId top = a.topCopper(), bottom = a.bottomCopper();
  ASSERT_TRUE(a.rules);
  RuleNets gnet{RuleNets::Kind::Net, "G"};
  a.rules->widths.push_back({true, {a.layers[bottom].name}, gnet, mmToNm(0.6), mmToNm(0.6)});
  a.rules->clearances.push_back({true, {a.layers[bottom].name}, gnet, {}, mmToNm(0.5), mmToNm(0.5)});
  compileRules(a);
  EXPECT_EQ(a.trackWidth(g, top), mmToNm(1.5));
  EXPECT_EQ(a.trackWidth(g, bottom), mmToNm(0.6));
  EXPECT_EQ(a.clearance(g, bottom), mmToNm(0.5));
  EXPECT_EQ(a.maxClearance(), mmToNm(0.5));

  auto again = io::readFst(io::writeFst(a), "rules.fst");
  ASSERT_TRUE(again) << again.error();
  const Board& c = **again;
  for (const char* n : {"UN000016", "UN000087", "+5V", "G"}) EXPECT_EQ(width(c, n), width(a, n)) << n;
  int gc = c.findNet("G");
  EXPECT_EQ(c.layerRules.size(), 2u);  // width and clearance are separate TopoR rules
  EXPECT_EQ(c.trackWidth(gc, c.bottomCopper()), mmToNm(0.6));
  EXPECT_EQ(c.clearance(gc, c.bottomCopper()), mmToNm(0.5));
  EXPECT_EQ(c.clearance(gc, c.topCopper()), mmToNm(0.3));
}

// TopoR keeps a design's display settings in the file: they are read and written back.
TEST(FstIO, DisplayControlRoundTrip) {
  auto r = io::loadBoard(data("topor/Example_05/MinVia_standard_routing.fst"));
  ASSERT_TRUE(r) << r.error();
  const Board& a = **r;
  ASSERT_TRUE(a.display);
  const DisplayControl& d = *a.display;
  EXPECT_EQ(d.color("background", 0), 0x030b10u);
  EXPECT_EQ(d.color("netLines", 0), 0xaf7d3au);
  EXPECT_EQ(d.hilightRate, 42);
  EXPECT_TRUE(d.flag("showWires"));
  EXPECT_TRUE(d.gridDots);
  EXPECT_NEAR(d.gridX, 0.5 * kNmPerMil, 1e-6);  // 5000 database units of 0.0001 mil
  ASSERT_TRUE(d.layer("TopMask"));
  EXPECT_EQ(d.layer("TopMask")->details, 0xb15738u);
  EXPECT_FALSE(d.layer("TopMask")->visible);
  EXPECT_TRUE(d.layer("Top")->visible);
  EXPECT_EQ(d.activeLayer, "Top");

  Board b = a;
  b.display->netColors.push_back({"VCC", 0x00ff00});
  b.display->filterNetlines = true;
  b.display->netlineNets = {"GND"};
  auto again = io::readFst(io::writeFst(b), "display.fst");
  ASSERT_TRUE(again) << again.error();
  ASSERT_TRUE((*again)->display);
  const DisplayControl& e = *(*again)->display;
  EXPECT_EQ(e.colors, d.colors);
  EXPECT_EQ(e.show, d.show);
  EXPECT_NEAR(e.gridX, d.gridX, 1e-6);
  ASSERT_EQ(e.layers.size(), d.layers.size());
  for (size_t i = 0; i < e.layers.size(); ++i) {
    EXPECT_EQ(e.layers[i].layer, d.layers[i].layer);
    EXPECT_EQ(e.layers[i].details, d.layers[i].details);
    EXPECT_EQ(e.layers[i].visible, d.layers[i].visible);
  }
  ASSERT_EQ(e.netColors.size(), 1u);
  EXPECT_EQ(e.netColors[0].net, "VCC");
  EXPECT_EQ(e.netColors[0].color, 0x00ff00u);
  EXPECT_TRUE(e.filterNetlines);
  EXPECT_EQ(e.netlineNets, std::vector<std::string>{"GND"});
}

// TopoR projects: documents and autorouting variants, paths relative to the project or Wine paths.
TEST(FsProj, ReadResolveWrite) {
  std::string dir = data("topor/Example_02");
  auto text = io::readFile(dir + "/Example_02.fsproj");
  ASSERT_TRUE(text);
  auto p = io::readFsProj(*text);
  ASSERT_TRUE(p) << p.error();
  EXPECT_EQ(p->guid, "{01AA04F3-218E-498E-BA3F-985CB272D5E3}");
  ASSERT_EQ(p->documents.files.size(), 3u);
  EXPECT_EQ(p->documents.files[0].path, ".\\Placement.fsx");
  EXPECT_EQ(p->documents.files[0].opened, std::optional<bool>(false));
  EXPECT_FALSE(p->documents.files[2].opened.has_value());
  EXPECT_EQ(io::resolveProjectPath(dir, p->documents.files[2].path), dir + "/Placement_master.pcb");
  // Junk written by TopoR, Wine drive Z:.
  EXPECT_EQ(io::resolveProjectPath("/a/b", ".\\/\\/\\/\\x.fsx"), "/a/b/x.fsx");
  EXPECT_EQ(io::resolveProjectPath("/a/b", "Z:\\home\\u\\y.fst"), "/home/u/y.fst");
  EXPECT_EQ(io::projectEntry("/a/b", "/a/b/sub/z.fst"), ".\\sub\\z.fst");
  EXPECT_EQ(io::projectEntry("/a/b", "/c/z.fst"), "Z:\\c\\z.fst");

  // Written back: same entries, folders and unknown sections kept.
  p->autorouting.files.push_back({".\\Placement_var1.fst", std::nullopt, "2026-10-23 12:00:00"});
  io::FsProjFolder folder{"Мои варианты"};
  folder.files.push_back({".\\v2.fst", false, ""});
  p->documents.folders.push_back(folder);
  xml::Element imp;
  imp.name = "Import";
  imp.kids.push_back({"PCAD", {}, {}, {}});
  p->extra.push_back(imp);
  auto again = io::readFsProj(io::writeFsProj(*p));
  ASSERT_TRUE(again) << again.error();
  EXPECT_EQ(again->guid, p->guid);
  ASSERT_EQ(again->documents.files.size(), 3u);
  EXPECT_EQ(again->documents.files[1].path, p->documents.files[1].path);
  EXPECT_EQ(again->documents.files[1].dateChange, p->documents.files[1].dateChange);
  ASSERT_EQ(again->documents.folders.size(), 1u);
  EXPECT_EQ(again->documents.folders[0].name, "Мои варианты");
  ASSERT_EQ(again->autorouting.files.size(), 1u);
  ASSERT_EQ(again->extra.size(), 1u);
  EXPECT_EQ(again->extra[0].name, "Import");
}

// Keepouts (Placement, Arcs), texts with their styles (MinVia) and copper cutouts survive a round trip.
TEST(FstIO, KeepoutsTextsCutouts) {
  auto p = io::loadBoard(data("topor/Example_02/Placement.fst"));
  ASSERT_TRUE(p) << p.error();
  ASSERT_EQ((*p)->keepouts.size(), 4u);
  const Keepout& k = (*p)->keepouts[0];
  EXPECT_EQ(k.role, Keepout::Role::Route);
  EXPECT_TRUE(k.wires && k.vias);
  EXPECT_EQ(k.layers, LayerMask(1) << (*p)->findLayer("Top"));
  ASSERT_EQ(k.shape.size(), 1u);
  EXPECT_EQ(k.shape[0].kind, GraphicKind::Line);

  auto m = io::loadBoard(data("topor/Example_05/MinVia.fst"));
  ASSERT_TRUE(m) << m.error();
  Board& b = **m;
  EXPECT_EQ(b.texts.size(), 34u);
  EXPECT_GT(b.textStyles.size(), 1u);
  ASSERT_FALSE(b.zones.empty() && b.copperCount() == 0);
  // A cutout in a copper area of our own.
  Zone z;
  z.layer = b.topCopper();
  z.outline = {{0, 0}, {10e6, 0}, {10e6, 10e6}, {0, 10e6}};
  z.cutouts.push_back({{2e6, 2e6}, {4e6, 2e6}, {4e6, 4e6}});
  b.zones.push_back(z);
  auto again = io::readFst(io::writeFst(b), "rt.fst");
  ASSERT_TRUE(again) << again.error();
  const Board& c = **again;
  ASSERT_EQ(c.texts.size(), b.texts.size());
  for (size_t i = 0; i < b.texts.size(); ++i) {
    EXPECT_EQ(c.texts[i].text, b.texts[i].text);
    EXPECT_EQ(c.layers[c.texts[i].layer].name, b.layers[b.texts[i].layer].name);
    EXPECT_EQ(c.styleOf(c.texts[i]).name, b.styleOf(b.texts[i]).name);
    EXPECT_NEAR(c.texts[i].pos.x, b.texts[i].pos.x, 100);
    EXPECT_NEAR(c.texts[i].pos.y, b.texts[i].pos.y, 100);
  }
  ASSERT_FALSE(c.zones.empty());
  EXPECT_EQ(c.zones.back().cutouts.size(), 1u);

  auto a = io::loadBoard(data("topor/Example_04/Arcs.fst"));
  ASSERT_TRUE(a) << a.error();
  ASSERT_EQ((*a)->keepouts.size(), 1u);
  EXPECT_EQ((*a)->keepouts[0].layers, 0u);  // all layers
  auto ar = io::readFst(io::writeFst(**a), "rt.fst");
  ASSERT_TRUE(ar) << ar.error();
  ASSERT_EQ((*ar)->keepouts.size(), 1u);
  EXPECT_EQ((*ar)->keepouts[0].shape.size(), (*a)->keepouts[0].shape.size());
}

// Keepouts go to KiCad as rule areas and come back.
TEST(FstIO, KeepoutsToKicad) {
  auto a = io::loadBoard(data("topor/Example_04/Arcs.fst"));
  ASSERT_TRUE(a) << a.error();
  Board& b = **a;
  Keepout k;
  k.vias = false;
  k.layers = LayerMask(1) << b.topCopper();
  Graphic g;
  g.kind = GraphicKind::Poly;
  g.filled = true;
  g.pts = {{0, 0}, {5e6, 0}, {5e6, 5e6}, {0, 5e6}};
  k.shape.push_back(g);
  b.keepouts.push_back(k);
  std::string out = ::testing::TempDir() + "xr_keepouts.kicad_pcb";
  ASSERT_TRUE(io::saveBoard(b, out));
  auto r = io::loadBoard(out);
  ASSERT_TRUE(r) << r.error();
  ASSERT_EQ((*r)->keepouts.size(), 1u);  // the line keepout of Arcs has no KiCad form
  EXPECT_TRUE((*r)->keepouts[0].wires);
  EXPECT_FALSE((*r)->keepouts[0].vias);
  EXPECT_EQ((*r)->keepouts[0].layers, LayerMask(1) << (*r)->topCopper());
  EXPECT_EQ((*r)->zones.size(), b.zones.size());
}

// The nets' properties of TopoR's file: the flexible fixation and «Трассировать» are read, written for every
// net and read back.
TEST(FstIO, NetPropertiesRoundTrip) {
  auto r = io::loadBoard(data("topor/Example_04/Arcs_standard_routing.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& a = **r;
  ASSERT_GE(a.nets.size(), 3u);
  for (const Net& n : a.nets) {
    EXPECT_FALSE(n.flexFixed) << n.name;  // the file has flexfix="off" route="on" for every net
    EXPECT_TRUE(n.route) << n.name;
  }
  a.nets[1].flexFixed = true;
  a.nets[1].route = false;
  a.nets[2].route = false;
  std::string text = io::writeFst(a);
  EXPECT_NE(text.find("<NetProperty flexfix=\"on\" route=\"off\">"), std::string::npos);
  auto again = io::readFst(text, "np.fst");
  ASSERT_TRUE(again) << again.error();
  const Board& c = **again;
  ASSERT_EQ(c.nets.size(), a.nets.size());
  for (size_t i = 0; i < a.nets.size(); ++i) {
    const int j = c.findNet(a.nets[i].name);
    ASSERT_GE(j, 0) << a.nets[i].name;
    EXPECT_EQ(c.nets[size_t(j)].flexFixed, a.nets[i].flexFixed) << a.nets[i].name;
    EXPECT_EQ(c.nets[size_t(j)].route, a.nets[i].route) << a.nets[i].name;
  }
}
