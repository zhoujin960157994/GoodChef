//
//  RootViewController.m
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCRootViewController.h"

//root view
#import "GCRootView.h"
//接口
#import "Interface.h"
//webview 控制器
#import "GCWebViewController.h"
//首页基础数据模型
#import "GCBaseModel.h"
//城市模型
#import "GCCityEntity.h"
//预约厨师
#import "GCSubscribeViewController.h"
//VIp
#import "GCVipViewController.h"
//city选择
#import "GCCityViewController.h"


@interface GCRootViewController ()<UIScrollViewDelegate,UIPageViewControllerDelegate>
//当前值
@property (nonatomic,assign) NSInteger currentValue;
@end


@implementation GCRootViewController
{
    //视图
    GCRootView *root;

}
#pragma mark ===========================个生命周期方法===================================
//页面出现时候 tab 出现
- (void)viewWillAppear:(BOOL)animated
{
    [[AppDelegate shareapp].tab setTabBarHidden:NO];

}

#pragma mark =============================各UI创建方法================================
///
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.title = @"好厨师";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tellImg"] style:UIBarButtonItemStyleDone target:self action:@selector(tell:)];
    
    
    
 
    
    root = [[GCRootView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT)];
    
    root.scroll.delegate = self;
    //循环引用的问题，解决
    __weak GCRootViewController  *temp = self;
    
    root.tapGesture = ^(id t){
    
        [temp tapGestureTouch:t];
    };

    
    root.sendBlock = ^(id sender){
        
        [temp clickForButton:sender];
        
    };
    
       self.navigationItem.leftBarButtonItems = @[root.cityName];
    
    [self.view addSubview:root];
    
    //定时器，自动执行 滚动
    [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(autoChange:) userInfo:nil repeats:YES];
    
    //请求数据
    [self GetCityinfo];
    
  
    
}
#pragma mark ===================================各数据请求方法===============================
/**
 *  请求数据-- 城市信息数据
 *
 */
#pragma mark 获取城市信息
- (void)GetCityinfo
{
     NSDictionary *dictInfo = @{@"appVersion":@"3.0",@"cityId":@(1),@"deviceIdenitifer":@"4220F08CB2BD817EE426D4648C910754",@"deviceName":@"ZJPHONE",@"phoneModel":@"iPhone",@"phoneType":@(1),@"screenSize":@(2),@"systemVersion":@"8.1",@"userId":@(24758)};
    //接口
    [HttpRequestTool postRequestWithURL:BASEQUEST andParameter:dictInfo whenSuccess:^(id responseObject) {
        
        
        NSDictionary *dict = responseObject;
        
        GCBaseModel *base = [[GCBaseModel alloc] init];
        
        [base setValuesForKeysWithDictionary:dict];
        
    } orFail:^(id error) {
        NSLog(@"首页基础数据-请求数据失败");
    }];

}

#pragma mark ===================================键面出发方法===============================

#pragma mark 拨打电话
- (void)tell:(UIBarButtonItem *)sender
{
    
    NSString *number = @"400-678-9953";// 此处读入电话号码
    
    NSString *num = [[NSString alloc] initWithFormat:@"telprompt://%@",number]; //而这个方法则打电话前先弹框  是否打电话 然后打完电话之后回到程序中 网上说这个方法可能不合法 无法通过审核
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号

}

#pragma mark uiscroll上滚动的图片
- (void)tapGestureTouch:(UIView *)t
{
    switch (t.tag) {
        case 11:
        case 15:
        {
            //第一张
          
        }
            break;
        case 10:
        case 14:
        {//最后一张
            GCWebViewController *web = [[GCWebViewController alloc] init];
            web.urlStr = ICON4;
            [self.navigationController pushViewController:web animated:YES];
            [[AppDelegate shareapp].tab setTabBarHidden:YES animated:YES];
        }
            break;
        case 12:
        {//第二张
            GCWebViewController *web = [[GCWebViewController alloc] init];
            web.urlStr = TASTE;
            [self.navigationController pushViewController:web animated:YES];
            [[AppDelegate shareapp].tab setTabBarHidden:YES animated:YES];
        }
            break;
        case 13:
        {//第三张
            
        }
            break;
  
        default:
            break;
    }



}
#pragma mark 点击按钮的回调方法
// 设计模式之简单工厂模式 （传入一个参数，对于这个参数进行判断从而触发不同的情况）
- (void)clickForButton:(UIControl *)sender
{
    switch (sender.tag) {
        case 1000:
        {
            GCSubscribeViewController *Subscribe = [[GCSubscribeViewController alloc] init];
            
            [self.navigationController pushViewController:Subscribe animated:YES];

        }
            break;
        case 1001:
        {
            GCVipViewController *vip = [[GCVipViewController alloc] init];
            
            [self.navigationController pushViewController:vip animated:YES];

        }
            break;
        case 100:
        {
            
            GCWebViewController *web = [[GCWebViewController alloc] init];
            web.urlStr = TAOCAN;
            web.title = @"套餐";
            [self.navigationController pushViewController:web animated:YES];
            [[AppDelegate shareapp].tab setTabBarHidden:YES animated:YES];
        }
            break;
        case 101:
        {
            GCWebViewController *web = [[GCWebViewController alloc] init];
            web.urlStr = TASTE;
            web.title = @"尝鲜";
            [self.navigationController pushViewController:web animated:YES];
            [[AppDelegate shareapp].tab setTabBarHidden:YES animated:YES];
        }
            break;
        case 102:
        {
            GCWebViewController *web = [[GCWebViewController alloc] init];
            web.urlStr = SERVICE;
            web.title = @"服务保障";
            [self.navigationController pushViewController:web animated:YES];
            [[AppDelegate shareapp].tab setTabBarHidden:YES animated:YES];
        }
            break;
        case 888:
        {
            GCCityViewController *city = [[GCCityViewController alloc] init];
            
            city.sendValue = ^(id str){
                
                [root.city setTitle:[str substringToIndex:2] forState:UIControlStateNormal];
                
            };
            
            city.cityName = root.city.titleLabel.text;
            [self.navigationController pushViewController:city animated:YES];
            [[AppDelegate shareapp].tab setTabBarHidden:YES animated:YES];
        }
            break;
        default:
            break;
    }
}




#pragma mark =============================各协议触发方法=====================================

#pragma mark 已经移动改变pagecontro 的值
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //当移动就会改变值
    NSInteger index = scrollView.contentOffset.x /320;
    root.page.currentPage = index -1;
}
#pragma mark 定时器执行 自动滚动
- (void)autoChange:(NSTimer *)t
{
    _currentValue++;
    if (_currentValue <= 5) {
        [UIView animateWithDuration:0.5f animations:^{
            root.scroll.contentOffset = CGPointMake(320 * _currentValue,0);
        }];
    }else{
        root.scroll.contentOffset = CGPointMake(320 ,0);
         _currentValue = 0;
    }
}
#pragma mark 减速是--实现循环滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSInteger index = (scrollView.contentOffset.x - 320) /320;
    if (index == 4) {
        
        root.scroll.contentOffset = CGPointMake(320,0);
        
    }else if (index == -1){
        root.scroll.contentOffset = CGPointMake(320 * 4,0);
    }
}

@end
