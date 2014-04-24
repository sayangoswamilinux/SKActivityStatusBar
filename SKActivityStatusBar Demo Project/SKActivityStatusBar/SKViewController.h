//
//  SKViewController.h
//  SKActivityStatusBar
//
//  Created by Karthik S on 24/04/14.
//  Copyright (c) 2014 Karthik Sankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKActivityStatusBar.h"    // Import SKActivityStatus Bar Header //

@interface SKViewController : UIViewController
{
    SKActivityStatusBar *activityStatusBar;   // An SKActivityStatusBar Object //
}

@property (weak, nonatomic) IBOutlet UITextField *statusTextField; // Status Text Field //

// SKActivityStatus Bar Methods //
- (IBAction)showActivityStatusBar:(id)sender;
- (IBAction)hideActivityStatusBar:(id)sender;

@end
