//
//  GCCityView.m
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCCityView.h"

@implementation GCCityView
#pragma mark ===================================一系列页面加载初始化方法===========
-(instancetype)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self createUI];
        
    }
    
    return self;


}

#pragma mark ===================================一系列页面创建UI方法===========
- (void)createUI
{

    self.tabView = [[UITableView alloc] initWithFrame:self.bounds];
    
    [self.tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
    
    [self addSubview:self.tabView];

}

#pragma mark ===================================一系列页面时间响应方法===========


@end
