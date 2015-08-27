//
//  AppDelegate+umeng.h
//  GoodChef
//
//  Created by Mac on 15-5-29.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (umeng)


/**
 *  友盟的SDK注册设置
 */
- (void)umengRegistSetting;

/**
 *  友盟推送设置
 */
- (void)umengRemoteNotificationSetting:(id)launchOptions;

/**
 *  友盟统计设置
 */
- (void)umengStatisticalSetting;
@end
