add_library(xrgeom STATIC
  geom/Geometry.cpp
  geom/Shape.cpp
)
target_include_directories(xrgeom PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

add_library(xrcore STATIC
  core/Board.cpp
  core/Connectivity.cpp
  core/SpatialIndex.cpp
  io/sexpr/SExpr.cpp
)
target_include_directories(xrcore PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(xrcore PUBLIC xrgeom Boost::headers)

add_library(xrio STATIC
  io/BoardIO.cpp
  io/Encoding.cpp
  io/kicad/KicadReader.cpp
  io/kicad/KicadWriter.cpp
  io/dsn/DsnReader.cpp
  io/dsn/DsnWriter.cpp
  io/dsn/SesIO.cpp
  io/pcad/PcadReader.cpp
  io/gerber/GerberWriter.cpp
  io/svg/SvgWriter.cpp
  io/xml/Xml.cpp
  io/topor/FstReader.cpp
  io/topor/FstWriter.cpp
)
target_link_libraries(xrio PUBLIC xrcore Boost::json)

add_library(xrdrc STATIC
  drc/Drc.cpp
)
target_link_libraries(xrdrc PUBLIC xrcore)

add_library(xrrouter STATIC
  router/topo/TopoMesh.cpp
  router/topo/TopoRouter.cpp
  router/topo/Realizer.cpp
  router/topo/Optimizer.cpp
)
target_link_libraries(xrrouter PUBLIC xrcore xrdrc CGAL::CGAL)

if(XR_BUILD_GUI)
  find_package(Qt6 REQUIRED COMPONENTS Widgets Concurrent)
  set(CMAKE_AUTOMOC ON)
  add_library(xrgui STATIC
    gui/Document.cpp
    gui/MainWindow.cpp
    gui/BoardView.cpp
    gui/Panels.cpp
    gui/Theme.cpp
  )
  target_link_libraries(xrgui PUBLIC xrio xrdrc xrrouter Qt6::Widgets Qt6::Concurrent)
endif()
