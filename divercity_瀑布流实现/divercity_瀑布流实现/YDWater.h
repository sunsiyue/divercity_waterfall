//
//  YDWater.h
//  divercity_瀑布流实现
//
//  Created by 唐亚狄 on 15-7-19.
//  Copyright (c) 2015年 TYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDWater : NSObject
/*distance = "45.265465";
nickname = "Emma\U5c0f\U751f\U6d3b";
postImage = "http://api.imdivercity.com/photos/photo_1434468038925647.jpg";
profileImage = "http://api.imdivercity.com/photos/divercity6471434467798512.jpg";
text = "";
uid = 647;
voice = "";*/
/**
*  用户的图片地址
*/
@property (nonatomic, copy) NSString *postImage;
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

@property (nonatomic, assign) int w;
@property (nonatomic, assign) int h;

+ (instancetype)waterWithDict:(NSDictionary *)dict;

@end
