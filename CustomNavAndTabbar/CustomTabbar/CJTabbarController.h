//
//  CJTabbarController.h
//  CustomNavAndTabbar
//
//  Created by 侯春娇 on 16/9/22.
//  Copyright © 2016年 侯春娇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJTabBar.h"

@class CJTabBar;

@interface UIViewController (CJTabbarController)

@property (assign, nonatomic) BOOL swHidesBottomBar;

@end
@interface CJTabbarController : UITabBarController<CJTabBarDelegate,UINavigationControllerDelegate>
{
    BOOL showTabBar;
}

@property(nonatomic , strong)CJTabBar* tabBarSelfDefined;
@property(nonatomic , assign)BOOL isAnimate;

- (void)setTabBarAnimatedView:(NSInteger)index;

- (void)hideTabBar:(BOOL)animated;
- (void)showTabBar:(BOOL)animated;

- (void)setBadgeAtIndex:(NSInteger)index hidden:(BOOL)hidden;
- (BOOL)hasBadgeAtIndex:(NSInteger)index;
- (NSString*)badgeAtIndex:(NSInteger)index;
- (void)setBadgeAtIndex:(NSInteger)index hidden:(BOOL)hidden badgeValue:(NSString*)value;
-(id)getSelectedNaviController;
-(void)openViewController:(UIViewController*)viewController;

@end
