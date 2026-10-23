// Built-in colour and display schemes, transcribed from the values of TopoR 7.0's schemes
// («TopoR 6.0», «P-CAD 2006», … / «Трассировка», «Всё включено», …). Generated table: edit with care.
#include "gui/Schemes.h"

namespace xr::gui {

const std::vector<ColorScheme>& builtinColorSchemes() {
  static const std::vector<ColorScheme> schemes = {
      {
          "TopoR 6.0", 42, 0, 0xf2f2f2,
          {{"background", 0x030b10}, {"board", 0xd4d4d4}, {"netLines", 0xaf7d3a}, {"keepoutPlaceBoth", 0xf79646}, {"keepoutWireAll", 0xff0000}, {"compsBound", 0xffffff}, {"compsName", 0xffffff}, {"pinsName", 0xbad3ef}, {"pinsNet", 0xbad3ef}, {"clrThroughPads", 0xc0c0c0}, {"clrThroughVias", 0x949494}, {"clrBurriedVias", 0x949494}, {"clrBlindVias", 0x949494}, {"clrFixedVias", 0x7070b8}, {"drcViolation", 0xffffff}, {"narrow", 0xff00ff}, {"trimmed", 0x038bef}, {"keepoutPlaceBot", 0x00aaaa}, {"keepoutPlaceTop", 0x259500}},
          {{{0xa52310, 0x841c0c, 0x631509}, {0x0f7140, 0x0c5a33, 0x094326}, {0xb15738, 0x8d452c, 0xb15738}, {0x1f4b2d, 0x183c24, 0x1f4b2d}, {0x50281b, 0x402015, 0x50281b}, {0x122e1c, 0x0e2416, 0x122e1c}, {0xaf583a, 0x8c462e, 0xaf583a}, {0x1f4b2d, 0x183c24, 0x1f4b2d}, {0x259500, 0x259500, 0x165900}, {0x00aaaa, 0x00aaaa, 0x006666}, {0x51271a, 0x401f14, 0x51271a}, {0x122e1b, 0x0e2415, 0x122e1b}, {0x00aa00, 0x00aa00, 0x006600}}},
          {{0x075f78, 0x054c60, 0x043948}, {0xce7946, 0xa46038, 0x7b482a}, {0x9b550f, 0x7c440c, 0x5d3309}, {0x318aa4, 0x276e83, 0x1d5262}, {0x95b535, 0x77902a, 0x596c1f}, {0x3a5ec5, 0x2e4b9d, 0x223876}, {0xdf6066, 0xb24c51, 0x85393d}, {0xb5f277, 0x90c15f, 0x6c9147}, {0xd500d5, 0xaa00aa, 0x7f007f}, {0xd5d500, 0xaaaa00, 0x7f7f00}, {0x00d5d5, 0x00aaaa, 0x007f7f}, {0x0000ff, 0x0000cc, 0x000099}, {0x00ff00, 0x00cc00, 0x009900}, {0x747474, 0x5c5c5c, 0x454545}},
      },
      {
          "P-CAD 2006", 60, 30, 0xffffff,
          {{"background", 0x000000}, {"board", 0x00ffff}, {"netLines", 0xff972e}, {"keepoutPlaceBoth", 0xff0000}, {"keepoutWireAll", 0xff0000}, {"compsBound", 0xffffff}, {"compsName", 0xffffff}, {"pinsName", 0xf8e98c}, {"pinsNet", 0xf8e98c}, {"clrThroughPads", 0xc0c0c0}, {"clrThroughVias", 0x00ffff}, {"clrBurriedVias", 0x00ffff}, {"clrBlindVias", 0x00ffff}, {"clrFixedVias", 0x00999d}, {"drcViolation", 0x16777215}, {"narrow", 0x16711935}, {"trimmed", 0x15698691}, {"keepoutPlaceBot", 0x00ffff}, {"keepoutPlaceTop", 0x00ff00}},
          {{{0xff0000, 0xcc0000, 0x990000}, {0x00ff00, 0x00cc00, 0x009900}, {0xff00ff, 0x990099, 0x990099}, {0x0000ff, 0x000099, 0x000099}, {0xffffff, 0x999999, 0x999999}, {0xc0c0c0, 0x999999, 0x737373}, {0xaf583a, 0x8c462e, 0xaf583a}, {0x1f4b2d, 0x183c24, 0x1f4b2d}, {0x00ff00, 0x00cc00, 0x009900}, {0x00ffff, 0x00cccc, 0x009999}, {0x51271a, 0x401f14, 0x51271a}, {0x122e1b, 0x0e2415, 0x122e1b}, {0x00aa00, 0x00aa00, 0x006600}}},
          {{0xcc00cc, 0x9d0099, 0x990099}, {0x0000ff, 0x0000cc, 0x000099}, {0xffffff, 0xcccccc, 0x999999}, {0xc0c0c0, 0x999999, 0x737373}, {0x808080, 0x666666, 0x4c4c4c}, {0xfff000, 0xccc000, 0x999000}},
      },
      {
          "Pulsonix", 60, 30, 0xc0c0c0,
          {{"background", 0x000000}, {"board", 0x008000}, {"netLines", 0xff972e}, {"keepoutPlaceBoth", 0x0000ff}, {"keepoutWireAll", 0x0000ff}, {"compsBound", 0xffffff}, {"compsName", 0xffffff}, {"pinsName", 0xf8e98c}, {"pinsNet", 0xf8e98c}, {"clrThroughPads", 0xffff00}, {"clrThroughVias", 0x8080ff}, {"clrBurriedVias", 0x800400}, {"clrBlindVias", 0x800400}, {"clrFixedVias", 0x00ffff}, {"drcViolation", 0x16777215}, {"narrow", 0x16711935}, {"trimmed", 0x15698691}, {"keepoutPlaceBot", 0xff8040}, {"keepoutPlaceTop", 0xff8040}},
          {{{0xff0000, 0xcc0000, 0x990000}, {0x00ffff, 0x00cccc, 0x009999}, {0xb15738, 0x8d452c, 0xb15738}, {0x1f4b2d, 0x183c24, 0x1f4b2d}, {0x50281b, 0x402015, 0x50281b}, {0x122e1c, 0x0e2416, 0x122e1c}, {0xaf583a, 0x8c462e, 0xaf583a}, {0x1f4b2d, 0x183c24, 0x1f4b2d}, {0xff8040, 0x0000aa, 0x994c26}, {0xff8040, 0x0000aa, 0x994c26}, {0x51271a, 0x401f14, 0x51271a}, {0x122e1b, 0x0e2415, 0x122e1b}, {0x00aa00, 0x00aa00, 0x006600}}},
          {{0x8080ff, 0x6666cc, 0x4c4c99}, {0x0000c0, 0x000099, 0x000073}, {0x008000, 0x006600, 0x004c00}, {0x408080, 0x336666, 0x264c4c}, {0x804000, 0x663300, 0x4c2600}, {0xc0c0c0, 0x999999, 0x737373}},
      },
      {
          "TopoR 4.3", 60, 10, 0x7fffd4,
          {{"background", 0xc0c0c0}, {"board", 0x0000ff}, {"netLines", 0xff972e}, {"keepoutPlaceBoth", 0x00ff00}, {"keepoutWireAll", 0x00007f}, {"compsBound", 0xc0dcc0}, {"compsName", 0xffffff}, {"pinsName", 0xf8e98c}, {"pinsNet", 0xf8e98c}, {"clrThroughPads", 0x00008b}, {"clrThroughVias", 0x008080}, {"clrBurriedVias", 0x008080}, {"clrBlindVias", 0x008080}, {"clrFixedVias", 0x40e0d0}, {"drcViolation", 0x16777215}, {"narrow", 0x16711935}, {"trimmed", 0x15698691}, {"keepoutPlaceBot", 0x5badff}, {"keepoutPlaceTop", 0xff80c0}},
          {{{0x44a101, 0x368001, 0x286001}, {0xd8053a, 0xac042e, 0x810322}, {0xff00ff, 0x990099, 0x990099}, {0xff00ff, 0x990099, 0x990099}, {0xffffff, 0xcccccc, 0x999999}, {0xc0c0c0, 0x999999, 0x737373}, {0xaf583a, 0x8c462e, 0xaf583a}, {0x1f4b2d, 0x183c24, 0x1f4b2d}, {0xff80c0, 0xcc6699, 0x994c73}, {0x5badff, 0x488acc, 0x366799}, {0x51271a, 0x401f14, 0x51271a}, {0x122e1b, 0x0e2415, 0x122e1b}, {0x00aa00, 0x00aa00, 0x006600}}},
          {{0x6d609e, 0x574c7e, 0x41395e}, {0xef9ba0, 0xbf7c80, 0x8f5d60}, {0xe77817, 0xb86012, 0x8a480d}, {0xdd137b, 0xb00f62, 0x840b49}, {0x724c53, 0x5b3c42, 0x442d31}, {0x75c5f0, 0x5d9dc0, 0x467690}},
      },
      {
          "Печать", 60, 0, 0xffffff,
          {{"background", 0xffffff}, {"board", 0x000000}, {"netLines", 0x777777}, {"keepoutPlaceBoth", 0x616161}, {"keepoutWireAll", 0x616161}, {"compsBound", 0x000000}, {"compsName", 0x000000}, {"pinsName", 0x000000}, {"pinsNet", 0x000000}, {"clrThroughPads", 0x868686}, {"clrThroughVias", 0x797979}, {"clrBurriedVias", 0x797979}, {"clrBlindVias", 0x797979}, {"clrFixedVias", 0x5d5d5d}, {"drcViolation", 0x000000}, {"narrow", 0x000000}, {"trimmed", 0x000000}, {"keepoutPlaceBot", 0x797979}, {"keepoutPlaceTop", 0x616161}},
          {{{0x888888, 0x888888, 0x888888}, {0x333333, 0x333333, 0x333333}, {0x888888, 0x6a6a6a, 0x888888}, {0x333333, 0x1f1f1f, 0x333333}, {0x888888, 0x797979, 0x888888}, {0x868686, 0x797979, 0x636363}, {0xaf583a, 0x8c462e, 0xaf583a}, {0x1f4b2d, 0x183c24, 0x1f4b2d}, {0x616161, 0x525252, 0x3d3d3d}, {0x797979, 0x6a6a6a, 0x5c5c5c}, {0x51271a, 0x401f14, 0x51271a}, {0x122e1b, 0x0e2415, 0x122e1b}, {0x444444, 0x444444, 0x444444}}},
          {{0x555555, 0x555555, 0x555555}, {0x424242, 0x424242, 0x424242}, {0x727272, 0x727272, 0x727272}, {0x383838, 0x383838, 0x383838}, {0x626262, 0x626262, 0x626262}, {0x828282, 0x828282, 0x828282}},
      },
      {
          "Негатив", 60, 0, 0xffffff,
          {{"background", 0x000000}, {"board", 0xffffff}, {"netLines", 0xffffff}, {"keepoutPlaceBoth", 0xffffff}, {"keepoutWireAll", 0xffffff}, {"compsBound", 0xffffff}, {"compsName", 0xffffff}, {"pinsName", 0xffffff}, {"pinsNet", 0xffffff}, {"clrThroughPads", 0xffffff}, {"clrThroughVias", 0xffffff}, {"clrBurriedVias", 0xffffff}, {"clrBlindVias", 0xffffff}, {"clrFixedVias", 0xffffff}, {"drcViolation", 0xffffff}, {"narrow", 0xffffff}, {"trimmed", 0xffffff}, {"keepoutPlaceBot", 0xffffff}, {"keepoutPlaceTop", 0xffffff}},
          {{{0xffffff, 0xffffff, 0xffffff}, {0xffffff, 0xffffff, 0xffffff}, {0xffffff, 0xffffff, 0xffffff}, {0xffffff, 0xffffff, 0xffffff}, {0xffffff, 0xffffff, 0xffffff}, {0xffffff, 0xffffff, 0xffffff}, {0xaf583a, 0x8c462e, 0xaf583a}, {0x1f4b2d, 0x183c24, 0x1f4b2d}, {0xffffff, 0xffffff, 0xffffff}, {0xffffff, 0xffffff, 0xffffff}, {0x51271a, 0x401f14, 0x51271a}, {0x122e1b, 0x0e2415, 0x122e1b}, {0xffffff, 0xffffff, 0xffffff}}},
          {{0xffffff, 0xffffff, 0xffffff}, {0xffffff, 0xffffff, 0xffffff}, {0xffffff, 0xffffff, 0xffffff}, {0xffffff, 0xffffff, 0xffffff}, {0xffffff, 0xffffff, 0xffffff}, {0xffffff, 0xffffff, 0xffffff}},
      },
      {
          "Фотошаблон", 60, 0, 0x000000,
          {{"background", 0xffffff}, {"board", 0x000000}, {"netLines", 0x000000}, {"keepoutPlaceBoth", 0x000000}, {"keepoutWireAll", 0x000000}, {"compsBound", 0x000000}, {"compsName", 0x000000}, {"pinsName", 0x000000}, {"pinsNet", 0x000000}, {"clrThroughPads", 0x000000}, {"clrThroughVias", 0x000000}, {"clrBurriedVias", 0x000000}, {"clrBlindVias", 0x000000}, {"clrFixedVias", 0x000000}, {"drcViolation", 0x000000}, {"narrow", 0x000000}, {"trimmed", 0x000000}, {"keepoutPlaceBot", 0x000000}, {"keepoutPlaceTop", 0x000000}},
          {{{0x000000, 0x000000, 0x000000}, {0x000000, 0x000000, 0x000000}, {0x000000, 0x000000, 0x000000}, {0x000000, 0x000000, 0x000000}, {0x000000, 0x000000, 0x000000}, {0x000000, 0x000000, 0x000000}, {0xaf583a, 0x8c462e, 0xaf583a}, {0x1f4b2d, 0x183c24, 0x1f4b2d}, {0x000000, 0x000000, 0x000000}, {0x000000, 0x000000, 0x000000}, {0x51271a, 0x401f14, 0x51271a}, {0x122e1b, 0x0e2415, 0x122e1b}, {0x000000, 0x000000, 0x000000}}},
          {{0x000000, 0x000000, 0x000000}, {0x000000, 0x000000, 0x000000}, {0x000000, 0x000000, 0x000000}, {0x000000, 0x000000, 0x000000}, {0x000000, 0x000000, 0x000000}, {0x000000, 0x000000, 0x000000}},
      },
  };
  return schemes;
}

const std::vector<ViewScheme>& builtinViewSchemes() {
  static const std::vector<ViewScheme> schemes = {
      {
          "Трассировка",
          {{"showActiveLayerOnly", false}, {"showSerpentArea", true}, {"showComponents", true}, {"showCompsBound", false}, {"showCompsDes", true}, {"showPinsName", true}, {"showPinsNet", true}, {"showCompTop", true}, {"showCompBot", true}, {"showTexts", true}, {"showLabelRefDes", true}, {"showLabelPartName", true}, {"showLabelOther", true}, {"showVias", true}, {"showWires", true}, {"showThinWires", false}, {"showCoppers", true}, {"showKeepouts", true}, {"showViolations", true}, {"showNarrow", false}, {"showDRCViolations", true}, {"showTrimmed", true}, {"showNetLines", true}, {"showMountingHoles", true}, {"showBoardOutline", true}, {"showRouteKeepouts", true}, {"showPlaceKeepouts", false}, {"showSignalLayers", true}, {"showMetalPads", true}, {"showTopMechLayers", true}, {"showTopMechDetails", true}, {"showTopMechPads", true}, {"showBotMechLayers", true}, {"showBotMechDetails", true}, {"showBotMechPads", true}, {"showDocLayers", false}},
          false, true, false,
          {{true, true, false, false, false, false, false, false, true, true, false, false, true}},
          true,
      },
      {
          "Всё включено",
          {{"showActiveLayerOnly", false}, {"showSerpentArea", true}, {"showComponents", true}, {"showCompsBound", false}, {"showCompsDes", true}, {"showPinsName", true}, {"showPinsNet", true}, {"showCompTop", true}, {"showCompBot", true}, {"showTexts", true}, {"showLabelRefDes", true}, {"showLabelPartName", true}, {"showLabelOther", true}, {"showVias", true}, {"showWires", true}, {"showThinWires", false}, {"showCoppers", true}, {"showKeepouts", true}, {"showViolations", true}, {"showNarrow", true}, {"showDRCViolations", true}, {"showTrimmed", true}, {"showNetLines", true}, {"showMountingHoles", true}, {"showBoardOutline", true}, {"showRouteKeepouts", true}, {"showPlaceKeepouts", true}, {"showSignalLayers", true}, {"showMetalPads", true}, {"showTopMechLayers", true}, {"showTopMechDetails", true}, {"showTopMechPads", true}, {"showBotMechLayers", true}, {"showBotMechDetails", true}, {"showBotMechPads", true}, {"showDocLayers", true}},
          true, false, false,
          {{true, true, true, true, true, true, false, false, true, true, false, false, true}},
          true,
      },
      {
          "Всё выключено",
          {{"showActiveLayerOnly", false}, {"showSerpentArea", true}, {"showComponents", true}, {"showCompsBound", false}, {"showCompsDes", true}, {"showPinsName", false}, {"showPinsNet", false}, {"showCompTop", false}, {"showCompBot", false}, {"showTexts", true}, {"showLabelRefDes", false}, {"showLabelPartName", false}, {"showLabelOther", false}, {"showVias", false}, {"showWires", true}, {"showThinWires", false}, {"showCoppers", false}, {"showKeepouts", true}, {"showViolations", true}, {"showNarrow", false}, {"showDRCViolations", false}, {"showTrimmed", false}, {"showNetLines", false}, {"showMountingHoles", false}, {"showBoardOutline", false}, {"showRouteKeepouts", false}, {"showPlaceKeepouts", false}, {"showSignalLayers", true}, {"showMetalPads", true}, {"showTopMechLayers", true}, {"showTopMechDetails", true}, {"showTopMechPads", true}, {"showBotMechLayers", true}, {"showBotMechDetails", true}, {"showBotMechPads", true}, {"showDocLayers", true}},
          false, false, false,
          {{false, false, false, false, false, false, false, false, false, false, false, false, false}},
          false,
      },
      {
          "Верхняя сторона",
          {{"showActiveLayerOnly", false}, {"showSerpentArea", false}, {"showComponents", true}, {"showCompsBound", false}, {"showCompsDes", true}, {"showPinsName", false}, {"showPinsNet", false}, {"showCompTop", true}, {"showCompBot", true}, {"showTexts", true}, {"showLabelRefDes", true}, {"showLabelPartName", true}, {"showLabelOther", true}, {"showVias", false}, {"showWires", true}, {"showThinWires", false}, {"showCoppers", false}, {"showKeepouts", true}, {"showViolations", true}, {"showNarrow", false}, {"showDRCViolations", true}, {"showTrimmed", false}, {"showNetLines", false}, {"showMountingHoles", true}, {"showBoardOutline", true}, {"showRouteKeepouts", false}, {"showPlaceKeepouts", true}, {"showSignalLayers", true}, {"showMetalPads", true}, {"showTopMechLayers", true}, {"showTopMechDetails", true}, {"showTopMechPads", true}, {"showBotMechLayers", false}, {"showBotMechDetails", true}, {"showBotMechPads", true}, {"showDocLayers", false}},
          true, true, false,
          {{true, false, true, true, true, true, false, false, true, true, false, false, false}},
          false,
      },
      {
          "Нижняя сторона",
          {{"showActiveLayerOnly", false}, {"showSerpentArea", false}, {"showComponents", true}, {"showCompsBound", false}, {"showCompsDes", true}, {"showPinsName", false}, {"showPinsNet", false}, {"showCompTop", true}, {"showCompBot", true}, {"showTexts", true}, {"showLabelRefDes", true}, {"showLabelPartName", true}, {"showLabelOther", true}, {"showVias", false}, {"showWires", true}, {"showThinWires", false}, {"showCoppers", false}, {"showKeepouts", true}, {"showViolations", true}, {"showNarrow", false}, {"showDRCViolations", true}, {"showTrimmed", false}, {"showNetLines", false}, {"showMountingHoles", true}, {"showBoardOutline", true}, {"showRouteKeepouts", false}, {"showPlaceKeepouts", true}, {"showSignalLayers", true}, {"showMetalPads", true}, {"showTopMechLayers", false}, {"showTopMechDetails", true}, {"showTopMechPads", true}, {"showBotMechLayers", true}, {"showBotMechDetails", true}, {"showBotMechPads", true}, {"showDocLayers", false}},
          true, true, false,
          {{false, true, true, true, true, true, false, false, true, true, false, false, false}},
          false,
      },
  };
  return schemes;
}

}  // namespace xr::gui
