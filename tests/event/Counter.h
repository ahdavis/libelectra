/*
 * Counter.h
 * Declares a class that represents a counter
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
#import <Foundation/Foundation.h>
#import "../../src/electra.h"

//class declaration
@interface Counter : NSObject {
	int _max;
	int _value;
	ELCEvent* _onMultipleOfFiveReached;
}

//property
@property (readonly) ELCEvent* onMultipleOfFiveReached;

//init method
- (id) initWithMax: (int) max;

//dealloc method
- (void) dealloc;

//starts the count
- (void) start;

@end //end of header
