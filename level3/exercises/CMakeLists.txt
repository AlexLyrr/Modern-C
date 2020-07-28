# Specify minimum ersion of CMake
cmake_minimum_required(VERSION 3.1)
# Project description: specify the name, languages and version (needed for packaging purposes)
project(alyr_ModernC VERSION 0.1.0 LANGUAGES C)
# Executables
add_executable(exs1 exs1.c exs1.h)
add_executable(exs6 exs6.c)
add_executable(exs12 exs12.c)
add_executable(exs15_16_18_19_20 exs15_16_18_19_20.c exs15_16_18_19_20.h)
add_executable(exs30 exs30.c sighandler.c sighandler.h)

# target_link_libraries(m)
SET(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ggdb -std=c11 -Wall -O3 -march=native -fdata-sections -ffunction-sections")