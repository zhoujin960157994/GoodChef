//
//  GCVipViewController.m
//  GoodChef
//
//  Created by Mac on 15-5-31.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCVipViewController.h"
//导入XIb的头文件
#import "GCVipTableViewCell.h"
//导入自身的View
#import "GCVipView.h"

@interface GCVipViewController ()<UITableViewDataSource,UITableViewDelegate>

/**
 *  数据源
 */
@property (nonatomic,strong) NSMutableArray *data;

@property (nonatomic,strong) GCVipView *vip;

@end

@implementation GCVipViewController

#pragma mark ============================一系列初始化方法====================

- (void)viewWillAppear:(BOOL)animated
{
    
    [[AppDelegate shareapp].tab setTabBarHidden:YES animated:YES];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    self.navigationItem.title = @"成为会员";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.vip = [[GCVipView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT-64)];
    
    self.vip.tabView.delegate = self;
    
    self.vip.tabView.dataSource = self;
    
    [self.view addSubview:self.vip];
    

}
/**
 *  初始化数据
 *
 *  @return _data
 */
-(NSMutableArray *)data
{

    if (_data == nil) {
        
        _data = [NSMutableArray arrayWithObjects:@"card_1",@"card_2",@"card_3",@"card_4", nil];
    }
    return _data;

}


#pragma mark ============================一系列数据请求方法====================

#pragma mark ============================一系列事件响应方法====================


#pragma mark ============================一系列代理实现方法====================
#pragma tableViewdelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.data.count;


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    
    GCVipTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.VipType.image = [UIImage imageNamed:self.data[indexPath.row]];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 160;
    

}


@end
