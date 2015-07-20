//
//  YDWaterViewCell.m
//  divercity_瀑布流实现
//
//  Created by 唐亚狄 on 15-7-19.
//  Copyright (c) 2015年 TYD. All rights reserved.
//

#import "YDWaterViewCell.h"
#import "HMWaterflowView.h"
#import "UIImageView+WebCache.h"
#import "YDWater.h"
@interface YDWaterViewCell()
/**
 *  用户的图片地址
 */
//@property (nonatomic, weak) UIImageView *postImageView;
/**
 *  用户的头像地址
 */
@property (nonatomic, copy) NSString *profileImage;
/**
 * 距离
 */
@property (nonatomic, assign) double distance;
/**
 *  用户的昵称
 */
@property (nonatomic, copy) NSString *nickname;
/**
 *  用户所发的内容
 */
@property (nonatomic, copy) NSString *text;
/**
 *  用户所发的声音
 */
@property (nonatomic, copy) NSString *voice;
/**
 *  用户距离
 */
@property (nonatomic, copy) NSString *uid;
/**
 *  cell下方的工具条
 */
@property (nonatomic, weak) UIView *footerView;
@end

@implementation YDWaterViewCell

+ (instancetype)cellWithWaterflowView:(HMWaterflowView *)waterflowView
{
    static NSString *ID = @"SHOP";
    YDWaterViewCell *cell = [waterflowView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[YDWaterViewCell alloc] init];
        cell.identifier = ID;
    }
    return cell;
}

- (void)setWater:(YDWater *)water
{
    _water = water;
    [self.postImageView sd_setImageWithURL:[NSURL URLWithString:water.postImage] placeholderImage:[UIImage imageNamed:@"loding"]];
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *postImageView = [[UIImageView alloc] init];
        [self addSubview:postImageView];
        self.postImageView = postImageView;
       
        UIView *footerView = [[UIView alloc] init];
        footerView.backgroundColor = [UIColor blackColor];
        [self addSubview:footerView];
        self.footerView = footerView;
        
        
        UILabel *text = [[UILabel alloc] init];
        text.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        text.textAlignment = NSTextAlignmentCenter;
        text.textColor = [UIColor whiteColor];
        [self addSubview:text];
//        self.text = text;
        
        
       
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.postImageView.frame = self.bounds;

    CGFloat footerViewX = 0;
    CGFloat footerViewW = self.bounds.size.width;
    CGFloat footerViewY = self.bounds.size.height;
    CGFloat footerViewH = 60;
    
    self.footerView.frame = CGRectMake(footerViewX, footerViewY, footerViewW, footerViewH);
}

@end
