//
//  GCActivityVIew.m
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCActivityVIew.h"

@implementation GCActivityVIew


#pragma mark =================================一系列初始化方法

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self CreateNoInfoUI];
        
    }
    return self;
}



#pragma mark =================================一系列UI创建方法
#pragma mark 创建一个没有内容时，会显示的UI键面
-(void)CreateNoInfoUI
{
    //苦脸
    UIImageView *sad = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    sad.image = [UIImage imageNamed:@"NoInfo_bgImg"];
    
    [self addSubview:sad];
    
    //文字
    UILabel *info = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(sad.frame)+ 10, 100, 20)];

    info.textAlignment = NSTextAlignmentCenter;
    info.font = [UIFont  systemFontOfSize:15];
    
    info.text = @"没有活动信息";
    
    [self addSubview:info];
    


}

@end
