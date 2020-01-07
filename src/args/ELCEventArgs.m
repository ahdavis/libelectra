/*
 * ELCEventArgs.m
 * Implements a class that represents event handler arguments
 * Created on 1/7/2020
 * Created by Andrew Davis
 *
 * Copyright (C) 2020  Andrew Davis
 *
 * This program is free software: you can redistribute it and/or modify   
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

//import
#import "ELCEventArgs.h"

//implementation
@implementation ELCEventArgs

//init method - initializes the instance
- (id) init {
	//call the superclass init method
	self = [super init];

	//and return the instance
	return self;
}

//dealloc method - deallocates the instance
- (void) dealloc {
	[super dealloc]; //call the superclass dealloc method
}

//copyWithZone method - copies the instance
- (id) copyWithZone: (NSZone*) zone {
	//allocate a copy of the instance
	ELCEventArgs* argsCopy = [[[self class] allocWithZone: zone] init];

	//and return the copy
	return argsCopy;
}

@end //end of implementation
