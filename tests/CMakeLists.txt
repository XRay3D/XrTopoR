find_package(GTest REQUIRED)

add_executable(xrtests
  test_geom.cpp
  test_io.cpp
  test_drc.cpp
  test_router.cpp
)
target_link_libraries(xrtests PRIVATE xrio xrdrc xrrouter GTest::gtest_main)
target_compile_definitions(xrtests PRIVATE XR_TEST_DATA="${CMAKE_CURRENT_SOURCE_DIR}/data")

include(GoogleTest)
gtest_discover_tests(xrtests DISCOVERY_TIMEOUT 60 PROPERTIES TIMEOUT 600)
