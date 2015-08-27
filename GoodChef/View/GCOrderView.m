//
//  GCOrderView.m
//  GoodChef
//
//  Created by Mac on 15-5-28.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCOrderView.h"
#import "GCOrderTableViewCell.h"

@implementation GCOrderView

#pragma mark =====================各初始化方法=================================
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createTableView];
        
        
    }
    
    return self;


}

#pragma mark ==========================各创建UI方法=============================

- (void)createTableView
{
    self.tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT- (49+64))];
//    [self.tabView registerClass:[GCOrderTableViewCell class] forCellReuseIdentifier:@"cellid"];
    
    [self.tabView registerNib:[UINib nibWithNibName:@"GCOrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellid"];
    
    self.tabView.backgroundColor = [UIColor grayColor];
    
    self.tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self addSubview:self.tabView];
    
}


@end
