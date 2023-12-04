cmake_minimum_required(VERSION 3.18)

project(Examples)

list(APPEND CMAKE_MODULE_PATH "<install_path>/lib/cmake/OpenVDB")
find_package(OpenVDB REQUIRED)


# include header files
include_directories("<install_path>/include")

add_executable(example1 example1.cpp)

# linking OpenVDB
target_link_libraries(example1 PRIVATE OpenVDB::openvdb)
