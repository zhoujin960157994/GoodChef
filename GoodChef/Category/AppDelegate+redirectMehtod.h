//
//  AppDelegate+alipay.h
//  PayUse
//
//  Created by gorson on 6/4/15.
//  Copyright (c) 2015 1000phone. All rights reserved.
//

#import "AppDelegate.h"

// 支付宝
#import <AlipaySDK/AlipaySDK.h>

// 微信支付集成所需
//APP端签名相关头文件
#import "payRequsestHandler.h"
#import "WXApi.h"
//服务端签名只需要用到下面一个头文件
#import <QuartzCore/QuartzCore.h>

@interface AppDelegate (redirectMehtod)

@end
