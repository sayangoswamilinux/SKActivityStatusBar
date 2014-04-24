//
//  SKActivityStatusBar.m
//  SKActivityStatusBar
//  Version :1.0
//  Created by Karthik S on 24/04/14.
//
//  Lincense Type : Open Source MIT - http://opensource.org/licenses/MIT
//  The MIT License (MIT)

//  Copyright (c) 2014 Karthik Sankar

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "SKActivityStatusBar.h"

#define kTimeForAnimation  0.4f   // Speed of Status Bar Appearing from Top //

#define SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)   // Screen Width Macro //

#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)     // Screen Height Macro //

#define IS_PORTRAIT UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)               // Orientation of Screen //

#define DegreesToRadians(degrees) (degrees * M_PI / 180)

const static CGFloat kActivityStatusBarHeight = 20;   // Height of Status Bar //

@interface SKActivityStatusBar()
{
    UIWindow *statusWindow;             // Status Bar Base Window //
    UIView *contentView;                // Status Bar Base Container View //
    UILabel *statusLabel;               // Status Bar Text //
    UIActivityIndicatorView *activityIndicator; // Status Bar Activity Indicator //
}
@end

@implementation SKActivityStatusBar

#pragma mark Singleton Methods
/*!
 Creates a Single Instance of the Status Activity Indicator
 @returns self
 */
+ (id)sharedActivityStatusBar {
    static SKActivityStatusBar *sharedActivityStatusBar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedActivityStatusBar = [[self alloc] init];
    });
    return sharedActivityStatusBar;
}
/*!
 Enters the default status text and allocates the status bar memory
 */
- (id)init {
    if (self = [super init]) {
        self.status = @"Default Status";
        [self setupActivityStatusBarView];
    }
    return self;
}

#pragma mark - Initial View Creation
/*!
 Creates the basic UI for the Status Bar
 */
- (void)setupActivityStatusBarView
{
    // Get Screen Width //
    CGFloat screenWidth = [UIScreen mainScreen].applicationFrame.size.width;
    
    // Create a Window //
    statusWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, -kActivityStatusBarHeight, screenWidth, kActivityStatusBarHeight)];
    statusWindow.windowLevel = UIWindowLevelStatusBar;
    statusWindow.backgroundColor = [UIColor clearColor];
    
    // Create a Content View //
    contentView = [[UIView alloc]initWithFrame:CGRectMake(statusWindow.frame.origin.x, statusWindow.frame.origin.y, screenWidth, kActivityStatusBarHeight)];
    contentView.backgroundColor = [UIColor clearColor];
    contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    // Create Status Label //
    statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2,contentView.frame.origin.y, screenWidth, kActivityStatusBarHeight)];
    float widthForText =
    [statusLabel.text
     boundingRectWithSize:statusLabel.frame.size
     options:NSStringDrawingUsesLineFragmentOrigin
     attributes:@{ NSFontAttributeName:statusLabel.font }
     context:nil]
    .size.width;
    
    [statusLabel setFrame:CGRectMake(screenWidth/2-widthForText/2, contentView.frame.origin.y, widthForText, kActivityStatusBarHeight)];
    statusLabel.backgroundColor = [UIColor clearColor];
    statusLabel.textColor = [UIColor blackColor];
    statusLabel.font = [UIFont systemFontOfSize:12.0];
    statusLabel.numberOfLines = 1;
    
    // Create Activity Indicator //
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
    activityIndicator.transform = CGAffineTransformMakeScale(0.6, 0.6);
    activityIndicator.frame = CGRectMake(statusLabel.frame.origin.x-activityIndicator.frame.size.width-10,contentView.frame.origin.y, 20, 20);
    activityIndicator.hidesWhenStopped = YES;
    
    // Add SubViews to Content View //
    [contentView addSubview:statusLabel];
    [contentView addSubview:activityIndicator];
    
    // Add ContentView to Window //
    [statusWindow addSubview:contentView];
}

#pragma mark - Show / Hide System Status Bar
/*!
 Shows the iOS Status Bar
 */
- (void)showSystemStatusBar
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
}

/*!
 Hides the iOS Status Bar
 */
- (void)hideSystemStatusBar
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
}

#pragma mark - Show/Hide Activity Status Bar
/*!
 Animates the SKActivity Status Bar to appear with the title and 
 activity indicator 
 */
- (void)showStatusBar
{
    // Set Window Hidden to NO //
    statusWindow.hidden = NO;
    
    [activityIndicator startAnimating];  // Start Activity Indicator //
    
    // Set Status Text //
    [statusLabel setText:self.status];
    
    // Get Screen Width //
    CGFloat screenWidth = [UIScreen mainScreen].applicationFrame.size.width;
    
    // Animate the Window to View //
    [UIView animateWithDuration:kTimeForAnimation animations:^{
        [statusWindow setFrame:CGRectMake(0,0, screenWidth, kActivityStatusBarHeight)];
        [contentView setFrame:CGRectMake(statusWindow.frame.origin.x, statusWindow.frame.origin.y, screenWidth, kActivityStatusBarHeight)];
        float widthForText =
        [statusLabel.text
         boundingRectWithSize:statusLabel.frame.size
         options:NSStringDrawingUsesLineFragmentOrigin
         attributes:@{ NSFontAttributeName:statusLabel.font }
         context:nil]
        .size.width;
        
        [statusLabel setFrame:CGRectMake(screenWidth/2-widthForText/2, contentView.frame.origin.y, widthForText, kActivityStatusBarHeight)];
        [activityIndicator setFrame:CGRectMake(statusLabel.frame.origin.x-activityIndicator.frame.size.width,contentView.frame.origin.y, 20, 20)];
    } completion:^(BOOL finished) {
        
    }];
}

/*!
 Animates the SKActivity Status Bar to disappear from screen
 */
- (void)hideStatusBar
{
    // Get Screen Width //
    CGFloat screenWidth = [UIScreen mainScreen].applicationFrame.size.width;
    
    // Animate the Window to View //
    [UIView animateWithDuration:kTimeForAnimation animations:^{
        [statusWindow setFrame:CGRectMake(0,-kActivityStatusBarHeight,screenWidth, kActivityStatusBarHeight)];
        [contentView setFrame:CGRectMake(statusWindow.frame.origin.x, statusWindow.frame.origin.y, screenWidth, kActivityStatusBarHeight)];
        [statusLabel setFrame:CGRectMake(screenWidth/2, contentView.frame.origin.y, screenWidth, kActivityStatusBarHeight)];
        [activityIndicator setFrame:CGRectMake(statusLabel.frame.origin.x-activityIndicator.frame.size.width,contentView.frame.origin.y, 20, 20)];
    } completion:^(BOOL finished) {
        // Set Window Hidden to YES //
        statusWindow.hidden = YES;
        // Stop Activity Indicator //
        [activityIndicator stopAnimating];
        
        // Show System Status Bar //
        [self showSystemStatusBar];
    }];
}

#pragma mark - Show Methods
/*!
 Hides iOS System Status Bar and Shows SKActivity Status Bar
 */
- (void)showActivityStatusBarWithStatus:(NSString*)status
{
    // Set Status //
    self.status = status;
    
    // Show Status Bar //
    [self showStatusBar];
    
    // Hide System Status Bar //
    [self hideSystemStatusBar];
}

/*!
 Hides SKActivity Status Bar and Shows iOS System Status Bar
 */
- (void)hideActivityStatusBar
{
    // Hide Status Bar //
    [self hideStatusBar];
}


@end
