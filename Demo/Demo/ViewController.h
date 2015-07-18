//
//  ViewController.h
//  Demo
//
//  Created by Nelson on 12/11/27.
//  Copyright (c) 2012年 Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTCollectionViewWaterfallLayout.h"

@interface ViewController : UIViewController <UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout> {
    NSMutableArray *Photo_array;
    NSMutableArray *Header_array;
    NSMutableArray *Name_array;
    NSMutableArray *Text_array;
    
    CGFloat content_y;
}
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@end
