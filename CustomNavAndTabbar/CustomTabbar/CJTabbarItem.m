//
//  CJTabbarItem.m
//  CustomNavAndTabbar
//
//  Created by 侯春娇 on 16/9/22.
//  Copyright © 2016年 侯春娇. All rights reserved.
//

#import "CJTabbarItem.h"
#import "UIView+Common.h"

NSString* kBarItemBackgroundImage = @"barItemBackgroundImage";
NSString* kBarItemSelectedImage = @"barItemSelectedImage";
NSString* kBarItemNormalImage = @"barItemNormalImage";
NSString* kBarItemTitle = @"barItemTitle";

@interface CJTabbarItem ()
@property(nonatomic , strong)UIImageView* backImgeView;
@property(nonatomic , strong)UIImageView* indicateImgView;
@property(nonatomic , strong)UILabel* titleLab;
@property(nonatomic , strong)UIImage* normalImg;
@property(nonatomic , strong)UIImage*  backGroundImg;
@property(nonatomic , strong)UIImage* selectImage;
@property(nonatomic , strong)NSString* title;
@end

@implementation CJTabbarItem

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _backImgeView = [[UIImageView alloc] initWithFrame:frame];
        _backImgeView.userInteractionEnabled = NO;
        [self addSubview:_backImgeView];
        
        _indicateImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 20, 20)];
        _indicateImgView.userInteractionEnabled = NO;
        [self addSubview:_indicateImgView];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(_indicateImgView.right+5, 10, 20, 13)];
        _titleLab.font = [UIFont systemFontOfSize:12];
        [self addSubview:_titleLab];
        
        self.alpha = 1;
        
    }
    return self;
}


-(void)setItemInfo:(NSDictionary *)itemInfo{
    
    _itemInfo = itemInfo;
    NSString* backImgStr = [itemInfo objectForKey:kBarItemBackgroundImage];
    NSString* indicateImgStr = [itemInfo objectForKey:kBarItemNormalImage];
    _titleLab.text = [itemInfo objectForKey:kBarItemTitle];
    self.normalImg = [UIImage imageNamed:indicateImgStr];
    self.backGroundImg = [[UIImage imageNamed:backImgStr] stretchableImageWithLeftCapWidth:2 topCapHeight:2];
    self.selectImage = [UIImage imageNamed:[itemInfo objectForKey:kBarItemSelectedImage]];
    [self setViewInfo:NO];
}
-(void)setTextColor:(UIColor*)color{
    _titleLab.textColor = color;
}

-(void)setTextColor:(UIColor *)textColor fontSize:(UIFont*)font{
    _titleLab.textColor = textColor;
    _titleLab.font = font;
    
    
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    [self setViewInfo:selected];
    
}

-(void)setViewInfo:(BOOL)selected{
    [self.backImgeView setImage:self.backGroundImg];
    if (selected) {
        [self.indicateImgView setImage:self.selectImage];
        self.titleLab.textColor = [UIColor colorWithRed:(float)255/255 green:(float)163/255 blue:(float)18/255 alpha:1.0];
    }else{
        [self.indicateImgView setImage:self.normalImg];
        self.titleLab.textColor = [UIColor whiteColor];
    }
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_titleLab sizeToFit];
    _backImgeView.frame = self.bounds;
    
    _indicateImgView.width = self.normalImg.size.width;
    _indicateImgView.height = self.normalImg.size.height;
    _indicateImgView.top = 7;
    _titleLab.centerX = _indicateImgView.centerX = self.width/2;
    
    _titleLab.top = _indicateImgView.bottom + 3 ;
    
}


@end
