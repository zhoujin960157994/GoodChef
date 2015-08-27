//
//  GCOrderPay.m
//  GoodChef
//
//  Created by Mac on 15-6-5.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCOrderPay.h"

@implementation GCOrderPay
#pragma mark ============================初始化方法=======================

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

#pragma mark ============================UI创建方法=======================


- (void)createUI
{

    //top
    
    UIView *topTip = [[UIView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, 40)];
    
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 200, 20)];
    topLabel.text = @"请在30分钟完成支付,之后系统将自动取消";
    
    [topTip addSubview:topLabel];
    
    [self addSubview:topTip];
    
    
    NSArray *imgArr = @[@"order_pay_weixin",@"order_pay_alipay@2x",@"order_pay_visit@2x",@"order_pay_coupon@2x"];
    NSArray *nameArr = @[@"微信支付",@"支付宝支付",@"上门支付",@"现金券"];
    
    //payType
    
    for (int i= 0; i<4; i++) {
        
        UIView *content = [[UIView alloc] initWithFrame:CGRectMake(10, 0, IPHONE_WIDTH, 50)];
        
        content.backgroundColor = [UIColor whiteColor];
        
        
        [self addSubview:content];
        
        
        UIImageView *img  = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 40, 40)];
        
        [content addSubview:img];
        
        
        UILabel *PayTypeName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(img.frame)+ 10, 10, 200, 20)];
        PayTypeName.text = nameArr[i];
        
        [content addSubview:PayTypeName];
        
        UIButton *isSelect = [UIButton buttonWithType:UIButtonTypeCustom];
    
        isSelect.frame = CGRectMake(IPHONE_WIDTH- 10 -60, 10, 30, 30);
        
        [isSelect setImage:[UIImage imageNamed:@"search_chefbtn"] forState:UIControlStateNormal];
        
        [isSelect addTarget:self action:@selector(payType:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [content addSubview:isSelect];
        
        
    }
    
    
    
    
    //other
    
    NSArray *otherNameArr = @[@"餐后水果",@"酒水饮料",@"厨房保洁"];
    
    for (int i=0; i<3; i++) {
        UIButton *addOther = [UIButton buttonWithType:UIButtonTypeCustom];
        
        addOther.frame = CGRectMake(10, 260, 90, 90);
        
        [addOther setBackgroundImage:[UIImage imageNamed:@"order_pay_addBg"] forState:UIControlStateNormal];
        
//        addOther [setTitle: forState:UIControlStateNormal];
    }

    
    
    
    
    //money




}
@end
