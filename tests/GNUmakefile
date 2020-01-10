# GNUmakefile
# Makefile for libelectra tests
# Created on 1/10/2020
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

# load GNUmake common code
include $(GNUSTEP_MAKEFILES)/common.make

# set the bundle files
BUNDLE_NAME = Test
Test_OBJC_FILES = $(shell ls ../src/**/*.m) $(shell ls ./**/*.m)
Test_OBJC_LIBS = -lUnitKit

# and include the bundle code
include $(GNUSTEP_MAKEFILES)/bundle.make 

# end of file
