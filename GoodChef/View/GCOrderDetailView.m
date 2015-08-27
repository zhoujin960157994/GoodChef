//
//  GCOrderDetailView.m
//  GoodChef
//
//  Created by Mac on 15-5-30.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCOrderDetailView.h"
//数据模型
#import "GCOrderEntityModel.h"
//菜系modeL
#import "GCCuisineEntityModel.h"

@implementation GCOrderDetailView

#pragma mark =========================一些列初始化方法============================

- (instancetype)initWithFrame:(CGRect)frame andDatamodel:(GCOrderEntityModel *)model
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUI:model];
        
    }
    return self;
}

#pragma mark ============================一系列事件触发方法=======================




#pragma mark ============================一系列UI创建方法=======================
/**
 *  创建UI
 */
- (void)createUI:(GCOrderEntityModel *)model
{
    
    //创建top==============================
    

    UIView *TopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, 30)];
    
    TopView.backgroundColor = [UIColor whiteColor];
    
    //left
    UILabel *leftlabel = [[UILabel alloc] initWithFrame:CGRectMake(-20, 5,220, 20)];
    leftlabel.text = [NSString stringWithFormat:@"订单号:%@",model.orderId];
    leftlabel.font = [UIFont systemFontOfSize:12];
    leftlabel.textAlignment = NSTextAlignmentCenter;
    [TopView addSubview:leftlabel];
    //right
    UILabel *rightlabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 5,110, 20)];
    rightlabel.text = model.orderTime;
    rightlabel.font = [UIFont systemFontOfSize:11];
    rightlabel.textAlignment = NSTextAlignmentCenter;
    [TopView addSubview:rightlabel];
    
    [self addSubview:TopView];
    
    //创建中间=============================================
    UIView *middle =  [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(TopView.frame)+5, IPHONE_WIDTH, 200)];
    middle.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:middle];
//订单名称
    UILabel *ordertype = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 20)];
    ordertype.font =  [UIFont fontWithName:@"Helvetica-Bold" size:16];
    ordertype.text = model.ComboEntity.comboName;
    [middle addSubview:ordertype];
    //订单价格
    UILabel *orderprice = [[UILabel alloc] initWithFrame:CGRectMake(250, 5, 60, 20)];
    orderprice.font =  [UIFont fontWithName:@"Helvetica-Bold" size:13];

    orderprice.text = [NSString stringWithFormat:@"￥%@.00",model.ComboEntity.comboPrice];
    [middle addSubview:orderprice];
    //订单服务时间
    NSString *menuName = [NSString stringWithFormat:@"%@ %@ %@",model.greensName[0],model.greensName[1],model.greensName[2]];
    //订单其他信息
    NSArray *titleArr = @[[self GetStart:@"服务时间:" andMiddle:@"" andEnd:model.orderTime],[self GetStart:@"服务地址" andMiddle:@":" andEnd:model.AddressEntity.address],[self GetStart:@"菜品:" andMiddle:@":" andEnd:menuName]];
    
    for (NSInteger i =1; i< 4; i++) {
        UILabel *orderserviceTime = [[UILabel alloc] initWithFrame:CGRectMake(10,(i * 25), 300, 20)];
        orderserviceTime.font =  [UIFont systemFontOfSize:13];
        
        orderserviceTime.text = titleArr[i-1];
        [middle addSubview:orderserviceTime];
    }
    UIView *middleline  = [[UIView alloc] initWithFrame:CGRectMake(5, 100, IPHONE_WIDTH, 1)];
    middleline.backgroundColor = [UIColor grayColor];
    [middle addSubview:middleline];
    
    //厨师信息
    UIImageView *chefImg = [[UIImageView alloc] initWithFrame:CGRectMake( 10, CGRectGetMaxY(middleline.frame)+10, 60, 60)];
    chefImg.layer.cornerRadius = 30;
    chefImg.clipsToBounds = YES;
    NSURL *chefUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",GCHOST,model.ChefEntity.chefUrl]];
    chefImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:chefUrl]];
    [middle addSubview:chefImg];
    UILabel *chefName = [[UILabel alloc] initWithFrame:CGRectMake(70+10,CGRectGetMaxY(middleline.frame)+10, 100, 20)];
    chefName.text = model.ChefEntity.chefName;
    chefName.textAlignment = NSTextAlignmentLeft;
    chefName.font =  [UIFont fontWithName:@"Helvetica-Bold" size:16];
    [middle addSubview:chefName];
    UILabel *chefserviced = [[UILabel alloc] initWithFrame:CGRectMake(180,CGRectGetMaxY(middleline.frame)+10, 150, 20)];
    
    chefserviced.text = [self GetStart:@"已服务" andMiddle:model.ChefEntity.reserveNum andEnd:@"家庭"];
    chefserviced.textAlignment = NSTextAlignmentLeft;
    chefserviced.font =  [UIFont fontWithName:@"Helvetica-Bold" size:16];
    [middle addSubview:chefserviced];
    
    for (NSInteger i =0; i< 6; i++) {
        UIImageView *menuTypeImg = [[UIImageView alloc] initWithFrame:CGRectMake((i * 25)+80, CGRectGetMaxY(middleline.frame)+40, 25, 20)];
        menuTypeImg.image = [UIImage imageNamed:@"rating_smallstar_full"];
        
        [middle addSubview:menuTypeImg];
    }


    for (NSInteger i=1; i<model.ChefEntity.CuisineEntity.count + 1; i++) {
        UIImageView *menuTypeImg = [[UIImageView alloc] initWithFrame:CGRectMake((i * 60)+20, CGRectGetMaxY(middleline.frame)+70, 40, 20)];
        menuTypeImg.image = [UIImage imageNamed:[self getMenuImg:model.ChefEntity.CuisineEntity[i-1]]];
        
        [middle addSubview:menuTypeImg];
    }
    
    
    //底部的订单跟踪流程====================================
    
    UIView *bottom = [[UIView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(middle.frame)+ 10, IPHONE_WIDTH, 260)];
    
    bottom.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:bottom];
    //订单跟踪
    UILabel *orderstep = [[UILabel alloc] initWithFrame:CGRectMake(10,5, 200, 20)];
    orderstep.text = @"订单跟踪";
    orderstep.textAlignment = NSTextAlignmentLeft;
    orderstep.font =  [UIFont fontWithName:@"Helvetica-Bold" size:16];
   
    [bottom addSubview:orderstep];
    UIView *line  = [[UIView alloc] initWithFrame:CGRectMake(0, 30, IPHONE_WIDTH, 1)];
    line.backgroundColor = [UIColor grayColor];
    [bottom addSubview:line];
    
    
    NSArray *namearr = @[@"订单已提交",@"已经付款",@"等待客服确认订单",@"订单已确认",@"等待厨师上门",@"服务完成"];
    

    CGFloat imgH = 35;
    //底部
    for (NSInteger i =1; i< 7; i++) {
        
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(10, i* imgH+15, 10, 10)];
        img.image = [UIImage imageNamed:@"orderstatusgray"];
        
        [bottom addSubview:img];
        
        UILabel *orderstatus = [[UILabel alloc] initWithFrame:CGRectMake( 30, (i *imgH)+10, 200, 15)];
        
        orderstatus.text = namearr[i-1];
        orderstatus.textAlignment = NSTextAlignmentLeft;
        orderstatus.font = [UIFont systemFontOfSize:12];
        
        if ([model.orderStatus intValue]+ 1 == i) {
            orderstatus.textColor =[UIColor orangeColor];
            img.image = [UIImage imageNamed:@"orderstatusred"];
        }
        [bottom addSubview:orderstatus];
        
        UIView *line  = [[UIView alloc] initWithFrame:CGRectMake(30, (i *imgH)+ 30, 280, 1)];
        
        line.backgroundColor = [UIColor grayColor];
        
        [bottom addSubview:line];
        
        
    }


}

#pragma mark 判断菜品图的
- (NSString *)getMenuImg:(GCCuisineEntityModel *)model
{
    NSString *menustr = @"";
    
    switch ([model.cid intValue]) {
        case 21:
        {
            menustr = @"cuisine_cc";
        
        }
            break;
        case 22:
        {
            menustr = @"cuisine_xc";
            
        }
            break;
            
        case 23:
        {
            menustr = @"cuisine_jcc";
            
        }
            break;
        case 24:
        {
            menustr = @"cuisine_yc";
            
        }
            break;
        case 25:
        {
            menustr = @"cuisine_bbc";
            
        }
            break;
        case 26:
        {
            menustr = @"cuisine_dbc";
            
        }
            break;
            
        default:
            break;
    }
    
    return menustr;


}

- (void)createPayType
{
 
}


@end
