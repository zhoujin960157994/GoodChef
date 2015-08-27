//
//  GCAddressAddViewController.m
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCAddressEditViewController.h"
//self view
#import "GCAddressEditView.h"

@interface GCAddressEditViewController ()<UITextFieldDelegate>

/**
 *  自身的UI
 */
@property (nonatomic,strong) GCAddressEditView *EditAddress;
/**
 *  array
 */
@property (nonatomic,strong) NSMutableDictionary *postDict;

@end

@implementation GCAddressEditViewController
#pragma mark ============================初始化方法================
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"添加常用地址";
        self.view.backgroundColor = [UIColor colorWithRed:ShallowGray green:ShallowGray blue:ShallowGray alpha:1];
    
    self.postDict = [NSMutableDictionary dictionary];
    
    //执行创建UI
    [self createMainUI];
    

    
}

#pragma mark ============================UI创建方法================

- (void)createMainUI
{
    self.EditAddress = [[GCAddressEditView alloc] initWithFrame:self.view.bounds];
    
    for (int i= 231; i<235; i++) {
        
        UITextField *fieldtext = (UITextField *)[self.EditAddress viewWithTag:i];
        
        fieldtext.delegate = self;
        
        fieldtext.returnKeyType = UIReturnKeyDone;
        
//        [self.postDict setValue:fieldtext.text forKey:];
        
    }

    [self.view addSubview:self.EditAddress];
    
    
    

}

#pragma mark ============================事件触发方法================

//- (void)


#pragma mark ============================请求触发方法================

- (void)PostAddressInfo
{
//
//    	3
//    	1
//    	傻吧
//
//
    NSDictionary *dict = @{@"address":@"北京路",@"areaId":@(3),@"cityId":@(1),@"name":@"南山",@"phone":@"13666242980",@"userId":@"24758"};
    [HttpRequestTool postRequestWithURL:ADDADDRESS andParameter:dict whenSuccess:^(id responseObject) {
        
       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提交成功" message:@"提交成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"", nil];
        
        [alert show];
        
        
        
    } orFail:^(id error) {
        
    }];

}



#pragma mark ============================请求触发方法================

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 231:
        {
            

            
            
        }
            break;
        case 232:
        {
            
        }
            break;
        case 133:
        {
            
        }
            break;
        case 134:
        {
            
        }
            break;
        default:
            break;
    }

    
    
    
    return YES;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{


}

- (void)textFieldDidEndEditing:(UITextField *)textField
{


}

@end
