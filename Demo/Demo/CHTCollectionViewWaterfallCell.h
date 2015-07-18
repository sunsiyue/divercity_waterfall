//
//  UICollectionViewWaterfallCell.h
//  Demo
//
//  Created by Nelson on 12/11/27.
//  Copyright (c) 2012年 Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHTCollectionViewWaterfallCell : UICollectionViewCell {
//    UIImageView *Photo;
//    UILabel *divercity;
//    UIImageView *Header;
//    UILabel *UserName;
    
}
@property (nonatomic, copy) NSString *displayString;
@property (nonatomic) NSInteger index_i;
@property (nonatomic, strong) IBOutlet UILabel *displayLabel;

@property (nonatomic,strong) UIImageView *Photo;
@property (nonatomic,strong) UILabel *divercity;
@property (nonatomic,strong) UIView *FooterView;
@property (nonatomic,strong) UIImageView *Header;
@property (nonatomic,strong) UILabel *UserName;
@property (nonatomic,strong) UILabel *FirstLanguage;
@property (nonatomic,strong) UILabel *First;
@property (nonatomic,strong) UILabel *SecondLanguage;
@property (nonatomic,strong) UILabel *Second;
@end
