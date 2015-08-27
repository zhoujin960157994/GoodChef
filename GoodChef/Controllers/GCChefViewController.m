//
//  ChefViewController.m
//  GoodChef
//
//  Created by Mac on 15-5-28.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCChefViewController.h"
//厨师的Xib
#import "GCChefTableViewCell.h"

//导入view
#import "GCChefView.h"
//导入chefModel模型
#import "ChefModel.h"

@interface GCChefViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,MBProgressHUDDelegate>

@property (nonatomic,strong) GCChefView *chef;
//数据源
@property (nonatomic,strong) NSMutableArray *data;

@property (nonatomic,strong) MBProgressHUD *hub;

/**
 *  图片 -mbprogress
 */
@property (nonatomic,strong) UIImageView *img;

@end

@implementation GCChefViewController
#pragma mark ========================一系列view启动方法==========================
#pragma mark 将要出现时隐藏 navigationbar
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    

  
    //初始化数据源
    
    _data = [[NSMutableArray alloc] init];
    
    self.chef = [[GCChefView alloc] initWithFrame:self.view.bounds];
    
    self.chef.tabView.delegate = self;
    self.chef.tabView.dataSource = self;
    
    self.chef.search.delegate = self;
    
    [self.view addSubview:self.chef];
    
    self.hub = [[MBProgressHUD alloc] initWithView:self.chef];
    
    [self.view addSubview:self.hub];
    self.hub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"anim"]];
    self.hub.mode = MBProgressHUDModeCustomView;
//
    self.hub.delegate = self;
    self.hub.labelText = @"正在加载中.....";
    [self.hub show:YES];

     [self.hub showWhileExecuting:@selector(GetChefInfoList) onTarget:self withObject:nil animated:YES];//一边加载一边执行里面的requestImage方法
    

//    [MBProgressHUD showHUDAddedTo:self.chef animated:YES];
//
//    //获取请求数据
//    [self GetChefInfoList];

    
    
  
}

#pragma mark ========================一系列初始化方法==========================

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark ========================一系列事件触发方法==========================


#pragma mark ========================一系列数据请求方法==========================

#pragma mark 厨师页面数据请求
-(void)GetChefInfoList
{
    

    
    NSDictionary *dict = @{@"areaId":@(0),@"chefName":@"",@"chefType":@(0),@"cityId":@(58),@"isMyChef":@(0),@"orderTime":@(0),@"page":@(1),@"userId":@(24758)};

    [HttpRequestTool postRequestWithURL:CHEFINDEX andParameter:dict whenSuccess:^(id responseObject) {
        
         NSDictionary *chefList = responseObject;
        
        for (NSDictionary *chefDict in chefList[@"ChefEntity"]) {
            ChefModel *chefModel = [[ChefModel alloc] init];
            
            [chefModel setValuesForKeysWithDictionary:chefDict];
            
            [self.data addObject:chefModel];
        }
        
        __weak GCChefViewController *temp = self;

            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.08 * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                
                [temp.hub hide:YES afterDelay:8];
                
//                [MBProgressHUD hideHUDForView:self.chef animated:YES];
                
            });

     

        [self.chef.tabView reloadData];
        
        
    } orFail:^(id error) {
        
    }];

}

#pragma mark ========================一系列代理实现方法==========================
#pragma mark searchBar delegate
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.chef.search setShowsCancelButton:NO animated:YES];



}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{






}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{

        [self.chef.search setShowsCancelButton:YES animated:YES];


}


#pragma mark tabView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.data.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    GCChefTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    ChefModel *cModel =  self.data[indexPath.row];
    
    cell.chef = cModel;
    
    return cell;
    
    


}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 200;

}

#pragma mark ========mbProgressHub
- (void)hudWasHidden:(MBProgressHUD *)hud
{
    [self.hub removeFromSuperview];
//    [self.hub release];
    self.hub = nil;


}
@end
