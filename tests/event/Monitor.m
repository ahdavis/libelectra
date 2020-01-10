/*
 * Monitor.m
 * Implements a class that represents a counter monitor
 * Created on 1/10/2020
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

//imports
#import "Monitor.h"
#import "MonitorHandler.h"

//class implementation
@implementation Monitor

//property synthesis
@synthesize fiveCount = _fiveCount;
@synthesize fiveHandler = _handler;

//init method
- (id) init {
	self = [super init];
	if(self) {
		_fiveCount = 0;
		_handler = [[MonitorHandler alloc] init];
	}
	return self;
}

//dealloc method
- (void) dealloc {
	[_handler release];
	[super dealloc];
}

@end //end of implementation
