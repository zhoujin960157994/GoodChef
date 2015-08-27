//
//  GCAddressEditView.m
//  GoodChef
//
//  Created by Mac on 15-6-2.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCAddressEditView.h"

@implementation GCAddressEditView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self CreateMainUI];
    }
    return self;
}

- (void)CreateMainUI
{
    CGFloat contentF_Y = 10;
    CGFloat contentF_H = 60;
    NSArray *imgNameArr = @[@"姓名:",@"电话:",@"所在区域:",@"详细地址:"];
    
    NSArray *fieldContent = @[@"请输入您的姓名",@"请填写能联系到您的电话号码",@"",@"请输入您的详细地址"];
    for (int i = 1;i<5; i++) {
        self.content = [[UIView alloc] initWithFrame:CGRectMake(10,((contentF_H+ 10)*(i-1)), IPHONE_WIDTH- 20, contentF_H)];
        
        self.content.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.content];
        //创图片

        
        
       UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20,60, 20)];
        
        topLabel.text = imgNameArr[i-1];
        
        topLabel.textAlignment = NSTextAlignmentLeft;
        
        topLabel.font = [UIFont systemFontOfSize:13];
        
        [self.content addSubview:topLabel];
        
        self.field = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(topLabel.frame), CGRectGetMinY(topLabel.frame)-10, self.content.frame.size.width-75, 40)];
    
        self.field.clearsOnBeginEditing = YES;
        
        self.field.enabled = YES;
        self.field.tag = 230 + i;
        self.field.placeholder = fieldContent[i-1];
        self.field.borderStyle = UITextBorderStyleRoundedRect;
        
        [self.content addSubview:self.field];
        
        if (i==3) {
            UIImageView *leftImg = [[UIImageView alloc] initWithFrame:CGRectMake(IPHONE_WIDTH- 50, 20, 20, 20)]; //oneorder_jiantou@2x
            leftImg.userInteractionEnabled = YES;
            leftImg.image = [UIImage imageNamed:@"oneorder_jiantou"];
            
            [self.content addSubview:leftImg];
        }
        
    }
    
    UIButton *submitOrder = [UIButton buttonWithType:UIButtonTypeCustom];
    
    submitOrder.frame = CGRectMake(20, CGRectGetMaxY(self.content.frame)+10, IPHONE_WIDTH - 40, 50);
    
    [submitOrder setTitle:@"确认信息" forState:UIControlStateNormal];
    
    [submitOrder addTarget:self action:@selector(submitInfo:) forControlEvents:UIControlEventTouchUpInside];
    
    [submitOrder setBackgroundImage:[UIImage imageNamed:@"confirmbtnbg"] forState:UIControlStateNormal];
    
    
    [self addSubview:submitOrder];
    
    
    
 
    
}

- (void)submitInfo:(UIButton *)sender
{


}

@end
