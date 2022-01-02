
include(${CMAKE_SOURCE_DIR}/cmake/subdir.cmake)

function(AddChildren father)
    if (EXISTS ${father}/CMakeLists.txt)
        add_subdirectory(${father})
        return()
    else ()
        SUBDIRLIST(children ${father})
        list(LENGTH children childNum)
        if (${childNum} EQUAL 0)
            file(RELATIVE_PATH relativePath ${CMAKE_SOURCE_DIR}/test ${father})
            STRING(REGEX REPLACE "/" "_" PNAME ${relativePath})
            FILE(WRITE ${father}/CMakeLists.txt
                    "project(test_${PNAME})\n"
                    "include_directories(\${CMAKE_SOURCE_DIR}/src/${father})\n"
                    "include_directories(${PROJECT_SOURCE_DIR})\n"
                    "file(GLOB_RECURSE SRCS *.cc *.cpp *.h *.hpp \${CMAKE_SOURCE_DIR}/src/${father}/*.cc \${CMAKE_SOURCE_DIR}/src/${father}/*.h \${CMAKE_SOURCE_DIR}/src/${father}/*.cpp \${CMAKE_SOURCE_DIR}/src/${father}/*.hpp)\n"
                    "add_executable(\${PROJECT_NAME} \${SRCS})\n"
                    "install(TARGETS \${PROJECT_NAME} DESTINATION bin)\n"
                    "gtest_discover_tests(\${PROJECT_NAME})")
            add_subdirectory(${father})
        else ()
            foreach (child ${children})
                AddChildren("${father}/${child}")
            endforeach ()
        endif ()
    endif ()
endfunction()

function(AddSubTest)
    SUBDIRLIST(children ${CMAKE_CURRENT_SOURCE_DIR})
    foreach (child ${children})
        AddChildren("${CMAKE_CURRENT_SOURCE_DIR}/${child}")
    endforeach ()
endfunction()
