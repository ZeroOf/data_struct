# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
enable_testing()

link_libraries(gtest_main gtest gmock_main gmock pthread)

include(GoogleTest)

include(${CMAKE_SOURCE_DIR}/cmake/child_test.cmake)
AddSubTest()