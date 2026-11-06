#pragma once
// «Стеки КП»: pad types shared by pads (TopoR's Padstack). A pad of a stack takes its copper shape, hole and
// copper layers from the stack (syncPadsFromStacks); its shape on another layer — an inner layer with a
// smaller pad, the solder mask, the paste — is the stack's detail there (padShapeOn).
#include <optional>
#include <string>
#include <vector>

#include "core/Board.h"

namespace xr {

// TopoR's type of a layer, the class its details go by: "Signal", "Plane", "Mask", "Paste", "Silk", "Assy",
// "Mechanical"; empty for the board outline.
std::string layerClassOf(const Board& b, LayerId l);
// The board layer a detail's named layer is for a pad on the bottom side (`bottomSide`: «Top» → the bottom
// copper, «TopMask» → the bottom mask) or on the top; -1: the design has no such layer.
LayerId detailLayer(const Board& b, const std::string& name, bool bottomSide);
// The detail of a stack on a board layer: the layer's own, else that of its class; nullptr: nothing there.
// A planar (SMD) stack has nothing on the layers of the other side.
const PadDetail* detailOn(const Board& b, const Padstack& ps, LayerId l, bool bottomSide);
// The detail Pad::shape is made from: on the outer copper of the pad's side, else the first copper one.
const PadDetail* primaryDetail(const Board& b, const Padstack& ps, bool bottomSide);
// The pad shape of a detail (centred on the detail), mirrored for a bottom-side pad.
PadShape detailShape(const PadDetail& d, bool mirror);
// The detail's centre from the pad's anchor point on the board, for a pad at `angle`.
Vec2 detailOffset(const PadDetail& d, bool mirror, double angle);
// The shape of a pad on a layer (copper, mask, paste...): its stack's detail there; a pad without a stack has
// its own shape on its copper layers. nullopt: nothing on that layer.
std::optional<Shape> padShapeOn(const Board& b, const Pad& p, LayerId l, double expand = 0);

// The via type of a via: the rules' type of its pad and hole sizes; nullptr: none.
const ViaType* viaTypeOf(const Board& b, const Via& v);
// The copper layers a via of the type spans: its range from `from` to `to`; all of them when it names none.
LayerMask viaTypeLayers(const Board& b, const ViaType& t);
// The diameter of a via's pad on a layer: its copper, or its type's pad on a mask (paste...) layer of a side the
// via reaches; 0: nothing there.
Coord viaDiameterOn(const Board& b, const Via& v, LayerId l);

// Pads follow their stacks: shape, hole, plating, copper layers. A pad keeps its anchor point, so when the
// detail its shape comes from has moved (its shift) the pad's centre moves with it; `before` are the stacks
// the pads were made from, index for index (empty: nothing moved).
void syncPadsFromStacks(Board& b, const std::vector<Padstack>& before = {});
// Pad::uniform of every pad of a stack.
void updatePadUniform(Board& b);
// Gives every pad without a stack one: pads alike share it. `names[i]` (if given) names the stack of pad i —
// the source's pad style — else the name is made from the shape («C1.5_D0.9», «R1.2x0.6_SMD»).
void buildPadstacksFromPads(Board& b, const std::vector<std::string>& names = {});
// Replaces the board's stacks; `origin[i]` is the index stack i had on the board (-1: new). Pads are renumbered
// and follow the stacks (syncPadsFromStacks). Stacks still in use must not be left out.
void setPadstacks(Board& b, std::vector<Padstack> stacks, const std::vector<int>& origin);
// Whether a stack has a detail on any layer of a kind (Mask, Paste...), by class or by name.
bool padstackHasDetails(const Board& b, const Padstack& ps, LayerKind kind);
// How many pads use each stack.
std::vector<int> padstackUse(const Board& b);
// A stack name not taken yet, from `base`.
std::string uniquePadstackName(const std::vector<Padstack>& stacks, const std::string& base);

// «Создать детали на слоях»: a detail on `target` (a mask or paste layer of one side) in each stack of
// `which`, of the shape of the stack's detail on the outer copper of that side, grown by `offset` (nm; the
// mask goes out, the paste in: a negative offset). `replace`: a detail already there is replaced, else kept.
struct LayerDetailsResult {
  enum class Kind { Added, Replaced, Kept, Failed };
  std::vector<std::pair<int, Kind>> stacks;  // stack, what happened
};
LayerDetailsResult createLayerDetails(const Board& b, std::vector<Padstack>& stacks, const std::vector<int>& which,
                                      LayerId target, Coord offset, bool replace);
// «Удалить детали на слое»: the stacks of `which` have nothing on `target` any more (a class detail stays on the
// other layers of its class).
void deleteLayerDetails(const Board& b, std::vector<Padstack>& stacks, const std::vector<int>& which, LayerId target);
// The detail grown by `offset` on every side (negative: shrunk); nullopt when nothing is left of it.
std::optional<PadDetail> offsetDetail(const PadDetail& d, Coord offset);

}  // namespace xr
