//
//  CJTabBar.m
//  CustomNavAndTabbar
//
//  Created by 侯春娇 on 16/9/22.
//  Copyright © 2016年 侯春娇. All rights reserved.
//

#import "CJTabBar.h"

#import "CJTabbarItem.h"
#import "UIView+Common.h"

@interface CJTabBar ()

@property (nonatomic,strong)UIImageView *animateView;
@property(nonatomic , strong)NSMutableArray* introMutableItems;

@end

@implementation CJTabBar

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.bgImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.bgImageView setImage:[[UIImage imageNamed:@"gi.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:10]];
        [self addSubview:self.bgImageView];
        _introMutableItems = [NSMutableArray array];
        UIImage *image = [UIImage imageNamed:@"tabbarItem_selected"];
        _animateView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0 , 0, image.size.height)];
        _animateView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        _animateView.image = image;
        [self addSubview:_animateView];
        
    }
    self.backgroundColor = [UIColor blackColor];
    
    return  self;
}


- (void)setBadgeAtIndex:(NSInteger)index hidden:(BOOL)hidden{
    
    
    
}

- (BOOL)hasBadgeAtIndex:(NSInteger)index{
    
    return NO;
}

- (NSString*)badgeValueAtIndex:(NSInteger)index{
    return @"dd";
}

- (void)setBadgeAtIndex:(NSUInteger)index hidden:(BOOL)hidden badgeValue:(NSString*)value{
    
}

- (void)selectButtonAtIndex:(NSUInteger)index{
    
}

-(void)setSelectedIndex:(NSInteger)selectedIndex{
    
    //tabarItem点击事件埋点
    CJTabbarItem* control = _introMutableItems[selectedIndex];
    for (CJTabbarItem *item in  _introMutableItems) {
        if (control == item) {
            control.selected = YES;
            if (self.isAnimate) {
                [UIView animateWithDuration:0.26 animations:^{
                    _animateView.left = control.left;
                }];
            }else{
                _animateView.left = control.left;
            }
            
        }else{
            
            item.selected=NO;
        }
        
    }
    _selectedIndex = selectedIndex;
    
}


-(void)setItems:(NSArray *)items{
    if (!items) {
        return;
    }
    _items = items;
    [_introMutableItems removeAllObjects];
    NSInteger count = [_items count];
    if (count <= 0) {
        return;
    }
    CGFloat itemWidth = self.width/count;
    _animateView.width = itemWidth;
    CJTabbarItem* tempItem;
    for (int i = 0; i< count; i++) {
        
        NSDictionary* tempDic = [_items objectAtIndex:i];
        tempItem = [[CJTabbarItem alloc] initWithFrame:CGRectMake(i*itemWidth , 0, itemWidth, self.height)];
        tempItem.itemInfo = tempDic;
        tempItem.textColor = [UIColor whiteColor];
        [_introMutableItems addObject:tempItem];
        [self addSubview:tempItem];
        [tempItem addTarget:self action:@selector(tapOnItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    CJTabbarItem* firstItem = [_introMutableItems firstObject];
    firstItem.selected = YES;
    _items = [_introMutableItems copy];
}


-(void)tapOnItem:(id)sender{
    
    CJTabbarItem* control = (CJTabbarItem*)sender;
    NSInteger selectedIndex = [_items indexOfObject:control];
    if ([self.delegate  respondsToSelector:@selector(tabBarSelfDefined:didSelectItem:fromItem:)]) {
        [self.delegate tabBarSelfDefined:self didSelectItem:selectedIndex fromItem:_selectedIndex];
    }
}


-(void)setTabbarItem:(UIControl*)Item atIndex:(NSInteger)index{
    if (index >= [_items count]) {
        return;
    }
    UIControl* oriControl = _items[index];
    CGRect rectFrame = oriControl.frame;
    [oriControl removeFromSuperview];
    Item.frame = rectFrame;
    //[self insertSubview:Item atIndex:0];
    [self addSubview:Item];
    [Item addTarget:self action:@selector(tapOnItem:) forControlEvents:UIControlEventTouchUpInside];
    [_introMutableItems setObject:Item atIndexedSubscript:index];
    _items = [_introMutableItems copy];
    
}

-(id)tabbarItemAtIndex:(NSInteger)index{
    if (index >= [self.introMutableItems count]) {
        return nil;
    }
    return self.introMutableItems[index];
}


@end
