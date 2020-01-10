/*
 * Counter.m
 * Implements a class that represents a counter
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

//import
#import "Counter.h"

//class implementation
@implementation Counter

//property synthesis
@synthesize onMultipleOfFiveReached = _onMultipleOfFiveReached;

//init method
- (id) initWithMax: (int) max {
	self = [super init];
	if(self) {
		_max = max;
		_value = 1;
		_onMultipleOfFiveReached = [[ELCEvent alloc] 
						initWithSender: self];
	}
	return self;
}

//dealloc method
- (void) dealloc {
	_value = 1;
	[_onMultipleOfFiveReached release];
	[super dealloc];
}

//start method
- (void) start {
	while(_value <= _max) {
		if(_value % 5 == 0) {
			[_onMultipleOfFiveReached fireWithArgs:
				[ELCEventArgs empty]];
		}
		_value++;
	}
}

@end //end of implementation
