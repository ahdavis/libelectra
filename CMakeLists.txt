# CMakeLists.txt
# Generates a Makefile for libelectra
# Created on 1/5/2020
# Created by Andrew Davis
#
# Copyright (C) 2020  Andrew Davis
#
# This program is free software: you can redistribute it and/or modify   
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# include GNUInstallDirs
include(GNUInstallDirs)

# enable testing
enable_testing()

# set the minimum required version
cmake_minimum_required(VERSION 2.8.9)

# set the project name
project("Electra")

# set the release type
set(CMAKE_BUILD_TYPE Release)

# get the Objective-C flags
execute_process(COMMAND bash "-c" "gnustep-config --objc-flags"
	OUTPUT_VARIABLE OBJC_FLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)

# set the compiler flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OBJC_FLAGS} -Wall")
set(CMAKE_SHARED_LINKER_FLAGS "-lgnustep-base -lobjc")

# load the source files
file(GLOB_RECURSE SRCS ${CMAKE_SOURCE_DIR}/src/*.m)
file(GLOB_RECURSE HDRS ${CMAKE_SOURCE_DIR}/src/*.h)

# set the source file properties
set_source_files_properties(${SRCS} PROPERTIES COMPILE_OPTIONS 
				-xobjective-c)

# set the build target
add_library(electra SHARED ${SRCS})

# create the directory for the header files
install(CODE "FILE(MAKE_DIRECTORY \$ENV{DESTDIR}\${CMAKE_INSTALL_PREFIX}/include/electra)")

# add the install target for the headers
install(DIRECTORY ${CMAKE_SOURCE_DIR}/src/
	DESTINATION $ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/include/electra
	FILES_MATCHING PATTERN "*.h")

# add the install target for the library
install(TARGETS electra
	DESTINATION $ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib)

# add the documentation target
option(BUILD_DOC "Build documentation" ON)
find_package(Doxygen)
if (DOXYGEN_FOUND)
	# set input and output files
	set(DOXYGEN_IN ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in)
	set(DOXYGEN_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

	# request to configure the file
	configure_file(${DOXYGEN_IN} ${DOXYGEN_OUT} @ONLY)
	message("Doxygen build started")

	# add the target
	add_custom_target(docs ALL
		COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
		WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
		COMMENT "Generating API documentation with Doxygen"
		VERBATIM)
else (DOXYGEN_FOUND)
	message("Doxygen needs to be installed to generate documentation")
endif (DOXYGEN_FOUND)

# load the test source files
file(GLOB_RECURSE TEST_SRCS ${CMAKE_SOURCE_DIR}/tests/*.m)
file(GLOB_RECURSE TEST_HDRS ${CMAKE_SOURCE_DIR}/tests/*.h)

# set their properties
set_source_files_properties(${TEST_SRCS} PROPERTIES COMPILE_OPTIONS
				-xobjective-c)

# generate the test bundle
add_library(electraTests MODULE ${TEST_SRCS} ${TEST_HDRS})
set_target_properties(electraTests PROPERTIES BUNDLE TRUE)
target_link_libraries(electraTests electra UnitKit)

# end of file
