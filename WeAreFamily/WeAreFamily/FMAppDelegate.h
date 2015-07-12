//
//  FMAppDelegate.h
//  WeAreFamily
//
//  Created by lly on 15/5/20.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FMTabbarController;
@interface FMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) FMTabbarController *mainTabbarController;

@end

