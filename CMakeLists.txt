cmake_minimum_required(VERSION 3.24)
project(XrTopoR VERSION 0.1.0 LANGUAGES CXX)

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

# Binaries built with a newer GCC (e.g. /opt/gcc-16) must load its libstdc++ at run time.
execute_process(COMMAND ${CMAKE_CXX_COMPILER} -print-file-name=libstdc++.so
                OUTPUT_VARIABLE XR_LIBSTDCXX OUTPUT_STRIP_TRAILING_WHITESPACE)
if(XR_LIBSTDCXX AND IS_ABSOLUTE "${XR_LIBSTDCXX}")
  get_filename_component(XR_LIBSTDCXX_DIR "${XR_LIBSTDCXX}" REALPATH)
  get_filename_component(XR_LIBSTDCXX_DIR "${XR_LIBSTDCXX_DIR}" DIRECTORY)
  set(CMAKE_BUILD_RPATH "${XR_LIBSTDCXX_DIR}")
  set(CMAKE_INSTALL_RPATH "${XR_LIBSTDCXX_DIR}")
endif()

find_package(Boost 1.80 REQUIRED COMPONENTS json)
find_package(CGAL REQUIRED)

add_subdirectory(src)
add_subdirectory(apps)

if(XR_BUILD_TESTS)
  enable_testing()
  add_subdirectory(tests)
endif()
