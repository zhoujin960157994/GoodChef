//
//  GCVipView.m
//  GoodChef
//
//  Created by Mac on 15-5-31.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCVipView.h"

@implementation GCVipView
#pragma mark ==================================一系列页面加载方法

#pragma mark ==================================一系列初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createMainUI];
        
    }
    return self;
}

#pragma mark ==================================一系列创建UI方法

- (void)createMainUI
{

    self.tabView = [[UITableView alloc] initWithFrame:self.bounds];
    
    [self.tabView registerNib:[UINib nibWithNibName:@"GCVipTableViewCell" bundle:nil] forCellReuseIdentifier:@"identifier"];
    
    [self addSubview:self.tabView];





}

#pragma mark ==================================一系列事件响应方法

//- ()

@end
