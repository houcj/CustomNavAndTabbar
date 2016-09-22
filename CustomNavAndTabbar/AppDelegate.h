//
//  AppDelegate.h
//  CustomNavAndTabbar
//
//  Created by 侯春娇 on 16/9/21.
//  Copyright © 2016年 侯春娇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong , nonatomic)UIViewController* rootViewController;

+(AppDelegate*)appDelegate;

-(void)initWithRootViewController;

@end

