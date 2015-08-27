//
//  GCAddressViewController.m
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCAddressViewController.h"
//地址
#import "GCAddressView.h"
//导入cell
#import "GCAddressTableViewCell.h"
//地址model
#import "GCAddressEntityModel.h"
//地址编辑
#import "GCAddressEditViewController.h"

@interface GCAddressViewController ()<UITableViewDataSource,UITableViewDelegate>

/**
 *  数据源
 */
@property (nonatomic,strong) NSMutableArray *data;
/**
 *  address view
 */
@property (nonatomic,strong) GCAddressView *adress;


@end

@implementation GCAddressViewController
#pragma mark ============================一系列初始化方法====================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _data = [[NSMutableArray alloc] init];
    
    self.navigationItem.title = @"我的地址";
    
    self.view.backgroundColor = [UIColor colorWithRed:ShallowGray green:ShallowGray blue:ShallowGray alpha:1];
    
    [self createMainUI];
    
    
    [self getUserAddressInfo];

}

#pragma mark ============================一系列创建UI方法====================

- (void)createMainUI
{


    self.adress = [[GCAddressView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT- 64)];
    
    self.adress.tabView.delegate = self;
    
    self.adress.tabView.dataSource = self;
    
    self.adress.tabView.separatorColor = [UIColor whiteColor];
    
    [self.view addSubview:self.adress];

}
#pragma mark =========================一系列触发事件方法=======================
#pragma mark 添加地址
- (void)addAddress:(UIButton *)sender
{
    //地址添加
    GCAddressEditViewController *addressEdit = [[GCAddressEditViewController alloc] init];
    [self.navigationController pushViewController:addressEdit animated:YES];
    
    

}

#pragma mark ============================一系列数据请求发送方法====================

- (void)getUserAddressInfo
{
    //参数:
    NSDictionary *dict = @{@"userId":@(24758)};
    [HttpRequestTool postRequestWithURL:MYADDRESS andParameter:dict whenSuccess:^(id responseObject) {
        //获取地址信息
        NSLog(@"%@",responseObject[@"AddressEntity"]);
        
        for (NSDictionary *addressDict in responseObject[@"AddressEntity"]) {
            GCAddressEntityModel *addressModel = [[GCAddressEntityModel alloc] init];
            
            [addressModel setValuesForKeysWithDictionary:addressDict];
            
            [self.data addObject:addressModel];
        }
        
        [self.adress.tabView reloadData];
        
        
        
    } orFail:^(id error) {
        
    }];



}


#pragma mark ============================一代理的实现方法====================

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *identifier = @"identifier";
    
    GCAddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    GCAddressEntityModel *address = self.data[indexPath.row];
    
    cell.addressModel = address;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
    


}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    return 100;

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    
    return 100;
    
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (0 == section) {
        
        UIButton *loginOut = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [loginOut setTitle:@"添加常用地址" forState:UIControlStateNormal ];
        [loginOut setBackgroundImage:[UIImage imageNamed:@"tab_bg"] forState:UIControlStateNormal];
        
        
        
        [loginOut addTarget:self action:@selector(addAddress:) forControlEvents:UIControlEventTouchUpInside];
        [loginOut setFrame:CGRectMake(10, 10, 300, 50)];
        
        
        UIImageView *imgAdd = [[UIImageView alloc] initWithFrame:CGRectMake(60, 15, 20, 20)];
        imgAdd.image = [UIImage imageNamed:@"address_addIng"];
        [loginOut addSubview:imgAdd];
        CGRect resultFrame = CGRectMake(0.0f, 0.0f,loginOut.frame.size.height,loginOut.frame.size.width + 10.0f);
        UIView *footerView = [[UIView alloc] initWithFrame:resultFrame];
        [footerView addSubview:loginOut];
        return footerView;
        
    }else{
        
        
        return nil;
        
    }


}
@end
