//
//  TMViewController.h
//  consecutiveDayHelper
//
//  Created by Nicholas Iannone on 6/19/14.
//  Copyright (c) 2014 Tiny Mobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMConsecutiveDayHelper.h"


@interface TMViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *consecutiveDaysLaunchedLabel;
@property (strong, nonatomic) IBOutlet UITextView *savedDatesTextView;
- (IBAction)refreshData:(id)sender;
@end
