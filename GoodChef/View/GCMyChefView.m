//
//  GCMyChefView.m
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCMyChefView.h"

@implementation GCMyChefView
#pragma mark ========================================一系列初始化方法===========

#pragma mark 是否有数据-----
- (instancetype)initWithFrame:(CGRect)frame andHaveInfo:(BOOL)isHave
{
    self = [super initWithFrame:frame];
    if (self) {
        
        if (isHave) {
             [self CreateUI];
        }else{
            [self CreateNoInfo];
        }
        
    }
    return self;
}
#pragma mark ========================================一系列UI创建方法===========
#pragma mark 数据显示tableview
- (void)CreateUI
{

    self.tabView = [[UITableView alloc] initWithFrame:self.bounds];
    
    [self.tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
    
    [self addSubview:self.tabView];
    


}
#pragma mark 没数据时候显示的UI
- (void)CreateNoInfo
{
    
    //苦脸
    UIImageView *sad = [[UIImageView alloc] initWithFrame:CGRectMake(120, 150, 100, 100)];
    sad.image = [UIImage imageNamed:@"order_bgImg"];
    
    [self addSubview:sad];
    
    //文字
    UILabel *info = [[UILabel alloc] initWithFrame:CGRectMake(90, CGRectGetMaxY(sad.frame) + 10, 160, 20)];
    
    info.textAlignment = NSTextAlignmentCenter;
    info.font = [UIFont  systemFontOfSize:12];
    
    info.text = @"还没有厨师呢，赶紧去收藏吧!";
    
    [self addSubview:info];





}


#pragma mark ========================================一系列事件触发方法===========
@end
