# Specify minimum ersion of CMake
cmake_minimum_required(VERSION 3.1)
# Project description: specify the name, languages and version (needed for packaging purposes)
project(alyr_ModernC VERSION 0.1.0 LANGUAGES C)
# Set compiler
SET(CMAKE_C_COMPILER /usr/local/musl/bin/musl-gcc)
# Executables
add_executable(challenge18 challenge18.c)

# target_link_libraries(m)
SET(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ggdb -std=c11 -Wall -O3 -march=native -fdata-sections -ffunction-sections")