// Pad stacks («Стеки КП»): reading and writing them in TopoR's format, the pads following their stacks, the
// details on the solder mask and paste layers.
#include <gtest/gtest.h>

#include <algorithm>
#include <fstream>
#include <sstream>

#include "core/Edit.h"
#include "core/Padstack.h"
#include "drc/Drc.h"
#include "io/gerber/GerberWriter.h"
#include "io/BoardIO.h"
#include "io/topor/Fst.h"

using namespace xr;

static std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

static std::string readText(const std::string& path) {
  std::ifstream f(path, std::ios::binary);
  std::stringstream s;
  s << f.rdbuf();
  return s.str();
}

static int stackIndex(const Board& b, const std::string& name) {
  for (size_t i = 0; i < b.padstacks.size(); ++i)
    if (b.padstacks[i].name == name) return int(i);
  return -1;
}

static const PadDetail* named(const Padstack& ps, const std::string& layer) {
  for (auto& d : ps.details)
    if (d.layer == layer) return &d;
  return nullptr;
}

// Arcs_master with the pads of one stack replaced: the text between <Padstack name="NAME"...> and its end.
static std::string withStack(const std::string& text, const std::string& name, const std::string& stack) {
  size_t a = text.find("<Padstack name=\"" + name + "\"");
  size_t e = text.find("</Padstack>", a);
  EXPECT_NE(a, std::string::npos);
  return text.substr(0, a) + stack + text.substr(e + std::string("</Padstack>").size());
}

// The stacks of a TopoR design as TopoR shows them in «Контактные площадки (КП)»: 9, two not used.
TEST(Padstack, ReadsTheStacksOfADesign) {
  auto r = io::loadBoard(data("topor/Example_04/Arcs_master_f5.fst"));
  ASSERT_TRUE(r) << r.error();
  const Board& b = **r;
  ASSERT_EQ(b.padstacks.size(), 9u);
  auto use = padstackUse(b);
  EXPECT_EQ(r::count(use, 0), 2);
  EXPECT_EQ(use[size_t(stackIndex(b, "(Default)"))], 0);
  EXPECT_EQ(use[size_t(stackIndex(b, "C140R.PS"))], 0);
  const Padstack& smd = b.padstacks[size_t(stackIndex(b, "C35LH.PS"))];
  EXPECT_EQ(smd.type, PadstackType::SMD);
  const Padstack& sq = b.padstacks[size_t(stackIndex(b, "C150S.PS"))];
  EXPECT_EQ(sq.type, PadstackType::Through);
  EXPECT_EQ(sq.drill, mmToNm(0.508));
  ASSERT_NE(named(sq, "Top"), nullptr);
  EXPECT_EQ(named(sq, "Top")->form, PadDetail::Form::Rect);
  EXPECT_EQ(named(sq, "Top")->w, mmToNm(1.5));
  for (auto& p : b.pads) {
    ASSERT_GE(p.padstack, 0) << p.number;
    EXPECT_TRUE(p.uniform);
  }
  // Nothing on the mask yet: no shape there.
  LayerId topMask = b.findLayer("TopMask");
  ASSERT_GE(topMask, 0);
  EXPECT_FALSE(padShapeOn(b, b.pads[0], topMask));
  EXPECT_TRUE(padShapeOn(b, b.pads[0], b.topCopper()));
}

// What TopoR writes in a stack comes back as it was: mask and paste details, cut and rounded corners, the
// shift of a detail, the thermal; entries without a layer (designs from P-CAD) are the signal and plane ones.
TEST(Padstack, FstRoundTrip) {
  std::string text = readText(data("topor/Example_04/Arcs_master_f5.fst"));
  text = withStack(text, "C150S.PS", R"x(<Padstack name="C150S.PS" holeDiameter="0.508" metallized="on" connectToCopper="Direct">
    <Thermal spokeNum="2" minSpokeNum="2" angle="30" spokeWidth="0.3" backoff="0.25"/>
    <Pads>
      <PadRect width="1.5" height="1.5" handling="Chamfer" handlingValue="0.3" custom="on" cornerLB="on" cornerRB="off" cornerRT="off" cornerLT="off">
        <LayerRef name="Top"/>
      </PadRect>
      <PadRect width="1.5" height="1.5"/>
      <PadCircle diameter="1.2"/>
      <PadRect width="1.7" height="1.7" handling="Rounding" handlingValue="0.2"><LayerRef name="TopMask"/></PadRect>
      <PadOval diameter="1"><LayerRef name="TopPaste"/><Stretch x="0.4" y="0"/><Shift x="0.1" y="0"/></PadOval>
    </Pads>
  </Padstack>)x");
  text = withStack(text, "(Default)", R"x(<Padstack name="(Default)" type="MountingHole" holeDiameter="3" metallized="off"><Pads/></Padstack>)x");
  auto r = io::readFst(text, "rt.fst");
  ASSERT_TRUE(r) << r.error();
  const Board& b = **r;
  const Padstack& ps = b.padstacks[size_t(stackIndex(b, "C150S.PS"))];
  EXPECT_EQ(ps.connect, PadConnect::Direct);
  EXPECT_EQ(ps.thermal.spokes, 2);
  EXPECT_EQ(ps.thermal.spokeWidth, mmToNm(0.3));
  ASSERT_EQ(ps.details.size(), 5u);
  const PadDetail* top = named(ps, "Top");
  ASSERT_TRUE(top);
  EXPECT_EQ(top->handling, CornerHandling::Chamfer);
  EXPECT_TRUE(top->custom);
  EXPECT_EQ(top->corners, kCornerLB);
  EXPECT_EQ(ps.details[1].layerClass, "Signal");
  EXPECT_EQ(ps.details[2].layerClass, "Plane");
  const PadDetail* paste = named(ps, "TopPaste");
  ASSERT_TRUE(paste);
  EXPECT_EQ(paste->form, PadDetail::Form::Oval);
  EXPECT_NEAR(paste->shift.x, double(mmToNm(0.1)), 1);
  EXPECT_EQ(b.padstacks[size_t(stackIndex(b, "(Default)"))].type, PadstackType::MountHole);
  EXPECT_FALSE(b.padstacks[size_t(stackIndex(b, "(Default)"))].plated);
  // A pad of the stack: the chamfered shape is a polygon on the top, a plain square on the bottom.
  auto pi = r::find(b.pads, stackIndex(b, "C150S.PS"), &Pad::padstack);
  ASSERT_NE(pi, b.pads.end());
  EXPECT_EQ(pi->shape.kind, PadShapeKind::Polygon);
  EXPECT_FALSE(pi->uniform);
  auto onBottom = padShapeOn(b, *pi, b.bottomCopper());
  ASSERT_TRUE(onBottom);
  EXPECT_NEAR(onBottom->bbox().width(), double(mmToNm(1.5)), 10);
  auto mask = padShapeOn(b, *pi, b.findLayer("TopMask"));
  ASSERT_TRUE(mask);
  EXPECT_NEAR(mask->bbox().width(), double(mmToNm(1.7)), 10);
  EXPECT_FALSE(padShapeOn(b, *pi, b.findLayer("BotMask")));

  auto again = io::readFst(io::writeFst(b), "rt2.fst");
  ASSERT_TRUE(again) << again.error();
  ASSERT_EQ((*again)->padstacks.size(), b.padstacks.size());
  for (size_t i = 0; i < b.padstacks.size(); ++i) {
    const Padstack& x = b.padstacks[i];
    int j = stackIndex(**again, x.name);
    ASSERT_GE(j, 0) << x.name;
    EXPECT_EQ((*again)->padstacks[size_t(j)], x) << x.name;
  }
  for (size_t i = 0; i < b.pads.size(); ++i) {
    EXPECT_EQ((*again)->padstacks[size_t((*again)->pads[i].padstack)].name, b.padstacks[size_t(b.pads[i].padstack)].name);
    EXPECT_LT(((*again)->pads[i].pos.v() - b.pads[i].pos.v()).len(), 2);
  }
}

// «Создать детали на слоях»: the mask grows out of the pad on the outer copper of its side, the paste shrinks
// into it; «Пропустить» keeps what is there; a planar stack has nothing on the other side.
TEST(Padstack, MaskAndPasteDetails) {
  auto r = io::loadBoard(data("topor/Example_04/Arcs_master_f5.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  LayerId topMask = b.findLayer("TopMask"), botMask = b.findLayer("BotMask"), topPaste = b.findLayer("TopPaste");
  int round = stackIndex(b, "N150R.PS"), square = stackIndex(b, "N150S.PS"), smd = stackIndex(b, "C35LH.PS");
  std::vector<Padstack> stacks = b.padstacks;
  auto res = createLayerDetails(b, stacks, {round, square, smd}, topMask, mmToNm(0.1), true);
  ASSERT_EQ(res.stacks.size(), 3u);
  for (auto& [si, kind] : res.stacks) EXPECT_EQ(kind, LayerDetailsResult::Kind::Added) << si;
  EXPECT_EQ(named(stacks[size_t(round)], "TopMask")->w, mmToNm(1.7));
  EXPECT_EQ(named(stacks[size_t(square)], "TopMask")->w, mmToNm(1.7));
  EXPECT_EQ(named(stacks[size_t(square)], "TopMask")->h, mmToNm(1.7));
  res = createLayerDetails(b, stacks, {round, smd}, botMask, mmToNm(0.1), true);
  EXPECT_EQ(res.stacks[0].second, LayerDetailsResult::Kind::Added);
  EXPECT_EQ(res.stacks[1].second, LayerDetailsResult::Kind::Failed);
  res = createLayerDetails(b, stacks, {round}, topMask, mmToNm(0.3), false);
  EXPECT_EQ(res.stacks[0].second, LayerDetailsResult::Kind::Kept);
  EXPECT_EQ(named(stacks[size_t(round)], "TopMask")->w, mmToNm(1.7));
  res = createLayerDetails(b, stacks, {round}, topMask, mmToNm(0.3), true);
  EXPECT_EQ(res.stacks[0].second, LayerDetailsResult::Kind::Replaced);
  EXPECT_EQ(named(stacks[size_t(round)], "TopMask")->w, mmToNm(2.1));
  res = createLayerDetails(b, stacks, {square}, topPaste, -mmToNm(0.1), true);
  EXPECT_EQ(named(stacks[size_t(square)], "TopPaste")->w, mmToNm(1.3));
  // Too much paste offset leaves nothing.
  res = createLayerDetails(b, stacks, {square}, topPaste, -mmToNm(1), true);
  EXPECT_EQ(res.stacks[0].second, LayerDetailsResult::Kind::Failed);
  deleteLayerDetails(b, stacks, {round}, botMask);
  EXPECT_EQ(named(stacks[size_t(round)], "BotMask"), nullptr);

  // On the board: the pads of the stack have their mask opening.
  std::vector<int> origin(stacks.size());
  for (size_t i = 0; i < origin.size(); ++i) origin[i] = int(i);
  setPadstacks(b, stacks, origin);
  auto pi = r::find(b.pads, square, &Pad::padstack);
  ASSERT_NE(pi, b.pads.end());
  auto m = padShapeOn(b, *pi, topMask);
  ASSERT_TRUE(m);
  EXPECT_NEAR(m->bbox().width(), double(mmToNm(1.7)), 10);
}

// «Габариты»: the rectangle in the component's own frame, turned with it — the same at 30 degrees as at its own
// angle; the mask openings of its pads and the line width of its drawings count.
TEST(Padstack, ComponentBoundsTurnWithIt) {
  auto r = io::loadBoard(data("topor/Example_04/Arcs_master_f5.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  LayerId topMask = b.findLayer("TopMask");
  auto only = [&](LayerKind k) { return [&b, k](LayerId l) { return l >= 0 && b.layers[size_t(l)].kind == k; }; };
  // A top-side component with pads and drawings of a width (Arcs_master's are on TopAssy, 0.01 mm).
  int ci = -1;
  LayerKind drawn = LayerKind::Silk;
  for (int i = 0; i < int(b.components.size()) && ci < 0; ++i) {
    const Component& c = b.components[size_t(i)];
    if (c.side != Side::Top || c.pads.size() < 2) continue;
    for (auto& g : c.graphics)
      if (g.layer >= 0 && g.width > 0) {
        ci = i;
        drawn = b.layers[size_t(g.layer)].kind;
        break;
      }
  }
  ASSERT_GE(ci, 0);
  const Component& c = b.components[size_t(ci)];

  // The drawings: their lines' points in the component's frame, half the width out; wider than the points alone.
  BBox silk = componentBounds(b, ci, only(drawn)), pts, wide;
  for (auto& g : c.graphics)
    if (only(drawn)(g.layer))
      for (Vec2 v : g.path(2000)) {
        Vec2 q = c.toLocal(v), h{double(g.width) / 2, double(g.width) / 2};
        pts.add(q);
        wide.add(q - h);
        wide.add(q + h);
      }
  EXPECT_GT(silk.width(), pts.width());
  EXPECT_NEAR(silk.minX, wide.minX, 1);
  EXPECT_NEAR(silk.maxX, wide.maxX, 1);
  EXPECT_NEAR(silk.minY, wide.minY, 1);
  EXPECT_NEAR(silk.maxY, wide.maxY, 1);

  // The mask: an opening 0.3 mm round every pad widens the pads' rectangle by 0.3 mm on each side.
  BBox pads = componentBounds(b, ci, only(LayerKind::Mask));
  std::vector<Padstack> stacks = b.padstacks;
  std::vector<int> all(stacks.size()), origin(stacks.size());
  for (size_t i = 0; i < all.size(); ++i) all[i] = origin[i] = int(i);
  createLayerDetails(b, stacks, all, topMask, mmToNm(0.3), true);
  setPadstacks(b, stacks, origin);
  BBox mask = componentBounds(b, ci, only(LayerKind::Mask));
  EXPECT_NEAR(mask.minX, pads.minX - mmToNm(0.3), 1000);
  EXPECT_NEAR(mask.maxY, pads.maxY + mmToNm(0.3), 1000);
  EXPECT_EQ(componentBounds(b, ci, only(drawn)).width(), silk.width());  // a hidden mask layer is left out

  // Turned by 30 degrees: the same rectangle in its frame, not the box round the turned component.
  BBox before = componentBounds(b, ci);
  edit::Fragment f;
  f.components = {ci};
  edit::Motion m;
  m.pivot = c.pos.v();
  m.rotate = 30;
  b.components[size_t(ci)].locked = false;
  ASSERT_TRUE(edit::move(b, f, m));
  BBox after = componentBounds(b, ci);
  EXPECT_NEAR(after.minX, before.minX, 5);
  EXPECT_NEAR(after.minY, before.minY, 5);
  EXPECT_NEAR(after.maxX, before.maxX, 5);
  EXPECT_NEAR(after.maxY, before.maxY, 5);
}

// The chamfer and the rounding grow with the offset like the outline does.
TEST(Padstack, OffsetDetail) {
  PadDetail d;
  d.form = PadDetail::Form::Rect;
  d.w = mmToNm(2);
  d.h = mmToNm(1);
  d.handling = CornerHandling::Rounding;
  d.handlingValue = mmToNm(0.2);
  auto g = offsetDetail(d, mmToNm(0.1));
  ASSERT_TRUE(g);
  EXPECT_EQ(g->handlingValue, mmToNm(0.3));
  auto s = offsetDetail(d, -mmToNm(0.2));
  ASSERT_TRUE(s);
  EXPECT_EQ(s->handling, CornerHandling::None);
  d.form = PadDetail::Form::Polygon;
  d.poly = {{0, 0}, {double(mmToNm(1)), 0}, {0, double(mmToNm(1))}};
  auto p = offsetDetail(d, mmToNm(0.1));
  ASSERT_TRUE(p);
  EXPECT_GT(p->w, mmToNm(1.2));
  EXPECT_FALSE(offsetDetail(d, -mmToNm(1)));
}

// A pad whose detail moves (its shift) moves on the board; the footprint keeps the stack's anchor point.
TEST(Padstack, ShiftMovesThePad) {
  auto r = io::loadBoard(data("topor/Example_04/Arcs_master_f5.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  int sq = stackIndex(b, "N150S.PS");
  auto pi = size_t(r::find(b.pads, sq, &Pad::padstack) - b.pads.begin());
  ASSERT_LT(pi, b.pads.size());
  Vec2 before = b.pads[pi].pos.v();
  double angle = b.pads[pi].angle;
  std::vector<Padstack> stacks = b.padstacks;
  for (auto& d : stacks[size_t(sq)].details) d.shift = {double(mmToNm(0.5)), 0};
  std::vector<int> origin(stacks.size());
  for (size_t i = 0; i < origin.size(); ++i) origin[i] = int(i);
  setPadstacks(b, stacks, origin);
  Vec2 moved = b.pads[pi].pos.v() - before;
  EXPECT_NEAR((moved - rotateBoard({double(mmToNm(0.5)), 0}, angle)).len(), 0, 2);
  auto again = io::readFst(io::writeFst(b), "shift.fst");
  ASSERT_TRUE(again) << again.error();
  EXPECT_LT(((*again)->pads[pi].pos.v() - b.pads[pi].pos.v()).len(), 2);
}

// Designs from other CADs: alike pads share a stack, named after the source's pad style where it has one.
TEST(Padstack, BuiltForOtherFormats) {
  auto r = io::loadBoard(data("astable.kicad_pcb"));
  ASSERT_TRUE(r) << r.error();
  const Board& b = **r;
  ASSERT_FALSE(b.padstacks.empty());
  for (auto& p : b.pads) {
    ASSERT_GE(p.padstack, 0);
    const Padstack& ps = b.padstacks[size_t(p.padstack)];
    EXPECT_EQ(ps.drill, p.drill);
    PadShape s = detailShape(*primaryDetail(b, ps, p.bottomSide), p.mirror);
    EXPECT_EQ(s.kind, p.shape.kind);
    EXPECT_EQ(s.w, p.shape.w);
    EXPECT_EQ(s.h, p.shape.h);
  }
  EXPECT_LT(b.padstacks.size(), b.pads.size());
  auto pc = io::loadBoard(data("el4134_pcad_ascii.pcb"));
  ASSERT_TRUE(pc) << pc.error();
  for (auto& p : (*pc)->pads) ASSERT_GE(p.padstack, 0);
  // P-CAD pad styles keep their names.
  EXPECT_TRUE(r::none_of((*pc)->padstacks, [](const Padstack& s) { return s.name.ends_with("_SMD"); }));
}

// A pad bigger on one copper layer than on the others is checked there by its size there.
TEST(Padstack, DrcByTheLayersShape) {
  auto r = io::loadBoard(data("topor/Example_04/Arcs_master_f5.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  DrcOptions opt;
  opt.unconnected = false;
  int round = stackIndex(b, "N150R.PS");
  // Violations of the round pads layer by layer.
  auto ofRound = [&](const std::vector<DrcViolation>& vs, LayerId l) {
    int n = 0;
    for (auto& v : vs)
      if (v.layer == l && ((v.a.type == ItemType::Pad && b.pads[v.a.index].padstack == round) ||
                           (v.hasB && v.b.type == ItemType::Pad && b.pads[v.b.index].padstack == round)))
        ++n;
    return n;
  };
  auto before = runDrc(b, opt);
  std::vector<Padstack> stacks = b.padstacks;
  PadDetail big = *named(stacks[size_t(round)], "Bottom");
  big.w = big.h = mmToNm(3.5);
  *r::find(stacks[size_t(round)].details, std::string("Bottom"), &PadDetail::layer) = big;
  std::vector<int> origin(stacks.size());
  for (size_t i = 0; i < origin.size(); ++i) origin[i] = int(i);
  setPadstacks(b, stacks, origin);
  auto pi = r::find(b.pads, round, &Pad::padstack);
  ASSERT_NE(pi, b.pads.end());
  EXPECT_FALSE(pi->uniform);
  EXPECT_EQ(pi->shape.w, mmToNm(1.5));  // the routing still sees the top one
  auto after = runDrc(b, opt);
  EXPECT_EQ(ofRound(after, b.topCopper()), ofRound(before, b.topCopper()));
  EXPECT_GT(ofRound(after, b.bottomCopper()), ofRound(before, b.bottomCopper()));
}

// The mask Gerber opens a pad by its stack's mask detail; stacks without any mask detail get the old opening.
TEST(Padstack, GerberMaskFromTheDetails) {
  auto r = io::loadBoard(data("topor/Example_04/Arcs_master_f5.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  auto mask = [&] {
    for (auto& f : io::makeGerbers(b))
      if (f.name.ends_with("F_Mask.gbr")) return f.content;
    return std::string();
  };
  std::string old = mask();
  EXPECT_NE(old.find("C,1.6"), std::string::npos);   // 1.5 mm pads + 2 x 0.05
  EXPECT_EQ(old.find("C,1.7"), std::string::npos);
  int round = stackIndex(b, "N150R.PS");
  std::vector<Padstack> stacks = b.padstacks;
  createLayerDetails(b, stacks, {round}, b.findLayer("TopMask"), mmToNm(0.1), true);
  std::vector<int> origin(stacks.size());
  for (size_t i = 0; i < origin.size(); ++i) origin[i] = int(i);
  setPadstacks(b, stacks, origin);
  std::string now = mask();
  EXPECT_NE(now.find("C,1.7"), std::string::npos);
  EXPECT_NE(now.find("C,1.6"), std::string::npos);  // the other round stacks as before
}

// Via types keep their pads layer by layer, the layer range and «ПО на контакте»; a mask pad opens the mask
// over the vias of the type.
TEST(Padstack, ViaTypesLayerByLayer) {
  std::string text = readText(data("topor/Example_04/Arcs_master_f5.fst"));
  size_t a = text.find("<Viastack name=\"C140R.PS\"");
  size_t e = text.find("</Viastack>", a);
  ASSERT_NE(a, std::string::npos);
  text = text.substr(0, a) + R"x(<Viastack name="C140R.PS" holeDiameter="0.6" viaOnPin="on">
        <LayerRange><LayerRef name="Top"/><LayerRef name="Bottom"/></LayerRange>
        <ViaPads>
          <PadCircle diameter="1.4"><LayerTypeRef type="Signal"/></PadCircle>
          <PadCircle diameter="1.2"><LayerTypeRef type="Mask"/></PadCircle>
          <PadCircle diameter="1.3"><LayerRef name="BotMask"/></PadCircle>
        </ViaPads>
      )x" + text.substr(e);
  auto r = io::readFst(text, "via.fst");
  ASSERT_TRUE(r) << r.error();
  const Board& b = **r;
  ASSERT_TRUE(b.rules);
  auto t = r::find(b.rules->viaTypes, std::string("C140R.PS"), &ViaType::name);
  ASSERT_NE(t, b.rules->viaTypes.end());
  EXPECT_EQ(t->diameter, mmToNm(1.4));
  EXPECT_TRUE(t->viaOnPin);
  EXPECT_EQ(t->from, "Top");
  EXPECT_EQ(t->to, "Bottom");
  EXPECT_EQ(viaPadDiameter(*t, "Mask", "TopMask"), mmToNm(1.2));
  EXPECT_EQ(viaPadDiameter(*t, "Mask", "BotMask"), mmToNm(1.3));
  EXPECT_EQ(viaPadDiameter(*t, "Paste", "TopPaste"), 0);
  auto v = r::find(b.vias, mmToNm(1.4), &Via::diameter);
  ASSERT_NE(v, b.vias.end());
  EXPECT_EQ(viaDiameterOn(b, *v, b.findLayer("TopMask")), mmToNm(1.2));
  EXPECT_EQ(viaDiameterOn(b, *v, b.findLayer("BotMask")), mmToNm(1.3));
  EXPECT_EQ(viaDiameterOn(b, *v, b.findLayer("TopPaste")), 0);
  for (auto& f : io::makeGerbers(b))
    if (f.name.ends_with("B_Mask.gbr")) EXPECT_NE(f.content.find("C,1.3"), std::string::npos);

  auto again = io::readFst(io::writeFst(b), "via2.fst");
  ASSERT_TRUE(again) << again.error();
  auto t2 = r::find((*again)->rules->viaTypes, std::string("C140R.PS"), &ViaType::name);
  ASSERT_NE(t2, (*again)->rules->viaTypes.end());
  EXPECT_EQ(t2->viaOnPin, true);
  EXPECT_EQ(t2->from, "Top");
  EXPECT_EQ(t2->to, "Bottom");
  EXPECT_EQ(t2->pads, t->pads);
}
