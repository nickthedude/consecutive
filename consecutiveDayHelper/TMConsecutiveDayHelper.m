//
//  TMConsecutiveDayHelper.m
//  consecutiveDayHelper
//
//  Created by Nicholas Iannone on 6/19/14.
//  Copyright (c) 2014 Tiny Mobile Inc. All rights reserved.
//

#import "TMConsecutiveDayHelper.h"

@implementation TMConsecutiveDayHelper

static TMConsecutiveDayHelper *sharedHelper = nil;

+(TMConsecutiveDayHelper *) sharedHelper {
    
    if (sharedHelper == nil) {
        sharedHelper = [[super allocWithZone:NULL] init];
    }
    return sharedHelper;
}

+(void) appLaunched {
   
    //check if the default exists if not create using todays date
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"TMConsecutiveDayHelper"] == nil) {
        NSDate *today = [[NSDate date] dateWithoutTime];
        [[NSUserDefaults standardUserDefaults] setObject:@[today] forKey:@"TMConsecutiveDayHelper"];
    }
    
    // save a new entry into the working array in user defaults
    else {

        //using a set so if users come back more than once in a single day it doesn't mess us up.
        NSMutableSet *savedLaunchDates = [[NSMutableSet alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"TMConsecutiveDayHelper"]];
        [savedLaunchDates addObject:[[NSDate date] dateWithoutTime]];
    }
}

+(BOOL) isStreakOngoing {
 
    return NO;
}

+(NSInteger) streakSizeInDays {
    
    return 0;
}

+(BOOL) hasComeBackForThisExactNumberOfDaysConsecutively:(NSInteger) consecutiveDaysToTest {
    
    return NO;
}




@end
