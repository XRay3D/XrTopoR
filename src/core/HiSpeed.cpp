#include "core/HiSpeed.h"

#include <set>

#include "core/Board.h"

namespace xr {

const Impedance* HiSpeed::impedance(std::string_view name) const {
  for (const Impedance& z : impedances)
    if (z.name == name) return &z;
  return nullptr;
}

const SignalCluster* HiSpeed::clusterOf(std::string_view signal) const {
  for (const SignalCluster& c : clusters)
    for (const Signal& s : c.signalList)
      if (s.name == signal) return &c;
  return nullptr;
}

int HiSpeed::diffSignal(std::string_view name) const {
  for (size_t i = 0; i < diffSignals.size(); ++i)
    if (diffSignals[i].name == name) return int(i);
  return -1;
}

std::vector<std::string> HiSpeed::netsOf(const ObjectSignal& o) const {
  std::vector<std::string> out;
  std::set<std::string> seenGroups;
  auto add = [&](auto&& self, const ObjectSignal& x) -> void {
    switch (x.kind) {
      case ObjectSignal::Kind::Signal:
        if (const SignalCluster* c = clusterOf(x.name)) out.insert(out.end(), c->nets.begin(), c->nets.end());
        break;
      case ObjectSignal::Kind::DiffSignal:
        if (int d = diffSignal(x.name); d >= 0) {
          self(self, {ObjectSignal::Kind::Signal, diffSignals[size_t(d)].signalA});
          self(self, {ObjectSignal::Kind::Signal, diffSignals[size_t(d)].signalB});
        }
        break;
      case ObjectSignal::Kind::SignalGroup:
        if (!seenGroups.insert(x.name).second) break;
        for (const SignalGroup& g : groups)
          if (g.name == x.name)
            for (const ObjectSignal& m : g.members) self(self, m);
        break;
    }
  };
  add(add, o);
  return out;
}

bool Board::pairRule(int pair, LayerId layer, Coord& width, Coord& gap) const {
  if (pair < 0 || pair >= int(hispeed.diffSignals.size()) || layer < 0 || layer >= LayerId(layers.size())) return false;
  const Impedance* z = hispeed.impedance(hispeed.diffSignals[size_t(pair)].impedance);
  if (!z) return false;
  const ImpedanceLayerRule* r = z->on(layers[size_t(layer)].name);
  if (!r) return false;
  width = r->width;
  gap = r->gap;
  return true;
}

void Board::removeZip(int z) {
  if (z < 0 || z >= int(zips.size())) return;
  zips.erase(zips.begin() + z);
  for (Track& t : tracks) {
    if (t.zip == z) t.zip = -1;
    else if (t.zip > z) --t.zip;
  }
}

}  // namespace xr
