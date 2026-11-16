add_executable(xrtopor-cli xrtopor-cli/main.cpp)
target_link_libraries(xrtopor-cli PRIVATE xrversion xrio xrdrc xrrouter)
add_dependencies(xrtopor-cli xr_version)

if(XR_BUILD_GUI)
  add_executable(xrtopor xrtopor/main.cpp)
  target_link_libraries(xrtopor PRIVATE xrgui)
endif()
