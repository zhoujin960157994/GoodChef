//
//  GCMyChefViewController.m
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCMyChefViewController.h"
//self view
#import "GCMyChefView.h"



@interface GCMyChefViewController ()<UITableViewDataSource,UITableViewDelegate>
/**
 *  chef view
 */
@property (nonatomic,strong) GCMyChefView *chef;
/**
 *  tabView data
 */
@property (nonatomic,strong) NSMutableArray *data;

@end

@implementation GCMyChefViewController
#pragma mark ===============================一系列初始化方法===============
- (void)viewWillAppear:(BOOL)animated
{
    [[AppDelegate shareapp].tab setTabBarHidden:YES animated:YES];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //
    self.navigationItem.title = @"我的厨师";
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
   BOOL ishave = [self getMyFavorChef];
    
    NSLog(@"%d",ishave);
    
    [self createUI:ishave];
    
    
    
    

}


#pragma mark ===============================一系列创建UI方法===============
-(void)createUI:(BOOL)ishave
{
    
    self.chef = [[GCMyChefView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT- 64) andHaveInfo:ishave];
    
    self.chef.tabView.delegate = self;
    self.chef.tabView.dataSource = self;
    
    [self.view addSubview:self.chef];
    

    
    


}


#pragma mark ===============================一系列事件触发方法===============



#pragma mark ===============================一系列数据请求方法===============

#pragma mark 获取信息
- (BOOL)getMyFavorChef
{
    
    __block BOOL isOk = NO;

    
    NSDictionary *dict = @{@"areaId":@(0),@"chefName":@"",@"chefType":@(0),@"areaId":@"",@"cityId":@(1),@"isMyChef":@(1),@"orderTime":@(1),@"page":@(1),@"userId":@(24758)};
    [HttpRequestTool postRequestWithURL:MYCHEF andParameter:dict whenSuccess:^(id responseObject) {
        
        NSDictionary *dict = responseObject;
        if (dict) {
            isOk = YES;
        }
        
        
        
    } orFail:^(id error) {
        
        NSLog(@"我的厨师没有数据!");
        
    }];
    
    return isOk;
    



}


#pragma mark ===============================一系列代理实现方法===============

@end
