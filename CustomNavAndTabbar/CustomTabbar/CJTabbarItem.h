//
//  CJTabbarItem.h
//  CustomNavAndTabbar
//
//  Created by 侯春娇 on 16/9/22.
//  Copyright © 2016年 侯春娇. All rights reserved.
//

#import <UIKit/UIKit.h>


extern NSString* kBarItemBackgroundImage;
extern NSString* kBarItemSelectedImage;
extern NSString* kBarItemNormalImage;
extern NSString* kBarItemTitle;

@interface CJTabbarItem : UIControl

@property(nonatomic ,strong)NSDictionary* itemInfo;
@property(nonatomic , strong)UIColor* textColor;


-(void)setTextColor:(UIColor *)textColor fontSize:(UIFont*)font;

@end
