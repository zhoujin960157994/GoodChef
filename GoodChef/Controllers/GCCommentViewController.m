//
//  GCCommentViewController.m
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCCommentViewController.h"
//我的评论
#import "GCCommentView.h"

@interface GCCommentViewController ()

@end

@implementation GCCommentViewController
#pragma mark =============================一系列初始化方法===================

- (void)viewWillAppear:(BOOL)animated
{
    
    [[AppDelegate shareapp].tab setTabBarHidden:YES animated:YES];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.navigationItem.title = @"我的评论";
    
    [self CreateMainUI];
    
    
}

#pragma mark =============================一系列UI创建方法===================

- (void)CreateMainUI
{
    
    GCCommentView *comment = [[GCCommentView alloc] initWithFrame:CGRectMake(100, 100, 100, 120)];
    
    
    [self.view addSubview:comment];
    
    
    
    
    
    
    
    
}

#pragma mark =============================一系列事件响应方法===================

#pragma mark =============================一系列请求数据方法===================


@end
