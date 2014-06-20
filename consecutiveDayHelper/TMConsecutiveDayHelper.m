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
   
    NSMutableSet *savedLaunchDates;
    
    //check if the default exists if not create using todays date
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"TMConsecutiveDayHelper"] == nil) {
        NSDate *today = [[NSDate date] dateWithoutTime];
        [[NSUserDefaults standardUserDefaults] setObject:@[today] forKey:@"TMConsecutiveDayHelper"];
    }
    
    // save a new entry into the working array in user defaults
    else {

        //using an NSSet so if users come back more than once in a single day it doesn't mess us up.
        //This seems to work but probably need to test a bit more
        savedLaunchDates = [[NSMutableSet alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"TMConsecutiveDayHelper"]];
        [savedLaunchDates addObject:[[NSDate date] dateWithoutTime]];
    
    
    //created an ordered date array so we can iterate through the dates in order
    NSArray *dateArray = [[savedLaunchDates allObjects] sortedArrayUsingComparator:
                          ^(id obj1, id obj2) {
                              return [obj1 compare:obj2];
                          }];

    
    BOOL streakIntact = YES;
    NSDate *dateToCompare;
    //check for any lapses in the date streak
        for (NSInteger i = 0; i < [dateArray count]; i++) {
    
        if (i > 0) {
            if ([[dateToCompare dateByAddingDays:1] compare:[dateArray objectAtIndex:i]] != NSOrderedSame ) {
                streakIntact = NO;
            }
        }
        dateToCompare = [dateArray objectAtIndex:i];

    }
    // if the streak is broken start a new array/streak in user defaults
    if (streakIntact == NO) {
        NSDate *today = [[NSDate date] dateWithoutTime];
        [[NSUserDefaults standardUserDefaults] setObject:@[today] forKey:@"TMConsecutiveDayHelper"];
    }
    // if the streak is intact, save the updated array in NSUserDefaults
    else {
        [[NSUserDefaults standardUserDefaults] setObject:dateArray forKey:@"TMConsecutiveDayHelper"];

    }
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+(NSInteger) streakSizeInDays {
    
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"TMConsecutiveDayHelper"] count];

}

+(BOOL) hasComeBackForThisExactNumberOfDaysConsecutively:(NSInteger) consecutiveDaysToTest {
    
    BOOL retVal = NO;
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"TMConsecutiveDayHelper"] count] == consecutiveDaysToTest) {
        retVal = YES;
    }
    return retVal;
}

//+(void) createTestDataInUserDefaults {
//
//    NSMutableArray *testDates = [[NSMutableArray alloc] init];
//
//    for (NSInteger i = 1; i < 10; i++) {
//        NSDate *today = [[NSDate date] dateWithoutTime];
//        today = [today dateByAddingDays:i];
//        [testDates addObject:today];
//
//    }
//    [[NSUserDefaults standardUserDefaults] setObject:testDates forKey:@"TMConsecutiveDayHelper"];
//
//    [[NSUserDefaults standardUserDefaults] synchronize];
//
//}

+(void) resetStreak {
    
    NSDate *today = [[NSDate date] dateWithoutTime];
    [[NSUserDefaults standardUserDefaults] setObject:@[today] forKey:@"TMConsecutiveDayHelper"];
}



@end
