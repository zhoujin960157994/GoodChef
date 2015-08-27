//
//  GCOrderDetailViewController.h
//  GoodChef
//
//  Created by Mac on 15-5-30.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentViewController.h"
//order -model

// 微信支付集成所需
//APP端签名相关头文件
//#import "WxpayReq.h"
#import "payRequsestHandler.h"

#import "WXApi.h"
//服务端签名只需要用到下面一个头文件
//#import "ApiXml.h"
#import <QuartzCore/QuartzCore.h>

#import "GCOrderEntityModel.h"

@interface GCOrderDetailViewController : GCParentViewController<WXApiDelegate>
/**
 *  order-model
 */
@property (nonatomic,strong) GCOrderEntityModel *orderModel;
@end
