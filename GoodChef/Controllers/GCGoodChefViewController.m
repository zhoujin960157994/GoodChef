//
//  GCGoodChefViewController.m
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCGoodChefViewController.h"
//关于我们
#import "GCGoodChefView.h"

@interface GCGoodChefViewController ()

@end

@implementation GCGoodChefViewController

#pragma mark =========================一系列初始化=============================
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"关于我们";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
    
    
}

- (void)createUI
{
    GCGoodChefView *goodChef = [[GCGoodChefView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:goodChef];
    
    __weak GCGoodChefViewController *temp = self;
    goodChef.sendBlock = ^(id sender)
    {
        [temp clickForButton:sender];
    
    
    };


}
#pragma mark =========================一系列事件触发方法=============================

- (void)clickForButton:(UIButton *)sender
{
    switch (sender.tag) {
        case 99:
        {
            //评分
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.chushi007.com"]];
        
        
        }
            break;
        case 999:
        {
            //评分
             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com/haochushi007"]];
            
            
        }
            break;
        case 9999:
        {
            //评分
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/hao-chu-shi-yu-ding-chu-shi/id882132701?mt=8"]];
            
            
        }
            break;

            
        default:
            break;
    }


}

@end
