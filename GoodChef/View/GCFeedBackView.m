//
//  GCFeedBackView.m
//  GoodChef
//
//  Created by Mac on 15-6-2.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCFeedBackView.h"

@implementation GCFeedBackView
#pragma mark ========================一系列初始化方法=============================
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
#pragma mark ========================一系列UI创建方法=============================
- (void)createUI
{
    
    
    self.content = [[UITextField alloc] initWithFrame:self.bounds];
    
    self.content.backgroundColor = [UIColor whiteColor];
    
    self.content.placeholder = @"请输入你要评价的信息.........";
    
    [self addSubview:self.content];
    

}

@end
