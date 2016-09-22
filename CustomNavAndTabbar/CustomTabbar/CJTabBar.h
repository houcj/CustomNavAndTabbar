//
//  CJTabBar.h
//  CustomNavAndTabbar
//
//  Created by 侯春娇 on 16/9/22.
//  Copyright © 2016年 侯春娇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJTabBar;

@protocol CJTabBarDelegate <NSObject>

- (void)tabBarSelfDefined:(CJTabBar *)tabBar didSelectItem:(NSInteger)toIndex fromItem:(NSInteger)fromItem;

@end
@interface CJTabBar : UIView

@property (nonatomic , weak)id<CJTabBarDelegate> delegate;
@property(nonatomic , strong)NSArray* items;
@property(nonatomic , assign)NSInteger selectedIndex;
@property(nonatomic , assign)BOOL isAnimate;
@property(nonatomic , strong)UIImageView* bgImageView;


- (void)setBadgeAtIndex:(NSInteger)index hidden:(BOOL)hidden;
- (BOOL)hasBadgeAtIndex:(NSInteger)index;
- (NSString*)badgeValueAtIndex:(NSInteger)index;
- (void)setBadgeAtIndex:(NSUInteger)index hidden:(BOOL)hidden badgeValue:(NSString*)value;
- (void)selectButtonAtIndex:(NSUInteger)index;

-(void)setTabbarItem:(id)Item atIndex:(NSInteger)index;

-(id)tabbarItemAtIndex:(NSInteger)index;

@end
