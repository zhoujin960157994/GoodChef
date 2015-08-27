//
//  GCOrderTableViewCell.m
//  GoodChef
//
//  Created by Mac on 15-5-28.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCOrderTableViewCell.h"
//订单数据模型
#import "GCOrderEntityModel.h"
//
#import "GCOrderDetailViewController.h"

@implementation GCOrderTableViewCell
{
    
    GCOrderEntityModel *current;

}


#pragma mark ======================各初始化方法========================
- (instancetype)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    return self;


}

#pragma  mark xib 里面的控件是在该方法中编写
- (void)awakeFromNib {
    //设置按钮属性
    
    self.scanOrderState.layer.borderWidth = 0.3f;
    
    self.scanOrderState.layer.borderColor = [[UIColor blackColor] CGColor];
    
    
    _orderDetail.layer.borderWidth = 0.3f;
    
    _orderDetail.layer.borderColor = [[UIColor blackColor] CGColor];
    

}

#pragma mark =======================UI创建方法=====================
- (void)CreateOrderStatus:(GCOrderEntityModel *)model andframe:(CGRect)frame
{
    //底部的订单跟踪流程====================================
    
    UIView *bottom = [[UIView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(frame)+10, IPHONE_WIDTH, 220)];
    
    bottom.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:bottom];
    //订单跟踪

    NSArray *namearr = @[@"订单已提交",@"已经付款",@"等待客服确认订单",@"订单已确认",@"等待厨师上门",@"服务完成"];
    
    
    CGFloat imgH = 35;
    //底部
    for (NSInteger i =1; i< 7; i++) {
        
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(10, i* imgH+15, 10, 10)];
        img.image = [UIImage imageNamed:@"orderstatusgray"];
        
        [bottom addSubview:img];
        
        UILabel *orderstatus = [[UILabel alloc] initWithFrame:CGRectMake( 10, (i *imgH)+10, 200, 15)];
        
        orderstatus.text = namearr[i-1];
        orderstatus.textAlignment = NSTextAlignmentLeft;
        orderstatus.font = [UIFont systemFontOfSize:12];
        
        if ([model.orderStatus intValue]+ 1 == i) {
            orderstatus.textColor =[UIColor orangeColor];
            img.image = [UIImage imageNamed:@"orderstatusred"];
        }
        [bottom addSubview:orderstatus];
        
        UIView *line  = [[UIView alloc] initWithFrame:CGRectMake(10, (i *imgH)+ 30, 280, 0.5)];
        
        line.backgroundColor = [UIColor grayColor];
        
        [bottom addSubview:line];
        
        
    }




}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
#pragma mark =======================系列刷新数据方法================

- (void)refreshData:(GCOrderEntityModel *)model
{
    //
    
    current = model;
//    NSLog(@"%@",model.orderTime);
    self.OrderId.text = model.orderId;

    self.orderTime.text = model.createTime;
    
    self.orderType.text = model.ComboEntity.comboName;
    
    self.price.text = [NSString stringWithFormat:@"￥:%@",model.orderPrice];
    
    self.chefName.text = model.ChefEntity.chefName;
    
    self.serviceTime.text = model.orderTime;
    

}

#pragma mark =======================一系列的点击事件===============
#pragma mark 订单状态
- (IBAction)scanState:(UIButton *)sender {
    //跳转订单详情
    
    if (self.sendblock) {
        self.sendblock(sender);
    }
  
    
    
}
#pragma mark 查看详情
- (IBAction)scanDetail:(UIButton *)sender {
    //创建
    if (self.MyBlock) {
        self.MyBlock(current);
    }
}


@end
