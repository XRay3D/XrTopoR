add_executable(xrtopor-cli xrtopor-cli/main.cpp)
target_link_libraries(xrtopor-cli PRIVATE xrio xrdrc xrrouter)

if(XR_BUILD_GUI)
  add_executable(xrtopor xrtopor/main.cpp)
  target_link_libraries(xrtopor PRIVATE xrgui)
endif()
