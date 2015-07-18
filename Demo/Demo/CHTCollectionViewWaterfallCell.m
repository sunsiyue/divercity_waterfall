//
//  UICollectionViewWaterfallCell.m
//  Demo
//
//  Created by Nelson on 12/11/27.
//  Copyright (c) 2012年 Nelson. All rights reserved.
//

#import "CHTCollectionViewWaterfallCell.h"


@implementation CHTCollectionViewWaterfallCell {

}

//#pragma mark - Accessors
//- (UILabel *)displayLabel {
//  if (!_displayLabel) {
//    _displayLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
//    _displayLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//    _displayLabel.backgroundColor = [UIColor lightGrayColor];
//    _displayLabel.textColor = [UIColor whiteColor];
//    _displayLabel.textAlignment = NSTextAlignmentCenter;
//   // [self.contentView addSubview:_displayLabel];
//      
//  }
//  return _displayLabel;
//}
//
//- (void)setDisplayString:(NSString *)displayString {
//  if (![_displayString isEqualToString:displayString]) {
//    _displayString = [displayString copy];
//    self.displayLabel.text = _displayString;
//  }
//}
//
//#pragma mark - Life Cycle
//- (void)dealloc {
//  [_displayLabel removeFromSuperview];
//  _displayLabel = nil;
//}

- (id)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    // Pick a cat at random.
//    NSUInteger pickACat = arc4random_uniform(4) + 1;     // Vary from 1 to 4.
//    NSString *catFilename = [NSString stringWithFormat:@"cat%lu.jpg", (unsigned long)pickACat];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:catFilename]];
    // Scale with fill for contents when we resize.
//    Photo.contentMode = UIViewContentModeScaleAspectFill;
//
//    // Scale the imageview to fit inside the contentView with the image centered:
//    CGRect imageViewFrame = CGRectMake(0.f, 0.f, CGRectGetMaxX(self.contentView.bounds), CGRectGetMaxY(self.contentView.bounds));
//    Photo.frame = imageViewFrame;
//    Photo.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    Photo.clipsToBounds = YES;
      //用户图片显示
      _Photo = [UIImageView new];
      _Photo.contentMode = UIViewContentModeScaleAspectFill;
      
      // Scale the imageview to fit inside the contentView with the image centered:
      CGRect photoViewFrame = CGRectMake(0.f, 0.f, CGRectGetMaxX(self.contentView.bounds), CGRectGetMaxY(self.contentView.bounds));
      _Photo.frame = photoViewFrame;
      _Photo.backgroundColor = [UIColor blackColor];
      _Photo.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
      _Photo.clipsToBounds = YES;
      _Photo.layer.cornerRadius = 2.0;
      _Photo.layer.masksToBounds = YES;
      _Photo.layer.borderColor = [[UIColor colorWithWhite:0.8 alpha:1.0]CGColor];
      _Photo.layer.borderWidth = 0.2;

      //divercitySlogon显示
      _divercity = [UILabel new];
      // Scale the imageview to fit inside the contentView with the image centered:
      _divercity.contentMode = UIViewContentModeScaleAspectFill;
      CGRect divercityviewFrame = CGRectMake(0.f, CGRectGetMaxY(self.contentView.bounds), CGRectGetMaxX(photoViewFrame), 30);
      _divercity.frame = divercityviewFrame;
      _divercity.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
      _divercity.font = [UIFont  fontWithName:@"HelveticaNeue" size:8.0];
      _divercity.numberOfLines = 2;
      _divercity.backgroundColor = [UIColor whiteColor];
      _divercity.textColor = [UIColor grayColor];
      //divercity.textAlignment = NSTextAlignmentCenter;
      _divercity.clipsToBounds = YES;
      _divercity.layer.cornerRadius = 3.0;
      _divercity.layer.masksToBounds = YES;
      _divercity.layer.borderColor = [[UIColor colorWithWhite:0.8 alpha:1.0]CGColor];
      _divercity.layer.borderWidth = 0.2;
      
      //FooterView显示
      _FooterView = [UIView new];
      CGRect FooterViewFrame = CGRectMake(0.f, CGRectGetHeight(self.contentView.bounds) + CGRectGetHeight(_divercity.bounds), CGRectGetMaxX(self.contentView.bounds), 40);
      _FooterView.frame = FooterViewFrame;
      _FooterView.backgroundColor = [UIColor whiteColor];
      _FooterView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
      _FooterView.clipsToBounds = YES;
      _FooterView.layer.cornerRadius = 3.0;
      _FooterView.layer.masksToBounds = YES;
      _FooterView.layer.borderColor = [[UIColor colorWithWhite:0.8 alpha:1.0]CGColor];
      _FooterView.layer.borderWidth = 0.2;
      
      //头像显示横坐标
      double Header_x = 6;
      
      //用户头像显示
      // NSLog(@"header is: %@",Header_array);
      _Header = [UIImageView new];
      _Header.contentMode = UIViewContentModeScaleAspectFill;
      // Scale the imageview to fit inside the contentView with the image centered:
      CGRect HeaderViewFrame = CGRectMake(Header_x, CGRectGetHeight(photoViewFrame)+CGRectGetHeight(divercityviewFrame) + CGRectGetHeight(FooterViewFrame)/5, CGRectGetWidth(divercityviewFrame)/5, CGRectGetWidth(divercityviewFrame)/5);
      _Header.frame = HeaderViewFrame;
      _Header.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
      _Header.clipsToBounds = YES;
      _Header.layer.cornerRadius = CGRectGetWidth(HeaderViewFrame)/2;
      _Header.layer.masksToBounds = YES;
      _Header.layer.borderColor = [[UIColor colorWithWhite:0.8 alpha:1.0]CGColor];
      _Header.layer.borderWidth = 0.2;
   
      
      //用户网名显示
      _UserName = [UILabel new];
      // Scale the imageview to fit inside the contentView with the image centered:
      CGRect NameviewFrame = CGRectMake(CGRectGetWidth(HeaderViewFrame) + Header_x * 2 , CGRectGetHeight(photoViewFrame)+CGRectGetHeight(divercityviewFrame)-Header_x, 50,30);
      _UserName.frame = NameviewFrame;
      _UserName.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
      //     UserName.backgroundColor = [UIColor whiteColor];
      _UserName.font = [UIFont  fontWithName:@"HelveticaNeue" size:8.0];
      _UserName.numberOfLines = 2;
      _UserName.textColor = [UIColor blackColor];
    
      //用户第一语言
      _First = [UILabel new];
      // Scale the imageview to fit inside the contentView with the image centered:
      CGRect FirstviewFrame = CGRectMake(CGRectGetWidth(HeaderViewFrame) + Header_x * 2 , CGRectGetHeight(photoViewFrame)+CGRectGetHeight(divercityviewFrame)+20, 20, 10);
      _First.frame = FirstviewFrame;
      _First.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
      //     UserName.backgroundColor = [UIColor whiteColor];
      _First.font = [UIFont  fontWithName:@"HelveticaNeue" size:20.0];
      _First.numberOfLines = 1;
      _First.textColor = [UIColor blackColor];
  }
  return self;
}

@end
