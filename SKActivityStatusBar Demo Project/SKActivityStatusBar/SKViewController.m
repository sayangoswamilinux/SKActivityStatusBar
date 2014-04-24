//
//  SKViewController.m
//  SKActivityStatusBar
//
//  Created by Karthik S on 24/04/14.
//  Copyright (c) 2014 Karthik Sankar. All rights reserved.
//

#import "SKViewController.h"

@interface SKViewController ()

@end

@implementation SKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create an Instance for SKActivityStatusBar Object //
    activityStatusBar = [SKActivityStatusBar sharedActivityStatusBar];
    
    // Tap Recognizer //
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tapRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Button Actions
// Shows SKActivityStaus Bar when tapped //
- (IBAction)showActivityStatusBar:(id)sender {
    if (self.statusTextField.text.length > 0) {
        [activityStatusBar showActivityStatusBarWithStatus:self.statusTextField.text];
    }
    else
    {
        [activityStatusBar showActivityStatusBarWithStatus:@"Please enter a text in text field"];
    }
}

// Hides SKActivityStatus Bar when tapped //
- (IBAction)hideActivityStatusBar:(id)sender {
    [activityStatusBar hideActivityStatusBar];
}

// Dismiss Keyboard //
-(void)dismissKeyboard {
    [self.statusTextField resignFirstResponder];
}
@end
