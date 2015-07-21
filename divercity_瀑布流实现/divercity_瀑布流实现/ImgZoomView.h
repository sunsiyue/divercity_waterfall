//
//  ImgZoomView.h
//  MyDemo
//
//  Created by Sen on 15/1/25.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgZoomView : UIView
<UIScrollViewDelegate>

@property (nonatomic, strong) UIImage* currImg;
@property (nonatomic, strong) void (^BlockClose)(BOOL done);

- (id)initWithFirstFrame:(CGRect)frame1;

- (void)show;

@end
