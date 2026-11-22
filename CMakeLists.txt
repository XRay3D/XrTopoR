cmake_minimum_required(VERSION 3.24)
project(XrTopoR VERSION 0.3.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(XR_BUILD_GUI   "Build the Qt GUI application" ON)
option(XR_BUILD_TESTS "Build unit tests" ON)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  set(CMAKE_BUILD_TYPE Release)
endif()

add_compile_options(-Wall -Wextra -Wno-unused-parameter)

# MinGW's libstdc++ keeps std::print's console output (std::__open_terminal, std::__write_to_terminal) in a library
# of its own.
if(MINGW)
  link_libraries(stdc++exp)
endif()

# Binaries built with a newer GCC (e.g. /opt/gcc-16) must load its libstdc++ at run time.
execute_process(COMMAND ${CMAKE_CXX_COMPILER} -print-file-name=libstdc++.so
                OUTPUT_VARIABLE XR_LIBSTDCXX OUTPUT_STRIP_TRAILING_WHITESPACE)
if(XR_LIBSTDCXX AND IS_ABSOLUTE "${XR_LIBSTDCXX}")
  get_filename_component(XR_LIBSTDCXX_DIR "${XR_LIBSTDCXX}" REALPATH)
  get_filename_component(XR_LIBSTDCXX_DIR "${XR_LIBSTDCXX_DIR}" DIRECTORY)
  set(CMAKE_BUILD_RPATH "${XR_LIBSTDCXX_DIR}")
  set(CMAKE_INSTALL_RPATH "${XR_LIBSTDCXX_DIR}")
endif()

# The version header (cmake/Version.cmake), written at every build: the commit is always the one built. CI passes
# the branch or tag and the commit (git in its container may not be asked).
set(GIT_REF_NAME "" CACHE STRING "The branch or tag built (CI)")
set(GIT_SHA "" CACHE STRING "The commit built (CI)")
string(TIMESTAMP XR_BUILD_DATE "%Y-%m-%d %H:%M:%S")
set(XR_VERSION_H "${CMAKE_BINARY_DIR}/generated/xr/Version.h")
add_custom_target(xr_version ALL
  COMMAND "${CMAKE_COMMAND}" "-DSRC_DIR=${CMAKE_SOURCE_DIR}" "-DOUT=${XR_VERSION_H}" "-DVERSION=${PROJECT_VERSION}"
          "-DGIT_REF_NAME=${GIT_REF_NAME}" "-DGIT_SHA=${GIT_SHA}" "-DBUILD_DATE=${XR_BUILD_DATE}"
          -P "${CMAKE_SOURCE_DIR}/cmake/Version.cmake"
  BYPRODUCTS "${XR_VERSION_H}"
  COMMENT "Version header"
  VERBATIM)
add_library(xrversion INTERFACE)
target_include_directories(xrversion INTERFACE "${CMAKE_BINARY_DIR}/generated")
add_dependencies(xrversion xr_version)

find_package(Boost 1.80 REQUIRED COMPONENTS json)
find_package(CGAL REQUIRED)

add_subdirectory(src)
add_subdirectory(apps)

if(XR_BUILD_TESTS)
  enable_testing()
  add_subdirectory(tests)
endif()
