add_library(xrgeom STATIC
  geom/Geometry.cpp
  geom/Shape.cpp
)
target_include_directories(xrgeom PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

add_library(xrcore STATIC
  core/Board.cpp
  core/Connectivity.cpp
  core/DiffPairs.cpp
  core/Edit.cpp
  core/HiSpeed.cpp
  core/Padstack.cpp
  core/Rules.cpp
  core/Runs.cpp
  core/SpatialIndex.cpp
  core/ZoneFill.cpp
  io/sexpr/SExpr.cpp
)
target_include_directories(xrcore PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(xrcore PUBLIC xrgeom Boost::headers)

add_library(xrio STATIC
  io/BoardIO.cpp
  io/Encoding.cpp
  io/Report.cpp
  io/kicad/KicadReader.cpp
  io/kicad/KicadWriter.cpp
  io/dsn/DsnReader.cpp
  io/dsn/DsnWriter.cpp
  io/dsn/SesIO.cpp
  io/pcad/PcadReader.cpp
  io/pcad/PcadWriter.cpp
  io/gerber/GerberWriter.cpp
  io/svg/SvgWriter.cpp
  io/xml/Xml.cpp
  io/topor/FsProj.cpp
  io/topor/FstReader.cpp
  io/topor/FstWriter.cpp
)
target_link_libraries(xrio PUBLIC xrcore Boost::json)

add_library(xrdrc STATIC
  drc/Drc.cpp
)
target_link_libraries(xrdrc PUBLIC xrcore)

add_library(xrtopo STATIC
  topo/Capacity.cpp
  topo/Cdt.cpp
  topo/Chains.cpp
  topo/Convert.cpp
  topo/Flip.cpp
  topo/Move.cpp
  topo/PadExit.cpp
  topo/Relay.cpp
  topo/RelayStats.cpp
  topo/Sidecar.cpp
  topo/Topology.cpp
)
target_link_libraries(xrtopo PUBLIC xrcore CGAL::CGAL Boost::json)

add_library(xrrouter STATIC
  router/topo/TopoMesh.cpp
  router/topo/TopoRouter.cpp
  router/topo/Realizer.cpp
  router/topo/Wires.cpp
  router/topo/ModelTools.cpp
  router/topo/ModelRelax.cpp
  router/topo/ModelRefine.cpp
  router/topo/ModelBranch.cpp
  router/topo/ModelVias.cpp
  router/topo/Optimizer.cpp
  router/topo/Freestyle.cpp
  router/topo/Refine.cpp
)
target_link_libraries(xrrouter PUBLIC xrcore xrdrc xrtopo CGAL::CGAL)

if(XR_BUILD_GUI)
  find_package(Qt6 REQUIRED COMPONENTS Widgets Concurrent)
  set(CMAKE_AUTOMOC ON)
  add_library(xrgui STATIC
    gui/AppSettings.cpp
    gui/AutorouteWindow.cpp
    gui/BoardView.cpp
    gui/BuiltinSchemes.cpp
    gui/Commands.cpp
    gui/DesignParamsDialog.cpp
    gui/PadstackDialogs.cpp
    gui/DisplayPanel.cpp
    gui/DrcDialog.cpp
    gui/Document.cpp
    gui/MainWindow.cpp
    gui/MessagesPanel.cpp
    gui/ModeBar.cpp
    gui/ProgramSettingsDialog.cpp
    gui/Project.cpp
    gui/ProjectPanel.cpp
    gui/PropertiesPanel.cpp
    gui/Schemes.cpp
    gui/SpinBox.cpp
    gui/SearchPanel.cpp
    gui/SmallDialogs.cpp
    gui/TextFont.cpp
    gui/TextStylesDialog.cpp
    gui/ToporConfig.cpp
    gui/Units.cpp
    gui/icons.qrc
  )
  set_target_properties(xrgui PROPERTIES AUTORCC ON)
  target_link_libraries(xrgui PUBLIC xrio xrdrc xrrouter Qt6::Widgets Qt6::Concurrent)
endif()
