//
//  MBProgressHUD+GC.h
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (GC)
/**
 *  显示成功信息
 *
 *  @param success
 *  @param view
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
/**
 *  显示出错信息
 *
 *  @param error
 *  @param view  在什么view上显示
 */
+ (void)showError:(NSString *)error toView:(UIView *)view;
/**
 *  mb 的一个类方法 显示信息
 *
 *  @param message
 *  @param view
 *
 *  @return
 */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

/**
 * 显示成功信息
 *
 *  @param success
 */
+ (void)showSuccess:(NSString *)success;
/**
 *  显示出错信息
 *
 *  @param error
 */
+ (void)showError:(NSString *)error;
/**
 *  显示信息
 *
 *  @param message
 *
 *  @return
 */
+ (MBProgressHUD *)showMessage:(NSString *)message;
/**
 *  在view 上隐藏
 *
 *  @param view 
 */
+ (void)hideHUDForView:(UIView *)view;
/**
 *  隐藏
 */
+ (void)hideHUD;

@end
