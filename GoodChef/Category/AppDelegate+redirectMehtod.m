//
//  AppDelegate+alipay.m
//  PayUse
//
//  Created by gorson on 6/4/15.
//  Copyright (c) 2015 1000phone. All rights reserved.
//

#import "AppDelegate+redirectMehtod.h"
// 控制器
#import "GCOrderDetailViewController.h"

#import "GCOrderDetailView.h"






@implementation AppDelegate (redirectMehtod)

//- (BOOL)application:(UIApplication *)application
//            openURL:(NSURL *)url
//  sourceApplication:(NSString *)sourceApplication
//         annotation:(id)annotation {
//    
//    
//    if ([url.host isEqualToString:@"safepay"]) {
//        
//#warning 这里必须要支付宝签约成功绑定对应的应用才能回调该方法
//        [[AlipaySDK defaultService] processAuth_V2Result:url
//                                         standbyCallback:^(NSDictionary *resultDic) {
//                                             NSLog(@"result = %@",resultDic);
//                                             NSString *resultStr = resultDic[@"result"];
//                                         }];
//        
//    }else if ([url.host isEqualToString:@"pay"])
//    {
//        
//        // 1.获取沙盒里面的storyBoard
//        // 2.获取storyBoard中对应Identifier的Controller
////        GCOrderDetailView *DetailView = [[GCOrderDetailView alloc] init];
////        
////        GCOrderDetailViewController *payController =[GCOrderDetailViewController alloc];
//        // 3.把对应的代理方法传到Controller上
//        [WXApi handleOpenURL:url delegate:payController];
//    }
//    
//    return YES;
//}
////
////
//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
//{
//    // 1.获取沙盒里面的storyBoard
//    // 2.获取storyBoard中对应Identifier的Controller
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    GCOrderDetailViewController *payController =[storyBoard instantiateViewControllerWithIdentifier:@"PayController"];
//    // 3.把对应的代理方法传到Controller上
//    return [WXApi handleOpenURL:url delegate:payController];
//}
@end
