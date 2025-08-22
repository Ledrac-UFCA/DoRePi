cmake_minimum_required(VERSION 3.13)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)

include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)

project(DoRePi C CXX)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

pico_sdk_init()

add_executable(DoRePi
	src/main.c
)

target_link_libraries(DoRePi pico_stdlib)

target_compile_options(DoRePi PRIVATE
    -Wall
    -Wextra
    -Werror
    -O2
)
