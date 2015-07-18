//
//  ImgZoomView.m
//  MyDemo
//
//  Created by Sen on 15/1/25.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "ImgZoomView.h"

@implementation ImgZoomView
{
    UIScrollView* rootScroller;
    
    UIImageView* zoomImgView;
    
    int count;
    
    CGRect first_fm;
    CGRect first_fm1;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - if

- (void)setCurrImg:(UIImage *)currImg{
    _currImg = currImg;
    
    zoomImgView.image = currImg;
    
    [self animationOfFrame];
}

#pragma mark - else

- (id)initWithFirstFrame:(CGRect)frame1
{
    self = [super init];
    if (self) {
        //
        first_fm = frame1;
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = [UIColor clearColor];//[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        
        rootScroller = [[UIScrollView alloc] initWithFrame:self.bounds];
        rootScroller.backgroundColor = [UIColor colorWithRed:0.031 green:0.031 blue:0.031 alpha:0];
        rootScroller.delegate = self;
        [rootScroller setShowsHorizontalScrollIndicator:NO];
        [rootScroller setShowsHorizontalScrollIndicator:NO];
        [rootScroller setMaximumZoomScale:2.0];
        [rootScroller setMinimumZoomScale:1.0];
        [self addSubview:rootScroller];
        
        first_fm1 =rootScroller.bounds;
        zoomImgView = [[UIImageView alloc] initWithFrame:first_fm];
        zoomImgView.userInteractionEnabled = YES;
        zoomImgView.contentMode = UIViewContentModeScaleAspectFill;
        zoomImgView.clipsToBounds = YES;
        zoomImgView.backgroundColor = [UIColor lightGrayColor];
        [rootScroller addSubview:zoomImgView];
        
    
        //双击
        UITapGestureRecognizer* bigTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bigtapAction:)];
        bigTap.numberOfTapsRequired = 2;
        bigTap.numberOfTouchesRequired = 1;
        [zoomImgView addGestureRecognizer:bigTap];
        
        //关闭
        UITapGestureRecognizer* backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionOfBack:)];
        backTap.numberOfTapsRequired = 1;
        backTap.numberOfTouchesRequired = 1;
        [backTap requireGestureRecognizerToFail:bigTap];
        [rootScroller addGestureRecognizer:backTap];
        
        
    }
    return self;
}

- (void)animationOfFrame{
    
    CGSize imgSize = _currImg.size;
    //NSLog(@"imgsize = %@",NSStringFromCGSize(imgSize));
    
    CGRect newRect;
    if (self.bounds.size.width*imgSize.height/imgSize.width>self.bounds.size.height) {
        //
        newRect = CGRectMake(
                             0,
                             0,
                             self.bounds.size.width,
                             self.bounds.size.width*imgSize.height/imgSize.width);
        rootScroller.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.width*imgSize.height/imgSize.width);
    }else{
        newRect = CGRectMake(
                             0,
                             (self.bounds.size.height-self.bounds.size.width*imgSize.height/imgSize.width)/2,
                             self.bounds.size.width,
                             self.bounds.size.width*imgSize.height/imgSize.width);
    }
    
    [UIView transitionWithView:self duration:0.35 options:UIViewAnimationOptionCurveEaseInOut animations:^{
       // rootScroller.frame = self.bounds;
        zoomImgView.frame = newRect;
        rootScroller.backgroundColor = [UIColor colorWithRed:0.031 green:0.031 blue:0.031 alpha:0.75];

    } completion:^(BOOL ok){

    }];
}

- (void)actionOfBack:(UITapGestureRecognizer*)sender{

    //zoomImgView.contentMode = UIViewContentModeTop;
    self.backgroundColor = [UIColor clearColor];
    [rootScroller setZoomScale:1.0 animated:YES];
    
    [UIView transitionWithView:self duration:0.35 options:UIViewAnimationOptionCurveEaseInOut animations:^{
       // [rootScroller setFrame:first_fm];
        [zoomImgView setFrame:first_fm];
        rootScroller.backgroundColor = [UIColor colorWithRed:0.031 green:0.031 blue:0.031 alpha:0];
    } completion:^(BOOL finished){
        if (finished) {
            [self removeFromSuperview];
        }
        if (self.BlockClose) {
            self.BlockClose(YES);
        }
    }];
    
}

- (void)show{
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    
}

//每个双击大图的手势
-(void)bigtapAction:(UITapGestureRecognizer*)Gesture{
    if (Gesture.state==UIGestureRecognizerStateEnded) {
        if (count==0) {
            [rootScroller setZoomScale:2.0 animated:YES];
            
            count=1;
        }else{
            [rootScroller setZoomScale:1.0 animated:YES];
            count=0;
            
        }
    }
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    
    if (zoomImgView) {
        return zoomImgView;
    }
    return nil;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
    if (zoomImgView) {
        CGFloat offsetX = (rootScroller.bounds.size.width > rootScroller.contentSize.width)?
        
        (rootScroller.bounds.size.width - rootScroller.contentSize.width) * 0.5 : 0.0;
        
        CGFloat offsetY = (rootScroller.bounds.size.height > rootScroller.contentSize.height)?
        
        (rootScroller.bounds.size.height - rootScroller.contentSize.height) * 0.5 : 0.0;
        
        zoomImgView.center = CGPointMake(rootScroller.contentSize.width * 0.5 + offsetX,
                                         
                                         rootScroller.contentSize.height * 0.5 + offsetY);
    }
}

@end
