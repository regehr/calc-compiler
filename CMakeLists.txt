# adapted a bit from http://llvm.org/docs/CMake.html#embedding-llvm-in-your-project

cmake_minimum_required(VERSION 3.2)
project(IntervalBitwise)

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

set(CMAKE_CXX_FLAGS "-std=c++11 -fno-rtti -Wall")

include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

add_executable(calcc calcc.cpp)

llvm_map_components_to_libnames(llvm_libs support core irreader)

target_link_libraries(calcc ${llvm_libs})

add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/auto-tests
        COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_SOURCE_DIR}/auto-tests ${CMAKE_BINARY_DIR}/auto-tests
        )
add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/driver.c
        COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/driver.c ${CMAKE_BINARY_DIR}
        )

add_custom_target(check-all
        COMMAND ${CMAKE_COMMAND} -E env CALCC=${CMAKE_BINARY_DIR}/calcc PATH=${LLVM_TOOLS_BINARY_DIR}:$ENV{PATH} ${CMAKE_SOURCE_DIR}/run_tests.pl *.calc
        DEPENDS calcc ${CMAKE_BINARY_DIR}/auto-tests ${CMAKE_BINARY_DIR}/driver.c
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/auto-tests
        )
