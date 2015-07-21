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
//@property (nonatomic, weak) UIImageView *postImageView;
/**
 *  用户的头像地址
 */
@property (nonatomic, weak) UIImageView *profileImageView;
//@property (nonatomic, copy) NSString *profileImage;
/**
 * 距离
 */
@property (nonatomic,strong) UILabel *distance;
//@property (nonatomic, assign) double distance;
/**
 *  用户的昵称
 */
@property (nonatomic,strong) UILabel *nicename;
//@property (nonatomic, copy) NSString *nickname;
/**
 *  用户第一语言
 */
@property (nonatomic,strong) UILabel *first;
@property (nonatomic,strong) UILabel *firstLanguage;
/**
 *  用户第二语言
 */
@property (nonatomic,strong) UILabel *second;
@property (nonatomic,strong) UILabel *secondLanguage;
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
    self.textView.text = @"Locking for language partners Divercity";
    //self.text = water.text;
    // 用户头像
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:water.profileImage] placeholderImage:[UIImage imageNamed:@"loding"]];
    // 用户网名
    self.nicename.text = water.nickname;
    // 第一语言－－点
    self.first.text = @".";
    // 第一语言
    self.firstLanguage.text = @"Chinese";
    // 第二语言－－点
    self.second.text = @".";
    // 第二语言
    self.secondLanguage.text = @"English";
    // 距离
 //   self.distance.text = water.;
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化
        // 用户发表图片
        UIImageView *postImageView = [[UIImageView alloc] init];
        postImageView.contentMode = UIViewContentModeScaleAspectFill;
        postImageView.clipsToBounds = YES;
        postImageView.layer.cornerRadius = 3.0;
        postImageView.layer.masksToBounds = YES;
        postImageView.layer.borderColor = [[UIColor colorWithWhite:0.8 alpha:1.0]CGColor];
        postImageView.layer.borderWidth = 0.2;
        [self addSubview:postImageView];
        self.postImageView = postImageView;

        
        // 测试发表的说说
        UILabel *textView = [[UILabel alloc] init];
        textView.numberOfLines = 2;
        textView.backgroundColor = [UIColor whiteColor];
      //  textView.textAlignment = NSTextAlignmentCenter;
        textView.font = [UIFont  fontWithName:@"HelveticaNeue" size:10.0];
        textView.textColor = [UIColor grayColor];
        textView.clipsToBounds = YES;
        textView.layer.cornerRadius = 3.0;
        textView.layer.masksToBounds = YES;
        textView.layer.borderColor = [[UIColor colorWithWhite:0.8 alpha:1.0]CGColor];
        textView.layer.borderWidth = 0.2;
        [self addSubview:textView];
        self.textView = textView;
        
        // 下方工具条整体
        UIView *footerView = [[UIView alloc] init];
        footerView.backgroundColor = [UIColor whiteColor];
        footerView.clipsToBounds = YES;
        footerView.layer.cornerRadius = 3.0;
        footerView.layer.masksToBounds = YES;
        footerView.layer.borderColor = [[UIColor colorWithWhite:0.8 alpha:1.0]CGColor];
        footerView.layer.borderWidth = 0.2;
        [self addSubview:footerView];
        self.footerView = footerView;
        
        //用户头像
        UIImageView *profileImageView = [[UIImageView alloc] init];
        profileImageView.contentMode = UIViewContentModeScaleAspectFill;
        profileImageView.clipsToBounds = YES;
        profileImageView.layer.masksToBounds = YES;
        profileImageView.layer.borderColor = [[UIColor colorWithWhite:0.8 alpha:1.0]CGColor];
        profileImageView.layer.borderWidth = 0.2;
        [self addSubview:profileImageView];
        self.profileImageView = profileImageView;
        
        //用户网名
        UILabel *nicename = [[UILabel alloc] init];
        nicename.numberOfLines = 1;
        nicename.backgroundColor = [UIColor clearColor];
        nicename.font = [UIFont  fontWithName:@"HelveticaNeue" size:10.0];
        nicename.textColor = [UIColor blackColor];
        [self addSubview:nicename];
        self.nicename = nicename;

        //用户第一语言－－点
        UILabel *first = [[UILabel alloc] init];
        first.numberOfLines = 1;
        first.backgroundColor = [UIColor clearColor];
        //  textView.textAlignment = NSTextAlignmentCenter;
        first.font = [UIFont  fontWithName:@"HelveticaNeue" size:20.0];
        first.textColor = [UIColor blackColor];
        [self addSubview:first];
        self.first = first;
        
        //用户第一语言
        UILabel *firstLanguage = [[UILabel alloc] init];
        firstLanguage.numberOfLines = 1;
        firstLanguage.backgroundColor = [UIColor clearColor];
        firstLanguage.font = [UIFont  fontWithName:@"HelveticaNeue" size:9.0];
        firstLanguage.textColor = [UIColor grayColor];
        [self addSubview:firstLanguage];
        self.firstLanguage = firstLanguage;
        
        //用户第二语言－－点
        UILabel *second = [[UILabel alloc] init];
        second.numberOfLines = 1;
        second.backgroundColor = [UIColor clearColor];
        //  textView.textAlignment = NSTextAlignmentCenter;
        second.font = [UIFont  fontWithName:@"HelveticaNeue" size:20.0];
        second.textColor = [UIColor grayColor];
        [self addSubview:second];
        self.second = second;
        
        //用户第二语言
        UILabel *secondLanguage = [[UILabel alloc] init];
        secondLanguage.numberOfLines = 1;
        secondLanguage.backgroundColor = [UIColor clearColor];
        secondLanguage.font = [UIFont  fontWithName:@"HelveticaNeue" size:9.0];
        secondLanguage.textColor = [UIColor grayColor];
        [self addSubview:secondLanguage];
        self.secondLanguage = secondLanguage;
        
        //距离
        UILabel *distance = [[UILabel alloc] init];
        distance.numberOfLines = 1;
        distance.backgroundColor = [UIColor clearColor];
        distance.font = [UIFont  fontWithName:@"HelveticaNeue" size:10.0];
        distance.textColor = [UIColor grayColor];
        [self addSubview:distance];
        self.distance = distance;
       
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 用户发表的图片Frame
    self.postImageView.frame = self.bounds;
    
     // 测试发表的说说Frame
    CGFloat textViewX = 0;
    CGFloat textViewY = self.bounds.size.height;
    CGFloat textViewW = self.bounds.size.width;
    CGFloat textViewH = 40;
    self.textView.frame = CGRectMake(textViewX, textViewY, textViewW, textViewH);
    
    // 下方工具条的Frame
    CGFloat footerViewX = 0;
    CGFloat footerViewY = textViewY + textViewH;
    CGFloat footerViewW = self.bounds.size.width;
    CGFloat footerViewH = 50;
    self.footerView.frame = CGRectMake(footerViewX, footerViewY, footerViewW, footerViewH);
    
    
    // 头像Frame
    CGFloat headerViewX = 6;
    CGFloat headerViewY = footerViewY + footerViewH / 6;
    CGFloat headerViewW = self.bounds.size.width / 5;
    CGFloat headerViewH = self.bounds.size.width / 5;
    self.profileImageView.frame = CGRectMake(headerViewX, headerViewY, headerViewW, headerViewH);
    self.profileImageView.layer.cornerRadius = headerViewW / 2;
    
    // 用户网名Frame
    CGFloat nameViewX = headerViewX * 1.5 + headerViewW;
    CGFloat nameViewY = footerViewY + headerViewH / 20;
    CGFloat nameViewW = 80;
    CGFloat nameViewH = 30;
    self.nicename.frame = CGRectMake(nameViewX, nameViewY, nameViewW, nameViewH);
    
    // 用户第一语言－－点Frame
    CGFloat firstViewX = nameViewX;
    CGFloat firstViewY = footerViewY + headerViewH / 2;
    CGFloat firstViewW = 10;
    CGFloat firstViewH = 30;
    self.first.frame = CGRectMake(firstViewX, firstViewY, firstViewW, firstViewH);
    
    // 用户第一语言Frame
    CGFloat firstLanguageViewX = nameViewX + footerViewW / 25;
    CGFloat firstLanguageViewY = footerViewY + headerViewH / 1.5;
    CGFloat firstLanguageViewW = 50;
    CGFloat firstLanguageViewH = 30;
    self.firstLanguage.frame = CGRectMake(firstLanguageViewX, firstLanguageViewY, firstLanguageViewW, firstLanguageViewH);
    
    // 用户第二语言－－点Frame
    CGFloat secondViewX = firstLanguageViewX + firstLanguageViewW * 3/4;
    CGFloat secondViewY = footerViewY + headerViewH / 2;
    CGFloat secondViewW = 10;
    CGFloat secondViewH = 30;
    self.second.frame = CGRectMake(secondViewX, secondViewY, secondViewW, secondViewH);
    
    // 用户第二语言Frame
    CGFloat secondLanguageViewX = secondViewX + footerViewW / 25;
    CGFloat secondLanguageViewY = footerViewY + headerViewH / 1.5;
    CGFloat secondLanguageViewW = 50;
    CGFloat secondLanguageViewH = 30;
    self.secondLanguage.frame = CGRectMake(secondLanguageViewX, secondLanguageViewY, secondLanguageViewW, secondLanguageViewH);

    // 距离Frame
    CGFloat distanceViewX = secondLanguageViewX + secondLanguageViewW;
    CGFloat distanceViewY = footerViewY + headerViewH / 2;
    CGFloat distanceViewW = 30;
    CGFloat distanceViewH = 30;
    self.distance.frame = CGRectMake(distanceViewX, distanceViewY, distanceViewW, distanceViewH);

}

@end
