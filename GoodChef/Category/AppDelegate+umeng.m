//
//  AppDelegate+umeng.m
//  GoodChef
//
//  Created by Mac on 15-5-29.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "AppDelegate+umeng.h"
// 友盟登录分享
#import "UMSocial.h"

#import "MobClick.h"

#import "UMSocialYixinHandler.h"
#import "UMSocialFacebookHandler.h"
//#import "UMSocialLaiwangHandler.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialTwitterHandler.h"
#import "UMSocialQQHandler.h"
//#import "UMSocialSinaHandler.h"
#import "UMSocialSinaSSOHandler.h"
//#import "UMSocialTencentWeiboHandler.h"
#import "UMSocialRenrenHandler.h"

#import "UMSocialInstagramHandler.h"
#import "UMSocialWhatsappHandler.h"
#import "UMSocialLineHandler.h"
#import "UMSocialTumblrHandler.h"

//导入接口
#import "Macros.h"
//推送
#import "UMessage.h"

@implementation AppDelegate (umeng)

- (void)umengRegistSetting
{
    //设置友盟社会化组件appkey
    [UMSocialData setAppKey:UmengAppkey];
    
    //打开调试log的开关
    [UMSocialData openLog:YES];
    
    //如果你要支持不同的屏幕方向，需要这样设置，否则在iPhone只支持一个竖屏方向
    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskAll];
    
   
//    //支持微信分享
    [UMSocialWechatHandler setWXAppId:@"wx443f14a41e6a5aee" appSecret:@"efdae6d9ae304b5227c2ffa8ca4a7be3" url:@"http://www.umeng.com/social"];
    
    
    //打开腾讯微博SSO开关，设置回调地址，只支持32位
    //    [UMSocialTencentWeiboHandler openSSOWithRedirectUrl:@"http://sns.whalecloud.com/tencent2/callback"];
    
   
    //    //设置支持没有客户端情况下使用SSO授权
    [UMSocialQQHandler setSupportWebView:YES];
    

    

    
  
}

/**
 *  友盟统计设置
 */
- (void)umengStatisticalSetting
{
#warning 运行日志及奔溃报告
    [MobClick setCrashReportEnabled:NO]; // 如果不需要捕捉异常，注释掉此行
    [MobClick setLogEnabled:YES];  // 打开友盟sdk调试，注意Release发布时需要注释掉此行,减少io消耗
#warning 获取应用版本
    [MobClick setAppVersion:XcodeAppVersion]; //参数为NSString * 类型,自定义app版本信息，如果不设置，默认从CFBundleVersion里取
    
#warning 在应用中注册友盟开发sdk
    /*
     *  @param reportPolicy为枚举类型,可以为 REALTIME, BATCH,SENDDAILY,SENDWIFIONLY
     *  @param channelId 为NSString * 类型，channelId 为nil或@""时,默认会被被当作@"AppStore"渠道
     *
     */
    [MobClick startWithAppkey:UmengAppkey reportPolicy:(ReportPolicy) REALTIME channelId:nil];
    
#warning 在应用更新触发方法
    //    [MobClick checkUpdate];   //自动更新检查, 如果需要自定义更新请使用下面的方法,需要接收一个(NSDictionary *)appInfo的参数
    [MobClick checkUpdateWithDelegate:self selector:@selector(updateMethod:)];
    
#warning 在线参数配置
    [MobClick updateOnlineConfig];  //在线参数配置
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onlineConfigCallBack:) name:UMOnlineConfigDidFinishedNotification object:nil];
}

// 在线配置的回调
- (void)onlineConfigCallBack:(NSNotification *)note {
    
    NSLog(@"online config has fininshed and note = %@", note.userInfo);
}

// 调用更新方法
- (void)updateMethod:(NSDictionary *)appInfo {
    NSLog(@"update info %@",appInfo);
}

#pragma mark - ================  系统方法 ==============
/**
 *  远程推送设置
 */
- (void)umengRemoteNotificationSetting:(id)launchOptions
{
    //set AppKey and LaunchOptions
    [UMessage startWithAppkey:UmengAppkey launchOptions:launchOptions];
    
    // 如果IOS8的话，注册设置
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= _IPHONE80_
    if(UMSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
    {
        //register remoteNotification types
        UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
        action1.identifier = @"action1_identifier";
        action1.title=@"Accept";
        action1.activationMode = UIUserNotificationActivationModeForeground;//当点击的时候启动程序
        
        UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];  //第二按钮
        action2.identifier = @"action2_identifier";
        action2.title=@"Reject";
        action2.activationMode = UIUserNotificationActivationModeBackground;//当点击的时候不启动程序，在后台处理
        action2.authenticationRequired = YES;//需要解锁才能处理，如果action.activationMode = UIUserNotificationActivationModeForeground;则这个属性被忽略；
        action2.destructive = YES;
        
        UIMutableUserNotificationCategory *categorys = [[UIMutableUserNotificationCategory alloc] init];
        categorys.identifier = @"category1";//这组动作的唯一标示
        [categorys setActions:@[action1,action2] forContext:(UIUserNotificationActionContextDefault)];
        
        UIUserNotificationSettings *userSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert
                                                                                     categories:[NSSet setWithObject:categorys]];
        [UMessage registerRemoteNotificationAndUserNotificationSettings:userSettings];
        
    } else{
        //register remoteNotification types
        [UMessage registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge
         |UIRemoteNotificationTypeSound
         |UIRemoteNotificationTypeAlert];
    }
#else
    
    //register remoteNotification types
    [UMessage registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge
     |UIRemoteNotificationTypeSound
     |UIRemoteNotificationTypeAlert];
    
#endif
    
    //for log
    [UMessage setLogEnabled:YES];
}

/**
 *  获取设备token的方法
 *
 *  @param application
 *  @param deviceToken
 */
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [UMessage registerDeviceToken:deviceToken];
    
}

/**
 *  接收到远程推送时触发的方法
 *
 *  @param application
 *  @param userInfo    推送信息json字符串
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //关闭友盟自带的弹出框
    //    [UMessage setAutoAlert:NO];
    
    [UMessage didReceiveRemoteNotification:userInfo];
    
    //    self.userInfo = userInfo;
    //    //定制自定的的弹出框
    //    if([UIApplication sharedApplication].applicationState == UIApplicationStateActive)
    //    {
    //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"标题"
    //                                                            message:@"Test On ApplicationStateActive"
    //                                                           delegate:self
    //                                                  cancelButtonTitle:@"确定"
    //                                                  otherButtonTitles:nil];
    //
    //        [alertView show];
    //
    //    }
}
#pragma mark 微信调用
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [UMSocialSnsService handleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url];
}
@end
