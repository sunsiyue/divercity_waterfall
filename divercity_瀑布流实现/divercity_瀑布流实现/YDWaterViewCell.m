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

#define YDColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface YDWaterViewCell()
/**
 *  用户的图片地址
 */
@property (nonatomic, weak) UIImageView *postImageView;
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
 *  cell下方的工具条整体
 */
@property (nonatomic, weak) UIView *footerView;
/**
 *  用户说说测试
 */
@property (nonatomic, weak) UILabel *textView;
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
    // 用户图片数据
    [self.postImageView sd_setImageWithURL:[NSURL URLWithString:water.postImage] placeholderImage:[UIImage imageNamed:@"loding"]];
    // 用户说说的数据
    self.text = water.text;
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化
        // 用户图片
        UIImageView *postImageView = [[UIImageView alloc] init];
        postImageView.contentMode = UIViewContentModeScaleAspectFill;
        postImageView.clipsToBounds = YES;
        postImageView.layer.cornerRadius = 2.0;
        postImageView.layer.masksToBounds = YES;
        postImageView.layer.borderColor = [[UIColor colorWithWhite:0.8 alpha:1.0]CGColor];
        postImageView.layer.borderWidth = 0.2;
        [self addSubview:postImageView];
        self.postImageView = postImageView;
       // 下方工具条整体
        UIView *footerView = [[UIView alloc] init];
        footerView.backgroundColor = [UIColor whiteColor];
        [self addSubview:footerView];
        self.footerView = footerView;
        
        // 测试发表的说说
        UILabel *textView = [[UILabel alloc] init];
        textView.text = @"Locking for language partners Divercity";
//        textView.backgroundColor = [UIColor redColor];
        textView.textAlignment = NSTextAlignmentCenter;
        textView.font = [UIFont  fontWithName:@"HelveticaNeue" size:8.0];
        textView.textColor = [UIColor grayColor];
        textView.clipsToBounds = YES;
        textView.layer.cornerRadius = 3.0;
        textView.layer.masksToBounds = YES;
        textView.layer.borderColor = [[UIColor colorWithWhite:0.8 alpha:1.0]CGColor];
        textView.layer.borderWidth = 0.2;
        [self addSubview:textView];
        self.textView = textView;
        
        
       
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 用户发表的图片Frame
    self.postImageView.frame = self.bounds;
    
    // 下方工具条的Frame
    CGFloat footerViewX = 0;
    CGFloat footerViewH = 40;
    CGFloat footerViewW = self.bounds.size.width;
    CGFloat footerViewY = self.bounds.size.height;
    self.footerView.frame = CGRectMake(footerViewX, footerViewY, footerViewW, footerViewH);
    
     // 测试发表的说说Frame
    self.textView.frame = CGRectMake(footerViewX, footerViewY, footerViewW, 30);
}

@end
