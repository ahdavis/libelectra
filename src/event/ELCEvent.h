/*
 * ELCEvent.h
 * Declares a class that represents an event
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
#import <Foundation/Foundation.h>
#import "../args/ELCEventArgs.h"
#import "../call/ELCEventDelegate.h"

/**
 * An event that can be raised and handled
 */
@interface ELCEvent : NSObject {
	/**
	 * The handlers subscribed to the event
	 */
	NSMutableArray* _handlers;

	/**
	 * The receivers for the events
	 */
	NSMutableArray* _receivers;

	/**
	 * The object that raised the event
	 */
	id _sender;
}

/**
 * Initializes an ELCEvent instance
 *
 * @param sender The sender of the event
 * @returns The initialized event instance
 */
- (id) initWithSender: (id) sender;

/**
 * Deallocates an ELCEvent instance
 */
- (void) dealloc;

/**
 * Adds a subscriber to the event
 *
 * @param sub The event handler object
 * @param receiver The receiver of the event
 */
- (void) addSubscriber: (id<ELCEventDelegate>) sub 
		withReceiver: (id) receiver;
/**
 * Fires the event
 *
 * @param args The arguments for the event
 */
- (void) fireWithArgs: (ELCEventArgs*) args;

@end //end of header
