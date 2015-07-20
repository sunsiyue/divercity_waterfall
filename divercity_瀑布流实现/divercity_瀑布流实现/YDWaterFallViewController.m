//
//  YDWaterFallViewController.m
//  divercity_瀑布流实现
//
//  Created by 唐亚狄 on 15-7-19.
//  Copyright (c) 2015年 TYD. All rights reserved.
//

#import "YDWaterFallViewController.h"
#import "YDWaterViewCell.h"
#import "HMWaterflowView.h"
#import "YDWater.h"
//#import "MJExtension.h"
#import "MJRefresh.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
//#import "UIView+MJExtension.h"

@interface YDWaterFallViewController () <HMWaterflowViewDataSource, HMWaterflowViewDelegate>
@property (nonatomic, strong) NSMutableArray *waters;
@property (nonatomic, weak) HMWaterflowView *waterflowView;
@property(nonatomic, weak) UIImageView *postImageView;

@end

@implementation YDWaterFallViewController
/**
 *  懒加载
 *
 */
- (NSMutableArray *)waters
{
    if (_waters == nil) {
        self.waters = [NSMutableArray array];
        
    }
    return _waters;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadNewWaters];
    
   
    // 1.瀑布流控件
    HMWaterflowView *waterflowView = [[HMWaterflowView alloc] init];
    waterflowView.backgroundColor = [UIColor redColor];
    // 跟随着父控件的尺寸而自动伸缩
    waterflowView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    waterflowView.frame = self.view.bounds;
    waterflowView.dataSource = self;
    waterflowView.delegate = self;
    [self.view addSubview:waterflowView];
    self.waterflowView = waterflowView;
    
    [waterflowView addHeaderWithTarget:self action:@selector(loadNewWaters)];
    [self.waterflowView headerBeginRefreshing];
    [waterflowView addFooterWithTarget:self action:@selector(loadMoreWaters)];
    
}
/**
 *  加载最新的用户数据
 */
- (void)loadNewWaters
{
    
    AFHTTPRequestOperationManager *mgr = [[AFHTTPRequestOperationManager alloc] init];
   
    // 拼接参数
//    YDWater *waterData = [[YDWater alloc] init];
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"application/json",@"text/javascript", nil];
//    // 取出最前面的微博
//    YDStatuseFrame *firstStatues = [self.statusesFrame firstObject];
//    if (firstStatues) {
//        // 若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0
//        parame[@"since_id"] = firstStatues.statuse.idstr;
//        
//    }
    // 发送请求
    [mgr POST:@"http://api.imdivercity.com/Divercity/api/waterFall?gps=68,34" parameters:parame success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",responseObject[@"content"]);
//       NSArray *newWaters = [YDWater objectArrayWithKeyValuesArray:responseObject[@"content"]];
//
       
        NSArray *newWaters = responseObject[@"content"];
        // 将dictArray里面的所有字典转成模型对象，放到新数组中
//        NSMutableArray *appArray = [NSMutableArray array];
        // 遍历数组中的字典
        for (NSDictionary *dict in newWaters) {
            //创建模型对象
            YDWater *water = [YDWater waterWithDict:dict];
            
            // 添加模型对象到数组中
            [self.waters addObject:water];
        }

//        [self.waters addObjectsFromArray:newWaters];
//        self.waters = (NSMutableArray *)[YDWater objectArrayWithKeyValuesArray:responseObject[@"content"]];
        NSLog(@"%@",self.waters);
        // 刷新瀑布流控件
        [self.waterflowView reloadData];
        
        // 停止刷新
        [self.waterflowView headerEndRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
//    [mgr po:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:parame success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
//        
//        //        NSLog(@"----%@",responseObject[@"statuses"]);
//        
//        // 将微博字典转换为微博数组
//        NSArray *newStatus = [YDStatuses objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
//        
//        // 将 YDStatus数组 转为 YDStatusFrame数组
//        NSArray *newFrames = [self stausFramesWithStatuses:newStatus];
//        
//        
//        // 将最新的数组插到最前面
//        NSRange rang = NSMakeRange(0, newFrames.count);
//        NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:rang];
//        [self.statusesFrame insertObjects:newFrames atIndexes:set];
//        
//        [self.tableView reloadData];
//        //        YDLog(@"请求成功%@",responseObject[@"statuses"]);
//        // 结束刷新
//        [refreshVC endRefreshing];
//        
//        // 显示最新微博数量
//        [self showNewStatusCount:newStatus.count];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        YDLog(@"请求失败--%@",error);
//        // 结束刷新
//        [refreshVC endRefreshing];
//    }];

}
/**
 *  加载更多的用户数据
 */
- (void)loadMoreWaters
{
    
    
   
}
#pragma mark - 数据源方法
- (NSUInteger)numberOfCellsInWaterflowView:(HMWaterflowView *)waterflowView
{
    return self.waters.count;
}

- (HMWaterflowViewCell *)waterflowView:(HMWaterflowView *)waterflowView cellAtIndex:(NSUInteger)index
{
    YDWaterViewCell *cell = [YDWaterViewCell cellWithWaterflowView:waterflowView];
    
    YDWater *water = self.waters[index];
    cell.water = self.waters[index];
    
    [cell.postImageView sd_setImageWithURL:[NSURL URLWithString:water.postImage]];
    self.postImageView.frame = cell.postImageView.frame;
//    NSLog(@"%@", NSStringFromCGSize(self.postImageView.frame.size));
    return cell;
}

- (NSUInteger)numberOfColumnsInWaterflowView:(HMWaterflowView *)waterflowView
{
    return 2;
}


#pragma mark - 代理方法
- (CGFloat)waterflowView:(HMWaterflowView *)waterflowView heightAtIndex:(NSUInteger)index
{
    
    
    YDWaterViewCell *cell = [YDWaterViewCell cellWithWaterflowView:waterflowView];
    
    YDWater *water = self.waters[index];
    
        [cell.postImageView sd_setImageWithURL:[NSURL URLWithString:water.postImage]];
    [self.postImageView addSubview:cell.postImageView];
//    CGFloat WH =cell.postImageView.frame.size.height / 50;
//     根据cell的宽度 和 图片的宽高比 算出 cell的高度
    
//    return waterflowView.cellWidth * water.h / water.w;
    
    return waterflowView.cellWidth;
   
    
   
}
//- (CGFloat)waterflowView:(HMWaterflowView *)waterflowView marginForType:(HMWaterflowViewMarginType)type;
//{
//    switch (type) {
//        case HMWaterflowViewMarginTypeTop: return 30;
//        case HMWaterflowViewMarginTypeBottom: return 50;
//        case HMWaterflowViewMarginTypeLeft: return 10;
//        case HMWaterflowViewMarginTypeRight: return 10;
//        case HMWaterflowViewMarginTypeColumn: return 10;
//        default:
//            return 5;
//    }
//
//}
@end
