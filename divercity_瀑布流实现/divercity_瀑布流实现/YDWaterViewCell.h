//
//  YDWaterViewCell.h
//  divercity_瀑布流实现
//
//  Created by 唐亚狄 on 15-7-19.
//  Copyright (c) 2015年 TYD. All rights reserved.
//

#import "HMWaterflowViewCell.h"
@class HMWaterflowView, YDWater;
@interface YDWaterViewCell : HMWaterflowViewCell
+ (instancetype)cellWithWaterflowView:(HMWaterflowView *)waterflowView;
//@property (nonatomic, weak) UIImageView *postImageView;
@property (nonatomic, strong) YDWater *water;
@end
