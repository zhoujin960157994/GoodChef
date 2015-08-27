//
//  GCFeedbackViewController.m
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCFeedbackViewController.h"
//self view
#import "GCFeedBackView.h"

@interface GCFeedbackViewController ()<UITextFieldDelegate>
/**
 *  self view
 */

@property (nonatomic,strong) GCFeedBackView *feedback;

@end

@implementation GCFeedbackViewController
#pragma mark ======================初始化方法==================
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"意见反馈";
        self.view.backgroundColor = [UIColor colorWithRed:ShallowGray green:ShallowGray blue:ShallowGray alpha:1];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(Done:)];
    
    [self createMainUI];
    

    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
    

}
#pragma mark ======================UI创建方法==================
- (void)createMainUI
{
    self.feedback = [[GCFeedBackView alloc] initWithFrame:CGRectMake(10, 10, IPHONE_WIDTH-20, 200)];
    
    self.feedback.content.delegate = self;
    
    
    [self.view addSubview:self.feedback];
    

}

#pragma mark ======================事件触发方法==================
- (void)Done:(UIBarButtonItem *)sender
{
        [self PostFeedbackData];

}

#pragma mark ======================数据请求提交方法==================

- (void)PostFeedbackData
{
    //参数: 	 --这是用户输入的
    //
    
   
         NSLog(@"%@",self.feedback.content.text);
    
    
    
    NSDictionary *dict = @{@"content":self.feedback.content.text,@"userId":@(24758)};
    [HttpRequestTool postRequestWithURL:FEEDBACK andParameter:dict whenSuccess:^(id responseObject) {
        if ([responseObject[@"code"] isEqualToString:@"200"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提交成功" message:@"提交成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            
            [alert show];
        }
      
        
        
        NSLog(@"-----%@",responseObject[@"code"]);
        
    } orFail:^(id error) {
        
    }];
    

    

}


- (void)tap
{
    
    [self.view endEditing:YES];

}
#pragma mark ===================代理方法实现==================

//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
//    
//    
//    
//    
//
//    return YES;
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//
//
//
//
//}

@end
