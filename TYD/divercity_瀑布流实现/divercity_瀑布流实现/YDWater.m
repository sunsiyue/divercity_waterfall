//
//  YDWater.m
//  divercity_瀑布流实现
//
//  Created by 唐亚狄 on 15-7-19.
//  Copyright (c) 2015年 TYD. All rights reserved.
//

#import "YDWater.h"

@implementation YDWater
+ (instancetype)waterWithDict:(NSDictionary *)dict
{
    YDWater *water = [[self alloc] init];
    water.profileImage = dict[@"profileImage"];
    water.postImage = dict[@"postImage"];
    water.nickname = dict[@"nickname"];
    water.text = dict[@"text"];
//    water.distanceD = @distanceD;
    
    return water;
}
@end
