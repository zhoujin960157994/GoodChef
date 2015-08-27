//
//  GCCityViewController.m
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCCityViewController.h"
//self view
#import "GCCityView.h"
//city model
#import "GCCityEntity.h"

@interface GCCityViewController ()<UITableViewDataSource,UITableViewDelegate>
/**
 *  data
 */
@property (nonatomic,strong) NSMutableArray *data;

@property (nonatomic,strong) NSMutableArray *requestArr;
/**
 *  self view
 */
@property (nonatomic,strong) GCCityView *city;
/**
 *  本地城市
 */
@property (nonatomic,strong) NSMutableArray *localcity;
@end

@implementation GCCityViewController
#pragma mark ========================一系列初始化方法==========================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //第一组数据位本地定位--首先在着写死
    self.localcity = [NSMutableArray arrayWithObjects:@"深圳市", nil];
    
    _data = [[NSMutableArray alloc] initWithObjects:self.localcity, nil];
    //
    _requestArr = [[NSMutableArray alloc] init];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.navigationItem.title = @"城市选择";
    
   
    
    [self getcityInfoList];
    

    

}
#pragma mark ========================一系列Ui创建方法==========================

- (void)createMainUI
{
    
    self.city = [[GCCityView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT- 64)];
    
    self.city.tabView.delegate = self;
    
    self.city.tabView.dataSource = self;
    
    [self.view addSubview:self.city];
    
    
}

#pragma mark ========================一系列事件触发方法==========================


#pragma mark ========================一系列数据请求==========================
#pragma mark -获取城市信息
- (void)getcityInfoList
{
    
    
    
    
    
    
    
    
    
    NSDictionary *dict = @{@"appVersion":@(3.0),@"cityId":@(1),@"deviceIdenitifer":@"4220F08CB2BD817EE426D4648C910754",@"deviceName":@"ZJPHONE",@"phoneModel":@"iPhone",@"phoneType":@(1),@"screenSize":@(2),@"systemVersion":@(8.1),@"userId":@(24758)};
    [HttpRequestTool postRequestWithURL:BASEQUEST andParameter:dict whenSuccess:^(id responseObject) {
       
        NSDictionary *dict = responseObject;
        for (NSDictionary *cityDict in dict[@"CityEntity"]) {
            
            GCCityEntity *cityModel = [[GCCityEntity alloc] init];
            
            [cityModel setValuesForKeysWithDictionary:cityDict];
            
            [self.requestArr addObject:cityModel];
        }
        
        
  
        [self.data addObject:self.requestArr];
        
         [self createMainUI];
        
              [self.city.tabView reloadData];
        
    } orFail:^(id error) {
        
    }];



}


#pragma mark ========================一系列代理实现方法==========================

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//     NSLog(@"%d",self.data.count);
    return self.data.count;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data[section] count];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *identifier = @"identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.textLabel.text = self.data[indexPath.section][indexPath.row];
        UIImageView *local = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        local.image = [UIImage imageNamed:@"city_locationicon"];
        cell.accessoryView = local;

    }else{
        /**
         *  城市选中对应
         */
        GCCityEntity *cityModel = self.data[indexPath.section][indexPath.row];
//        NSLog(@"%@",[[self.localcity firstObject] substringToIndex:2]);
        if ([[cityModel.cityName substringToIndex:2] isEqualToString:self.cityName]) {
            UIImageView *local = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
            local.image = [UIImage imageNamed:@"city_selected"];
            cell.accessoryView = local;
        }
        cell.textLabel.text = cityModel.cityName;
    }
    
    return cell;
    


}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

    if (section == 0) {
        return @"当前定位城市";
        
    }else if (1==section){
        return @"其他开通城市";
    }else{
    
        return @"";
    }
    


}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 30;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
     GCCityEntity *cityModel = self.data[indexPath.section][indexPath.row];
    
    self.sendValue(cityModel.cityName);
    

    
    

}

@end
