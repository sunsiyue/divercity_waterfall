//
//  ViewController.m
//  Demo
//
//  Created by Nelson on 12/11/27.
//  Copyright (c) 2012年 Nelson. All rights reserved.
//

#import "ViewController.h"
#import "CHTCollectionViewWaterfallCell.h"
#import "CHTCollectionViewWaterfallHeader.h"
#import "CHTCollectionViewWaterfallFooter.h"
#import "AFHTTPRequestOperationManager.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ImgZoomView.h"

#define CELL_COUNT 20
#define CELL_IDENTIFIER @"WaterfallCell"
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *cellSizes;
@end

@implementation ViewController

#pragma mark - Accessors

- (UICollectionView *)collectionView {
  if (!_collectionView) {
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];

    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.headerHeight = 45;
    layout.footerHeight = 10;
    layout.minimumColumnSpacing = 20;
    layout.minimumInteritemSpacing = 80;

    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor colorWithWhite:0.93 alpha:0.9];
    [_collectionView registerClass:[CHTCollectionViewWaterfallCell class]
        forCellWithReuseIdentifier:CELL_IDENTIFIER];
    [_collectionView registerClass:[CHTCollectionViewWaterfallHeader class]
        forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
               withReuseIdentifier:HEADER_IDENTIFIER];
    [_collectionView registerClass:[CHTCollectionViewWaterfallFooter class]
        forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
               withReuseIdentifier:FOOTER_IDENTIFIER];
  }

  return _collectionView;
}

- (NSMutableArray *)cellSizes {
  if (!_cellSizes) {
    _cellSizes = [NSMutableArray array];
    for (NSInteger i = 0; i < CELL_COUNT; i++) {
      CGSize size = CGSizeMake(arc4random() % 50 + 50, arc4random() % 50 + 50);
      _cellSizes[i] = [NSValue valueWithCGSize:size];
      
    }
  }
  return _cellSizes;
}

#pragma mark - Life Cycle

- (void)dealloc {
  _collectionView.delegate = nil;
  _collectionView.dataSource = nil;
}

- (void)viewDidLoad {
  [self requireJSON];
    
  [super viewDidLoad];

  [self.view addSubview:self.collectionView];
    
  NSLog(@"array is: %lu",(unsigned long)Photo_array.count);
  
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  [self updateLayoutForOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
  [self updateLayoutForOrientation:toInterfaceOrientation];
}

- (void)updateLayoutForOrientation:(UIInterfaceOrientation)orientation {
  CHTCollectionViewWaterfallLayout *layout =
  (CHTCollectionViewWaterfallLayout *)self.collectionView.collectionViewLayout;
  layout.columnCount = UIInterfaceOrientationIsPortrait(orientation) ? 2 : 3;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return CELL_COUNT;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

  CHTCollectionViewWaterfallCell *cell =
  (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER
                                                                              forIndexPath:indexPath];
 // cell.displayString = [NSString stringWithFormat:@"%ld", (long)indexPath.item];

    double delayInSeconds = 0.5;
    dispatch_time_t delayInNanoSeconds = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(delayInNanoSeconds, concurrentQueue, ^(void)
                   {
                       /* Perform your operations here */
                       if (indexPath.item < [Photo_array count]) {
                           [cell.Photo sd_setImageWithURL:[NSURL URLWithString:Photo_array[indexPath.item]]];
                           [cell.contentView addSubview:cell.Photo];
                           
                          // cell.divercity.text = Text_array[indexPath.item];
                           cell.divercity.text = @"Locking for language partners Divercity";
                           [cell.contentView addSubview:cell.divercity];
                           
                           [cell.contentView addSubview:cell.FooterView];
                           
                           [cell.Header sd_setImageWithURL:[NSURL URLWithString:Header_array[indexPath.item]]];
                           [cell.contentView addSubview:cell.Header];
                           
                           cell.UserName.text = Name_array[indexPath.item];
                           [cell.contentView addSubview:cell.UserName];
                           
                           cell.First.text = @".";
                           [cell.contentView addSubview:cell.First];
                       }
                   });




  return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
  UICollectionReusableView *reusableView = nil;

  if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
    reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                      withReuseIdentifier:HEADER_IDENTIFIER
                                                             forIndexPath:indexPath];
      
  } else if ([kind isEqualToString:CHTCollectionElementKindSectionFooter]) {
    reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                      withReuseIdentifier:FOOTER_IDENTIFIER
                                                             forIndexPath:indexPath];
  }

  return reusableView;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CHTCollectionViewWaterfallCell* cell = (CHTCollectionViewWaterfallCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.Photo.hidden = YES;
    
    ImgZoomView* zoomV = [[ImgZoomView alloc] initWithFirstFrame:(CGRectMake(cell.frame.origin.x, cell.frame.origin.y-content_y, cell.frame.size.width, cell.frame.size.height))];
    //zoomV.currImg = [UIImage imageNamed:@"Default.png"];
    zoomV.currImg = [self getImageFromURL:Photo_array[indexPath.item]];
    [zoomV show];
    zoomV.BlockClose = ^(BOOL done){
        
        cell.Photo.hidden = NO;
    };
    
    
}
//加载网络图片
-(UIImage *) getImageFromURL:(NSString *)fileURL {
    NSLog(@"执行图片下载函数");
    UIImage * result;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    return result;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    content_y = scrollView.contentOffset.y;
    
}
#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellSizes[indexPath.item] CGSizeValue];
}
#pragma mark - 网络请求
-(void)requireJSON {
    Photo_array = nil;
    Photo_array = [[NSMutableArray alloc]init];
    
    Header_array = nil;
    Header_array = [[NSMutableArray alloc]init];
    
    Name_array = nil;
    Name_array = [[NSMutableArray alloc]init];
    
    
    //set up network
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"application/json",@"text/javascript", nil];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    
    
    NSString *url = [NSString stringWithFormat:@"http://api.imdivercity.com/Divercity/api/waterFall?gps=68,34"];
    
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //show return object
        if ([responseObject[@"code"] intValue] == 0) {
            for (int i = 0 ; i < [responseObject[@"content"] count]; i ++) {
                
                [Photo_array addObject:responseObject[@"content"][i][@"postImage"]];
                [Header_array addObject:responseObject[@"content"][i][@"profileImage"]];
                [Name_array addObject:responseObject[@"content"][i][@"nickname"]];
                [Text_array addObject:responseObject[@"content"][i][@"text"]];
                
           
            }
           // NSLog(@"text is: %@",Text_array);
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];

}

@end
