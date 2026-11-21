#pragma once
// The settings TopoR keeps with a design besides its rules: how labels turn with their components («Настройки
// редактирования»), which pads take a wire at their corners («Настройки подсоединения проводников к КП»), which
// warnings are shown («Фильтр сообщений»). As the .fst has them: Settings/Labels, Rules/PadConnectSettings,
// DialogSettings/MessageFilter.
#include <array>
#include <string>
#include <utility>
#include <vector>

namespace xr {

// «Ярлыки»: a label turns with its component or keeps its angle; with the rules of orientation a label that comes
// out horizontal or vertical is put the way its side asks — horizontal at 0° or (`…HorzRotate`) 180°, vertical at
// 90° or (`…VertRotate`) 270°. A label at any other angle is left as it is.
struct LabelSettings {
  bool rotateWithComp = true;
  bool useOrientRules = false;
  bool topHorzRotate = false, topVertRotate = false, bottomHorzRotate = false, bottomVertRotate = false;
  bool operator==(const LabelSettings&) const = default;
};

// Which rectangular pads take a wire at their corners. Auto: those whose corner is rounded or cut by more than
// half the wire's width, and the pad stacks and pins listed; AllPads: every one.
struct PadConnectSettings {
  enum class Mode { Auto, AllPads } mode = Mode::Auto;
  std::vector<std::string> padstacks;  // by name
  struct Pin {
    std::string comp, pin;
    bool operator==(const Pin&) const = default;
  };
  std::vector<Pin> pins;
  bool operator==(const PadConnectSettings&) const = default;
};

// The warnings of the editor that are shown: all, none, or those ticked.
struct MessageFilter {
  enum class Mode { Checked, All, Nothing } mode = Mode::Checked;
  // TopoR's numbers of the warnings that can be switched: 5003 a loop in a net, 5012 a via on the board's outline,
  // 5013 a pad across a copper area, 5014 a via on a copper area, 5015 a copper area across the outline, 5016 copper
  // areas across each other, 5017 a fixed wire across a pad, 5018 a fixed wire across a via, 5023 a pad on a routing
  // keepout, 5024 a via on a routing keepout, 5026 a copper area across a keepout, 5034 a loose component across the
  // outline, 5036 loose components across each other, 5037 a via not needed.
  static constexpr std::array<int, 14> kCodes{5003, 5012, 5013, 5014, 5015, 5016, 5017, 5018, 5023, 5024, 5026, 5034, 5036, 5037};
  std::array<bool, 14> on{true, true, true, true, true, true, true, true, true, true, true, true, true, true};
  // The quick checks of clearance (TopoR's online DRC): between components, between objects of one net.
  bool clearanceBetweenComps = false, clearanceInNet = false;
  // Whether a warning of the number is shown; a number that cannot be switched always is.
  bool shows(int code) const {
    for (size_t i = 0; i < kCodes.size(); ++i)
      if (kCodes[i] == code) return mode == Mode::All || (mode == Mode::Checked && on[i]);
    return true;
  }
  bool operator==(const MessageFilter&) const = default;
};

// TopoR's Settings/Autoroute: «Капельки» (the button of the autoprocedures' panel: the design keeps it), and the
// rest of what the tag has — the mode, the wires' shape, the use of equivalent pins... — kept as read.
struct RouteSettings {
  bool teardrops = false;
  std::vector<std::pair<std::string, std::string>> other;
  bool operator==(const RouteSettings&) const = default;
};

struct DesignSettings {
  RouteSettings route;
  LabelSettings labels;
  PadConnectSettings padConnect;
  MessageFilter messages;
  bool operator==(const DesignSettings&) const = default;
};

}  // namespace xr
