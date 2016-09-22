//
//  AppDelegate.m
//  CustomNavAndTabbar
//
//  Created by 侯春娇 on 16/9/21.
//  Copyright © 2016年 侯春娇. All rights reserved.
//

#import "AppDelegate.h"

#import "CJTabbarController.h"
#import "CJTabbarItem.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self initWithRootViewController];
    
//    FirstViewController *firstVC = [[FirstViewController alloc] init];
//    firstVC.title = @"first";
//    
//    SecondViewController *secondVC = [[SecondViewController alloc] init];
//    secondVC.title = @"second";
//    
//    UITabBarController *tabbar = [[UITabBarController alloc] init];
//    [tabbar setViewControllers:@[firstVC,secondVC]];
//    
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tabbar];
//    
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    [self.window setRootViewController:nav];
//    [self.window makeKeyAndVisible];
//    
//    NSLog(@"controlls,%@",nav.viewControllers);
    
    return YES;
}

+(AppDelegate*)appDelegate{
    
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

-(void)initWithRootViewController{
    FirstViewController* firstCtrl = [[FirstViewController alloc] init];
    UINavigationController* firstNavi = [[UINavigationController alloc] initWithRootViewController:firstCtrl];
    
    SecondViewController *secondCtrl = [[SecondViewController alloc] init];
    UINavigationController *secondNavi = [[UINavigationController alloc] initWithRootViewController:secondCtrl];
    
    CJTabbarController* tabbarCtrl = [[CJTabbarController alloc] init];
    tabbarCtrl.viewControllers = @[firstNavi,secondNavi];
    
    CJTabbarItem* item = [[CJTabbarItem alloc] init];
    item.itemInfo = @{kBarItemNormalImage:@"home_icon",
                      kBarItemSelectedImage:@"home_icon_on",
                      kBarItemTitle:@"first"
                      };
    [tabbarCtrl.tabBarSelfDefined setTabbarItem:item atIndex:0];
    
    item = [[CJTabbarItem alloc] init];
    item.itemInfo = @{kBarItemNormalImage:@"my_icon",
                      kBarItemSelectedImage:@"my_icon_on",
                      kBarItemTitle:@"second"
                      };
    [tabbarCtrl.tabBarSelfDefined setTabbarItem:item atIndex:1];
    
    [tabbarCtrl.tabBarSelfDefined setBackgroundColor:[UIColor blackColor]];
    
    self.window.rootViewController = tabbarCtrl;
    self.rootViewController = tabbarCtrl;
    [tabbarCtrl setSelectedIndex:0];
    
    [self.window makeKeyAndVisible];
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
