//
//  SubscribeView.m
//  GoodChef
//
//  Created by Mac on 15-5-31.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCSubscribeView.h"

@implementation GCSubscribeView

#pragma mark ===============================一系列初始化方法=======================

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self CreateMainUI];
        //
//        [self DataPiker];
        
    }
    return self;
}

#pragma mark ===============================一系列初始化方法=======================
- (void)CreateMainUI
{
    //创建top
    UIView *top = [[UIView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, 40)];
    
    top.backgroundColor = [UIColor grayColor];
    
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, IPHONE_WIDTH, 20)];
    
    topLabel.text = @"为保证您的准时用餐(建议在用餐前4小时预订)";
    
    topLabel.textAlignment = NSTextAlignmentCenter;
    
    topLabel.font = [UIFont systemFontOfSize:14];
    
    [top addSubview:topLabel];
    
    
    [self addSubview:top];
    CGFloat contentF_Y = CGRectGetMaxY(top.frame)+10;
    CGFloat contentF_H = 60;
    NSArray *imgNameArr = @[@"orders_date",@"orders_address",@"orders_dining",@"orders_voice"];
    for (int i = 1;i<5; i++) {
        self.content = [[UIView alloc] initWithFrame:CGRectMake(10,((contentF_H+ 10)*i), IPHONE_WIDTH- 20, contentF_H)];
        self.content.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.content];
        //创图片
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 30, 30)];
        
        img.image = [UIImage imageNamed:imgNameArr[i-1]];
        
        [self.content addSubview:img];
        
        self.field = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(img.frame)+ 5, CGRectGetMinY(img.frame)- 5, self.content.frame.size.width-45, 40)];
        self.field.tag = 120 + i;
        self.field.borderStyle = UITextBorderStyleRoundedRect;
        [self.content addSubview:self.field];
        
    }
    
    UIButton *submitOrder = [UIButton buttonWithType:UIButtonTypeCustom];
    
    submitOrder.frame = CGRectMake(20, IPHONE_HEIGHT- 64 - 50, IPHONE_WIDTH - 40, 50);
    
    [submitOrder setTitle:@"提交订单" forState:UIControlStateNormal];
    
    [submitOrder setBackgroundImage:[UIImage imageNamed:@"confirmbtnbg"] forState:UIControlStateNormal];
    
    
    [self addSubview:submitOrder];
    
 
    

}

- (void)CreateDataPiker
{
    
    UITextField *first = (UITextField *)[self viewWithTag:121];
    
    
    
    // 1.创建最外面的大view
    // 1.创建时间选择器
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    // 设置只显示日期
    datePicker.datePickerMode = UIDatePickerModeDate;
    // 设置日期为中文
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    
    
    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    first.inputView = datePicker;
    
    // 2.创建工具条
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.barTintColor = [UIColor purpleColor];
    toolbar.frame = CGRectMake(0, 0, 320, 44);
    
    // 2.1给工具条添加按钮
    UIBarButtonItem *item0 = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(finishBtn:)];
    
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
 
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishBtn:)];
    toolbar.items = @[item0, item3, item2];
    
    // 3.创建时间选择器
    
    // 4.设置文本输入框的自定义键盘为大view
    first.inputAccessoryView = toolbar;
    
    
}




#pragma mark ===============================一系列事件触发方法=======================

- (void)finishBtn:(UIButton *)sender
{


}




#pragma mark ===============================一系列初始化方法=======================


@end
