//
//  TMViewController.m
//  consecutiveDayHelper
//
//  Created by Nicholas Iannone on 6/19/14.
//  Copyright (c) 2014 Tiny Mobile Inc. All rights reserved.
//

#import "TMViewController.h"

@interface TMViewController ()

@end

@implementation TMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.consecutiveDaysLaunchedLabel.text = [NSString stringWithFormat:@"%i",[TMConsecutiveDayHelper streakSizeInDays]];
    self.savedDatesTextView.text = [[[NSUserDefaults standardUserDefaults] objectForKey:@"TMConsecutiveDayHelper"] description];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshData:(id)sender {
    
    [TMConsecutiveDayHelper resetStreak];
    self.consecutiveDaysLaunchedLabel.text = [NSString stringWithFormat:@"%i",[TMConsecutiveDayHelper streakSizeInDays]];
    self.savedDatesTextView.text = [[[NSUserDefaults standardUserDefaults] objectForKey:@"TMConsecutiveDayHelper"] description];

}
@end
