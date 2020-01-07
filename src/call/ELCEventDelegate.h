/*
 * ELCEventDelegate.h
 * Declares a protocol for event handler delegates
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

/**
 * Implemented by event handler objects
 */
@protocol ELCEventDelegate <NSObject>

//required methods
@required

/**
 * Handles an event
 *
 * @param args The arguments of the event
 * @param sender The sender of the event
 * @param receiver The receiver of the event
 */
- (void) handleEventWithArgs: (ELCEventArgs*) args
		sender: (id) sender receiver: (id) receiver;

@end //end of header
