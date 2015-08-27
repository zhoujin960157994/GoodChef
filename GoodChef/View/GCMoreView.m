//
//  GCMoreView.m
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCMoreView.h"

@implementation GCMoreView

#pragma mark====================================一系列初始化方法===============================

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUI];
        
    }
    return self;
}
#pragma mark====================================一系列UI创建方法===============================
- (void)createUI
{
    self.tabView = [[UITableView alloc] initWithFrame:self.bounds];
    
    
    [self.tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
    
    self.tabView.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:0.8];
    
    [self addSubview:self.tabView];
    

}


#pragma mark====================================一系列事件触发方法===============================
@end
