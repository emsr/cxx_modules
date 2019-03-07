cmake_minimum_required (VERSION 3.14.0)

include(CheckCXXCompilerFlag)

set(CMAKE_CXX_COMPILER /home/ed/bin_modules/bin/g++)
set(CMAKE_CXX_FLAGS "-fmodules-ts")
set(CMAKE_CXX_STANDARD 20)

project(
  cxx_modules
  VERSION 0.1
  LANGUAGES C CXX
)

add_library(foobar SHARED foobar.cpp foo.cpp bar.cpp)

add_executable(toy toy.cpp)
target_link_libraries(toy foobar)
