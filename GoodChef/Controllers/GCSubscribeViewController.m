//
//  SubscribeViewController.m
//  GoodChef
//
//  Created by Mac on 15-5-31.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCSubscribeViewController.h"
//self view
#import "GCSubscribeView.h"

@interface GCSubscribeViewController ()<UITextFieldDelegate>

/**
 *  self  的 view
 */
@property (nonatomic,strong) GCSubscribeView *subscribe;

@end

@implementation GCSubscribeViewController
#pragma mark ===============================一系列初始化方法============================

- (void)viewWillAppear:(BOOL)animated
{

    [[AppDelegate shareapp].tab setTabBarHidden:YES];


}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"预约厨师";
    
    [self.view setBackgroundColor:[UIColor colorWithRed:ShallowGray green:ShallowGray blue:ShallowGray alpha:1]];
    
//    [self.view setBackgroundColor:[UIColor whiteColor]];
    //执行创建UI操作
    [self CreateMainUI];
    
    __weak GCSubscribeViewController *temp = self;
    
    self.subscribe.sendBlock = ^(id sender){
        
        [temp clickForButton:sender];
    
    };
    
    
}


#pragma mark ===============================一系列UI创建方法============================
- (void)CreateMainUI
{

    self.subscribe = [[GCSubscribeView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT- 64)];
    
    for (int i= 121; i<125; i++) {
        
       UITextField *fieldtext = (UITextField *)[self.subscribe viewWithTag:i];
       
        fieldtext.delegate = self;
        
        fieldtext.returnKeyType = UIReturnKeyDone;
        
        
    }
    

    
    [self.view addSubview:self.subscribe];
    


}




#pragma mark ===============================一系列事件触发方法============================

- (void)datePickerValueChanged:(UIDatePicker *)sender {
    
   
    
}

- (void)clickForButton:(UIView *)sender
{

    switch (sender.tag) {
        case 1111:
        {
        
            NSLog(@"我的pkier");
        }
            break;
            
        default:
            break;
    }


}
#pragma mark ===============================一系列数据请求发送方法============================


#pragma mark ===============================一系列代理方法实现方法============================
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 121:
        {
            
           [self.subscribe CreateDataPiker];
            
            
        }
            break;
        case 122:
        {
            
        }
            break;
        case 123:
        {
            
        }
            break;
        case 124:
        {
            
        }
            break;
        default:
            break;
    }
//    
//    //如果当前要显示的键盘，那么把UIDatePicker（如果在视图中）隐藏
//    if (textField.tag != 1001) {
//        if (self.datePicker.superview) {
//            [self.datePicker removeFromSuperview];
//        }
//        return YES;
//    }
//    
//    //UIDatePicker以及在当前视图上就不用再显示了
//    if (self.datePicker.superview == nil) {
//        //close all keyboard or data picker visible currently
//        [self.testNameField resignFirstResponder];
//        [self.testLocationField resignFirstResponder];
//        [self.testOtherField resignFirstResponder];
//        
//        //此处将Y坐标设在最底下，为了一会动画的展示
//        self.datePicker.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 216);
//        [self.view addSubview:self.datePicker];
//        
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:0.3f];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
//        self.datePicker.bottom -= self.datePicker.height;
//        [UIView commitAnimations];
//    }
    


    return YES;

}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 121:
        {
        
        }
            break;
        case 122:
        {
            
        }
            break;
        case 123:
        {
            
        }
            break;
        case 124:
        {
            
        }
            break;
        default:
            break;
    }

}


@end
