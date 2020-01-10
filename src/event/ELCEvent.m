/*
 * ELCEvent.m
 * Implements a class that represents an event
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

//imports
#import "ELCEvent.h"

//class implementation
@implementation ELCEvent

//init method - initializes the instance
- (id) initWithSender: (id) sender {
	//call the superclass init method
	self = [super init];

	//verify that the call succeeded
	if(self) { //if the call succeeded
		//then init the fields
		_handlers = [[NSMutableArray alloc] init];
		_receivers = [[NSMutableArray alloc] init];
		_sender = sender;
	}

	//and return the instance
	return self;
}

//dealloc method - deallocates the instance
- (void) dealloc {
	[_handlers release]; //release the handlers
	[_receivers release]; //release the receivers
	[super dealloc]; //and call the superclass dealloc method
}

//addSubscriber method - adds a handler to the event
- (void) addSubscriber: (id<ELCEventDelegate>) sub
	withReceiver: (id) receiver {
	[_handlers addObject: sub]; //add the subscriber to the event
	[_receivers addObject: receiver]; //and register the receiver
}
	
//fireWithArgs method - fires the event
- (void) fireWithArgs: (ELCEventArgs*) args {
	//loop and call the handlers
	NSUInteger i;
	for(i = 0; i < [_handlers count]; i++) {
		id<ELCEventDelegate> curHandler = [_handlers 
							objectAtIndex: i];
		id curReceiver = [_receivers objectAtIndex: i];
		[curHandler handleEventWithArgs: args sender: _sender
				       receiver: curReceiver];
	}
}

@end //end of implementation
