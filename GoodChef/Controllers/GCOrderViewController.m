//
//  GCOrderViewController.m
//  GoodChef
//
//  Created by Mac on 15-5-28.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCOrderViewController.h"
//gcview
#import "GCOrderView.h"
//tableview cell xib
#import "GCOrderTableViewCell.h"
//请求数据
#import "HttpRequestTool.h"
//数据接口
#import "Interface.h"
//订单实体模型模型
#import "GCOrderEntityModel.h"
//订单详细
#import "GCOrderDetailViewController.h"

@interface GCOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
//数据源
@property (nonatomic,strong) NSMutableArray *data;

//tableview
@property (nonatomic,strong) GCOrderView *order;


@end

@implementation GCOrderViewController
#pragma mark ==========================一系列生命周期方法==========================

-(void)viewWillAppear:(BOOL)animated
{

    [[AppDelegate shareapp].tab setTabBarHidden:NO animated:YES];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  导航返回按钮
     */
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.title = @"我的订单";
    
    [self createTableView];
    
    _data = [[NSMutableArray alloc] init];
    
    //order 亲求数据方法调用
    [self requestData];

}
#pragma mark ==========================一系列初始化方法===========================

- (instancetype)init
{
    
    if (self = [super init]) {
        
    }
    
    return self;




}
//#pragma mark 懒加载
//- (NSMutableArray *)data
//{
//    if (_data == nil) {
//        
//        
//        
//    }
//    
//    return _data;
//    
//
//
//
//}

#pragma mark 创建tableview
- (void)createTableView
{

    _order = [[GCOrderView alloc] initWithFrame:self.view.bounds];
    
    
    _order.tabView.delegate = self;
    
    _order.tabView.dataSource = self;
    
    
    self.view = _order;
}

#pragma mark ==========================一系列点击触发方法===========================

- (void)jump:(GCOrderEntityModel *)model
{

    //创建
    GCOrderDetailViewController *detail = [[GCOrderDetailViewController alloc] init];
    //传值
    detail.orderModel = model;
    
    [[AppDelegate shareapp].tab setTabBarHidden:YES animated:YES];
    
    [self.navigationController pushViewController:detail animated:YES];


}



#pragma mark ==========================一系列点击请求方法===========================
#pragma mark 亲求数据
- (void)requestData
{
    //参数
    //page	1
    //userId	24758
    NSDictionary *dict = @{@"page":@(1),@"userId":@(24758)};
    
    [HttpRequestTool postRequestWithURL:USERORDERLIST andParameter:dict whenSuccess:^(id responseObject) {
        
      
        for (NSDictionary *order in responseObject[@"OrderEntity"]) {
            
            GCOrderEntityModel *orderEntityModel = [[GCOrderEntityModel alloc]init];
            // 使用KVC 赋值
            [orderEntityModel setValuesForKeysWithDictionary:order];
            
            [self.data addObject:orderEntityModel];

            
        }

         [_order.tabView reloadData];


    } orFail:^(id error) {
        NSLog(@"错误-%@",error);
    }];


}

#pragma mark ==========================一系列代理实现方法===========================
#pragma mark table delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return self.data.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"cellid";
    GCOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
 
    
    GCOrderEntityModel *orderMOdel = self.data[indexPath.row];
    
    __weak GCOrderViewController *temp = self;
    cell.MyBlock = ^(GCOrderEntityModel *model){
        
        [temp jump:(orderMOdel)];
        
    };
    __weak GCOrderTableViewCell *weakCell = cell;
    cell.sendblock = ^(id sender){
        
        [weakCell CreateOrderStatus:orderMOdel andframe:weakCell.frame];
    
    };

    [cell refreshData:orderMOdel];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = [UIColor clearColor];
    

    return cell;
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
    
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 200;
    
    
}
#pragma mark 触发-cell 详细信息
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建
    GCOrderDetailViewController *detail = [[GCOrderDetailViewController alloc] init];
    //传值
    detail.orderModel = self.data[indexPath.row];
    
    [[AppDelegate shareapp].tab setTabBarHidden:YES animated:YES];
    
    [self.navigationController pushViewController:detail animated:YES];
    

    
}


@end
