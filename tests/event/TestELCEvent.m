/*
 * TestELCEvent.m
 * Implements a class that tests events
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
#import "TestELCEvent.h"
#import "Monitor.h"
#import "Counter.h"

//class implementation
@implementation TestELCEvent

//tests event firing
- (void) testFire {
	//allocate the objects
	Counter* counter = [[Counter alloc] initWithMax: 10];
	Monitor* mon = [[Monitor alloc] init];

	//attach the event
	[[counter onMultipleOfFiveReached] addSubscriber: mon.fiveHandler 
					  withReceiver: mon]; 

	//test the event
	UKIntsEqual(mon.fiveCount, 0);
	[counter start];
	UKIntsEqual(mon.fiveCount, 2);

	//and free the objects
	[mon release];
	[counter release];
}

@end //end of implementation
