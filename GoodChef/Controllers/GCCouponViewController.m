//
//  GCCouponViewController.m
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCCouponViewController.h"
//优惠券
#import "GCCouponView.h"

@interface GCCouponViewController ()<UITableViewDelegate,UITableViewDataSource>

/**
 *  coupon 的view
 */
@property (nonatomic,strong) GCCouponView *coupon;
/**
 *  tableview data
 */
@property (nonatomic,strong) NSMutableArray *data;

@end

@implementation GCCouponViewController
#pragma mark ========================================一系列初始化方法============================
- (void)viewWillAppear:(BOOL)animated
{
    [[AppDelegate shareapp].tab setTabBarHidden:YES animated:YES];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //
    self.navigationItem.title = @"我的优惠券";
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    BOOL ishave = [self getMyFavorChef];
    
    
    [self createUI:ishave];
    
    
    
    
    
}


#pragma mark ===============================一系列创建UI方法===============
-(void)createUI:(BOOL)ishave
{
    
    self.coupon = [[GCCouponView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT- 64) andHaveInfo:ishave];
    
    self.coupon.tabView.delegate = self;
    self.coupon.tabView.dataSource = self;
    
    [self.view addSubview:self.coupon];
    
    
    
    
    
    
}


#pragma mark ===============================一系列事件触发方法===============



#pragma mark ===============================一系列数据请求方法===============

#pragma mark 获取信息
- (BOOL)getMyFavorChef
{
    
    __block BOOL isOk = NO;
    
    
    NSDictionary *dict = @{@"userId":@(24758)};
    [HttpRequestTool postRequestWithURL:MYCOUPONL andParameter:dict whenSuccess:^(id responseObject) {
        
        NSDictionary *dict = responseObject;
        if (dict) {
            isOk = YES;
        }
        
        
        
    } orFail:^(id error) {
        
        NSLog(@"你的现金券没有数据!");
        
    }];
    
    return isOk;
    
    
    
    
}


#pragma mark ===============================一系列代理实现方法===============
#pragma mark tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *identifier = @"identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    return cell;


}

@end
