//
//  GCVipTableViewCell.m
//  GoodChef
//
//  Created by Mac on 15-5-31.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCVipTableViewCell.h"
@interface GCVipTableViewCell ()

- (IBAction)TallPay:(UIButton *)sender;

- (IBAction)LinePay:(UIButton *)sender;

@end

@implementation GCVipTableViewCell

#pragma mark =====================================一系列页面加载方法===============================
/**
 *  加载NIB DE METHOD method
 */
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark =====================================一系列页面事件触发方法===============================
/**
 *  电话充值
 *
 *  @param sender uibutton
 */
- (IBAction)TallPay:(UIButton *)sender {
}
/**
 *  在线充值
 *
 *  @param sender uibutton
 */
- (IBAction)LinePay:(UIButton *)sender {
    
}


@end
