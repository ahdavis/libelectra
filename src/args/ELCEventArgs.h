/*
 * ELCEventArgs.h
 * Declares a class that represents event handler arguments
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
#import <Foundation/Foundation.h>

/**
 * Contextual data for an event
 */
@interface ELCEventArgs : NSObject <NSCopying> {
	//no fields
}

/**
 * Initializes an ELCEventArgs instance
 * 
 * @returns The initialized instance
 */
- (id) init;

/**
 * Deallocates an ELCEventArgs instance
 */
- (void) dealloc;

/**
 * Copies an ELCEventArgs instance
 *
 * @param zone The copy zone
 * @returns A copy of the instance
 */
- (id) copyWithZone: (NSZone*) zone;

/**
 * Generates an empty ELCEventArgs instance
 *
 * @returns An autoreleased ELCEventArgs instance with no properties
 */
+ (ELCEventArgs*) empty;

@end //end of header
