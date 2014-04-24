//
//  SKActivityStatusBar.h
//  SKActivityStatusBar
//  Version : 1.0
//  Created by Karthik S on 24/04/14.
//
//  Class handles the Activity Status Bar Creation and Removal from View
//  Class Type : Singleton
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

#import <Foundation/Foundation.h>

@interface SKActivityStatusBar : NSObject

@property (nonatomic, strong) NSString *status;   // Current Status Text //

+ (id)sharedActivityStatusBar;   // Singleton Creation //

- (void)showActivityStatusBarWithStatus:(NSString*)status;  // Show Status Bar //

- (void)hideActivityStatusBar;   // Hide Status Bar //

@end
