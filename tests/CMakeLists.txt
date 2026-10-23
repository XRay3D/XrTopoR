find_package(GTest REQUIRED)

add_executable(xrtests
  test_geom.cpp
  test_io.cpp
  test_fst.cpp
  test_drc.cpp
  test_edit.cpp
  test_router.cpp
)
target_link_libraries(xrtests PRIVATE xrio xrdrc xrrouter GTest::gtest_main)
target_compile_definitions(xrtests PRIVATE XR_TEST_DATA="${CMAKE_CURRENT_SOURCE_DIR}/data")

include(GoogleTest)
gtest_discover_tests(xrtests DISCOVERY_TIMEOUT 60 PROPERTIES TIMEOUT 600)

if(XR_BUILD_GUI)
  find_package(Qt6 REQUIRED COMPONENTS Test)
  set(CMAKE_AUTOMOC ON)
  add_executable(xrgui_tests test_gui.cpp)
  target_link_libraries(xrgui_tests PRIVATE xrgui Qt6::Test GTest::gtest_main)
  target_compile_definitions(xrgui_tests PRIVATE XR_TEST_DATA="${CMAKE_CURRENT_SOURCE_DIR}/data")
  gtest_discover_tests(xrgui_tests DISCOVERY_TIMEOUT 60 PROPERTIES TIMEOUT 300 ENVIRONMENT "QT_QPA_PLATFORM=offscreen")
endif()
