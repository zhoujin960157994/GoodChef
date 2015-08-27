//
//  GCMoreViewController.m
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCMoreViewController.h"
//self.view
#import "GCMoreView.h"
//关于我们
#import "GCGoodChefViewController.h"
//意见反馈
#import "GCFeedbackViewController.h"
/**
 *  我的地址
 */
#import "GCAddressViewController.h"

@interface GCMoreViewController ()<UITableViewDataSource,UITableViewDelegate>

/**
 *  数据源
 */
@property (nonatomic,strong) NSMutableArray *data;
/**
 *  创建GCmoreView
 */
@property (nonatomic,strong) GCMoreView *more;


@end

@implementation GCMoreViewController

#pragma mark=====================================一系列初始化方法======================

- (void)viewWillAppear:(BOOL)animated
{

    [[AppDelegate shareapp].tab setTabBarHidden:YES animated:NO];


}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"更多";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //创建*UI
    [self createmainUI];
    
    

}

- (NSMutableArray *)data
{

    if (_data == nil) {
        
        NSDictionary *dict = @{@"我的地址":@(0),@"关于我们":@(1),@"意见反馈":@(2)};
        
        _data = [NSMutableArray arrayWithObjects:dict, nil];
    }
    
    return _data;


}

#pragma mark=====================================一系列UI创建方法======================
- (void)createmainUI
{
    
    self.more = [[GCMoreView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT- (49+64))];
    
    self.more.tabView.delegate = self;
    
    self.more.tabView.dataSource = self;
    
    [self.view addSubview:self.more];


}

#pragma mark=====================================一系列事件触发方法======================

#pragma mark 退出登录
- (void)closeBtnClicked:(UIButton *)sender
{
    //退出登录操作


}

#pragma mark=====================================一系列代理实现方法======================

#pragma mark = tableviewdelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return self.data.count;


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
 
    return [self.data[section] count];


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *identifier = @"identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.textLabel.text = [self.data[indexPath.section] allKeys][indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 45;

}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    

    if (0 == section) {
        
        UIButton *loginOut = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [loginOut setTitle:@"注销" forState:UIControlStateNormal ];
        [loginOut setBackgroundImage:[UIImage imageNamed:@"advertisingbg"] forState:UIControlStateNormal];

        [loginOut addTarget:self action:@selector(closeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [loginOut setFrame:CGRectMake(60, 10, 200, 40)];

        CGRect resultFrame = CGRectMake(0.0f, 0.0f,loginOut.frame.size.height,loginOut.frame.size.width + 10.0f);
        UIView *footerView = [[UIView alloc] initWithFrame:resultFrame];
        [footerView addSubview:loginOut];
        return footerView;
        
    }else{
    
    
        return nil;
    
    }


}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{


    return 100;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {
        GCGoodChefViewController *goodchef = [[GCGoodChefViewController alloc] init];
        [self.navigationController pushViewController:goodchef animated:YES];
        
    }else if (indexPath.row == 1){
        GCFeedbackViewController *feedback = [[GCFeedbackViewController alloc] init];
        [self.navigationController pushViewController:feedback animated:YES];
    }else{
        GCAddressViewController *address = [[GCAddressViewController alloc] init];
        [self.navigationController pushViewController:address animated:YES];
    }

}


@end
