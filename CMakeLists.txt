cmake_minimum_required(VERSION 3.24)
project(XrTopoR VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(XR_BUILD_GUI   "Build the Qt GUI application" ON)
option(XR_BUILD_TESTS "Build unit tests" ON)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  set(CMAKE_BUILD_TYPE Release)
endif()

add_compile_options(-Wall -Wextra -Wno-unused-parameter)

find_package(Boost 1.80 REQUIRED COMPONENTS json)
find_package(CGAL REQUIRED)

add_subdirectory(src)
add_subdirectory(apps)

if(XR_BUILD_TESTS)
  enable_testing()
  add_subdirectory(tests)
endif()
