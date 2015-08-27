//
//  GCAddressView.m
//  GoodChef
//
//  Created by Mac on 15-6-2.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCAddressView.h"

@implementation GCAddressView

#pragma mark =============================初始化方法=================
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        
        [self createUI];
        
    }
    return self;

}

#pragma mark =============================初UI创建方法=================
- (void)createUI
{

    self.tabView = [[UITableView alloc] initWithFrame:self.bounds];
    
    [self.tabView registerNib:[UINib nibWithNibName:@"GCAddressTableViewCell" bundle:nil] forCellReuseIdentifier:@"identifier"];
    
    [self addSubview:self.tabView];
    

}

#pragma mark =============================事件响应方法=================

#pragma mark =============================其他方法=================


@end
