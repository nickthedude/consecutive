//
//  TMConsecutiveDayHelper.h
//  consecutiveDayHelper
//
//  Created by Nicholas Iannone on 6/19/14.
//  Copyright (c) 2014 Tiny Mobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+Helpers.h"

@interface TMConsecutiveDayHelper : NSObject

+(TMConsecutiveDayHelper *) sharedHelper;

+(void) appLaunched;

+(BOOL) isStreakOngoing;

+(NSInteger) streakSizeInDays;

+(BOOL) hasComeBackForThisExactNumberOfDaysConsecutively:(NSInteger) consecutiveDaysToTest;
@end
