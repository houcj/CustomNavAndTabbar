//
//  CJTabbarController.m
//  CustomNavAndTabbar
//
//  Created by 侯春娇 on 16/9/22.
//  Copyright © 2016年 侯春娇. All rights reserved.
//

#import "CJTabbarController.h"
#import "CJTabBar.h"
#import "AppDelegate.h"
#import "UIView+Common.h"
#import "CJTabbarItem.h"

@interface CJTabbarController ()

@end

@implementation CJTabbarController

- (instancetype)init{
    if (self = [super init]) {
        self.tabBar.hidden = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tabBarSelfDefined = [[CJTabBar alloc] initWithFrame:CGRectMake(0, K_ScreenHeight - K_TabbarHeight, K_ScreenWidth, K_TabbarHeight)];
    _tabBarSelfDefined.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _tabBarSelfDefined.delegate = self;
    showTabBar = YES;
    [self.view addSubview:_tabBarSelfDefined];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBar.hidden = YES;
    self.view.backgroundColor = [UIColor blackColor];
}

-(void)setViewControllers:(NSArray *)viewControllers{
    NSInteger cout = [viewControllers count];
    NSMutableArray* tabArr = [NSMutableArray array];
    for (int index = 0; index <cout; index ++) {
        NSDictionary* dic   = @{@"BackImageName":@"",
                                @"indicateImgName":@"",
                                @"title":@"我的金矿"};
        [tabArr addObject:dic];
    }
    _tabBarSelfDefined.items = [tabArr copy];
    [super setViewControllers:viewControllers];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    
    if (selectedIndex>[self.viewControllers count]) return;
    [super setSelectedIndex:selectedIndex];
    
    _tabBarSelfDefined.selectedIndex = selectedIndex;
    
}

- (void)setTabBarAnimatedView:(NSInteger)index{
    
    
}

-(void)tabBarSelfDefined:(CJTabBar *)tabBar didSelectItem:(NSInteger)toIndex fromItem:(NSInteger)fromItem{
    
    self.selectedIndex = toIndex;
}

- (void)hideTabBar:(BOOL)animated
{
    
    if (!showTabBar)return;
    showTabBar = FALSE;
    [self toggleTabBar:animated];
}

- (void)showTabBar:(BOOL)animated
{
    if (showTabBar)return;
    showTabBar = TRUE;
    [self toggleTabBar:animated];
}

- (void)toggleTabBar:(BOOL)animated
{
    CGFloat top = K_ScreenHeight - K_TabbarHeight;
    UIView *rootView = [AppDelegate appDelegate].rootViewController.view;
    rootView.backgroundColor = [UIColor blackColor];
    if (rootView) {//写死高度，在有 incall status bar 的时候位置不对·
        top=rootView.height - K_TabbarHeight;
    }
    
    if( showTabBar )
    {
        if( _tabBarSelfDefined.frame.origin.x > -160 )
            return;
        
        self.tabBar.hidden = TRUE;
        if (animated) {
            [UIView beginAnimations:nil context:nil];
            
            [UIView setAnimationDuration:0.32];
    
        }
        _tabBarSelfDefined.frame = CGRectMake(0, top, K_ScreenWidth, K_TabbarHeight);
        if (animated) {
            [UIView commitAnimations];
        }
    }
    else
    {
        if( _tabBarSelfDefined.frame.origin.x < -160 )
            return;
        
        self.tabBar.hidden = TRUE;
        if (animated) {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.25];
            
        }
        
        _tabBarSelfDefined.frame = CGRectMake(-K_ScreenWidth, top, K_ScreenWidth, K_TabbarHeight);
        if (animated) {
            [UIView commitAnimations];
        }
    }
}

- (void)setBadgeAtIndex:(NSInteger)index hidden:(BOOL)hidden{
    
}
- (BOOL)hasBadgeAtIndex:(NSInteger)index{
    
    return YES;
    
}
- (NSString*)badgeAtIndex:(NSInteger)index{
    return @"";
}
- (void)setBadgeAtIndex:(NSInteger)index hidden:(BOOL)hidden badgeValue:(NSString*)value{
    
    
}

-(id)getSelectedNaviController{
    return self.selectedViewController;
}
-(void)openViewController:(UIViewController*)viewController{
    
    
}


- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated
{
    [super setViewControllers:viewControllers animated:animated];
    for (UINavigationController *vc in viewControllers) {
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc.delegate = self;
        }
    }
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    if (viewController == navigationController.childViewControllers.firstObject) {
        [self showTabBar:animated];
    }else{
        [self hideTabBar:animated];
    }
}


- (id)getSelectNavTopViewController
{
    UINavigationController *nav = (id)self.selectedViewController;
    if ([nav isKindOfClass:[UINavigationController class]]) {
        return nav.topViewController;
    }
    return nil;
}

-(void)setIsAnimate:(BOOL)isAnimate{
    _isAnimate = isAnimate;
    self.tabBarSelfDefined.isAnimate = isAnimate;
}

- (void)tintSelectedTabColor:(NSNotification *)noti
{
    NSInteger tabIndex =  _tabBarSelfDefined.selectedIndex;
    CJTabbarItem* item =   _tabBarSelfDefined.items[tabIndex];
    item.selected = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
