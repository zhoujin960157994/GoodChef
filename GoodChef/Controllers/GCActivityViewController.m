//
//  GCActivityViewController.m
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCActivityViewController.h"
//self view
#import "GCActivityVIew.h"

@interface GCActivityViewController ()

@end

@implementation GCActivityViewController
#pragma mark =============================一系列初始化方法===================

- (void)viewWillAppear:(BOOL)animated
{

    [[AppDelegate shareapp].tab setTabBarHidden:YES animated:YES];


}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
        self.navigationItem.title = @"活动中心";
    
    [self CreateMainUI];
    

}

#pragma mark =============================一系列UI创建方法===================

- (void)CreateMainUI
{
    
    GCActivityVIew *activity = [[GCActivityVIew alloc] initWithFrame:CGRectMake(100, 100, 100, 120)];
    
    
    [self.view addSubview:activity];
    
    
    

    



}

#pragma mark =============================一系列事件响应方法===================

#pragma mark =============================一系列请求数据方法===================

@end
