//
//  GCOrderDetailViewController.m
//  GoodChef
//
//  Created by Mac on 15-5-30.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCOrderDetailViewController.h"
//view
#import "GCOrderDetailView.h"
//实体
#import "GCWechatOrder.h"
#import "GCAlipayOrder.h"

// 支付宝
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>



@interface GCOrderDetailViewController ()<UIActionSheetDelegate>
{
    enum WXScene _scene;
    //Token valid time
    long      token_time; // 令牌使用时间
}
@end

@implementation GCOrderDetailViewController


#pragma mark =================================一系列页面加载方法===================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"订单";
    
    //右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"付款" style:UIBarButtonItemStyleDone target:self action:@selector(PayOrder:)];
    
    GCOrderDetailView *orderDetail = [[GCOrderDetailView alloc] initWithFrame:self.view.bounds andDatamodel:self.orderModel];

    orderDetail.backgroundColor = [UIColor grayColor];

        //NSLog(@"%@",NSStringFromCGRect(orderDetail.frame));
    
    [self.view addSubview:orderDetail];
    
}

#pragma mark =================================一系列初始化方法===================================

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark =================================一系列数据请求方法===================================



#pragma mark =================================一系列事件响应方法===================================
#pragma mark 付款
- (void)PayOrder:(UIBarButtonItem *)sender
{

    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"付款方式" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"微信付款",@"支付宝", nil];
    
    
    [sheet showInView:self.view];


}



#pragma mark =================================一系列代理实现方法===================================
#pragma mark actionsheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    GCWechatOrder *product = [[GCWechatOrder alloc]init];
    product.productName = @"纯天然肥皂";
    product.productDescription = @"宿舍买3送1，基友必备~";
    product.productPrice = @"0.01";
    
    switch (buttonIndex) {
        case 0:
        {
            
        //微信支付
            [self useweixinpayToPay:product];
            NSLog(@"微信支付");
            
        
        }
            break;
        case 1:
        {
            //支付宝支付
            
            [self useAlipayToPay:product];
            NSLog(@"支付宝支付");
            
        }
            break;
        default:
            break;
    }



}
#pragma mark =================================一系列代理实现方法===================================

#pragma mark =================================一系列第三方实现方法===================================
#pragma 支付宝支付

/*
 1.支付宝商家后台里面的 partnerId （支付宝合作商家id）
 2.支付宝收款账号 seller （支付宝账号）
 3.获取后台生成的私钥 privateKey（私钥必须要给后台做，做完再给app用）
 
 */
-(void)useAlipayToPay:(GCWechatOrder *)product
{
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    GCAlipayOrder *order = [[GCAlipayOrder alloc] init];
    order.partner = KAlipayPartnerID;
    order.seller = KAlipaySellerAccount;
    order.productName = product.productName; //商品标题
    order.productDescription = product.productDescription; //商品描述
    order.amount = [NSString stringWithFormat:@"%.2f",[product.productPrice floatValue]]; //商品价格
    
#warning 通知我们的服务器后台的链接(问后台拿链接与订单号)
    order.notifyURL =  @"http://www.baidu.com"; //回调URL
    order.tradeNO = @"zdd987123456789112"; //订单ID（由后台服务器自行制定）
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1"; // 商品购物
    order.inputCharset = @"utf-8"; // 传输编码
    order.itBPay = @"30m";         // 半小时/30分钟
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"paydemouser";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(KAlipayPrivateKey);
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        /* 开始支付
         1.获取支付宝单例
         2.调用payOrder:fromScheme:方法
         3.支付成功或者失败均有回调
         */
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            // 9000 支付成功
            // 6001 支付取消
            // 4000 支付失败
            NSLog(@"reslut = %@",resultDic);
        }];
        
    }
}

//
// 微信支付
// 支付流程模拟实现，
// 注意:此demo只适合开发调试，参数配置和参数加密需要放到服务器端处理
// 服务器端Demo请查看包的文件
// 更新时间：2013年12月5日
//============================================================
#pragma 微信支付

- (void)useweixinpayToPay:(GCWechatOrder *)productOrder
{
    //创建支付签名对象
    payRequsestHandler *req = [payRequsestHandler alloc];
    //初始化支付签名对象
    [req init:KWechatAPPI_ID app_secret:KWechatAPP_SECRET partner_key:KWechatPARTNER_KEY app_key:KWechatAPP_KEY];
    
    //判断Token过期时间，10分钟内不重复获取,测试帐号多个使用，可能造成其他地方获取后不能用，需要即时获取
    time_t  now;
    time(&now);
    if ( (now - token_time) > 0 )//非测试帐号调试请启用该条件判断
    {
        //获取Token
        [req GetTokenWithTokenBlock:^(NSString *Token) {
            //设置Token有效期为10分钟
            token_time              = now + 600;
            if ( Token != nil)
            {
                //================================
                //预付单参数订单设置
                //================================
                NSMutableDictionary *packageParams = [NSMutableDictionary dictionary];
                [packageParams setObject: @"WX" forKey:@"bank_type"]; // 默认填写WX
                [packageParams setObject: productOrder.productName forKey:@"body"]; // 订单标题
                [packageParams setObject: @"1" forKey:@"fee_type"];   // 消费类型
                [packageParams setObject: @"UTF-8" forKey:@"input_charset"]; // 编码格式
#warning 服务器回调地址（问后台拿）
                [packageParams setObject: @"www.baidu.com" forKey:@"notify_url"];  // 商户服务器回调链接
                [packageParams setObject: [NSString stringWithFormat:@"%ld",time(0)] forKey:@"out_trade_no"]; // 商户订单号
                [packageParams setObject: KWechatPARTNER_ID forKey:@"partner"]; // 合作商家ID
                [packageParams setObject: @"196.168.1.11" forKey:@"spbill_create_ip"];   // 订单生成的iphone的IP
                [packageParams setObject:[NSString stringWithFormat:@"%.f",[productOrder.productPrice floatValue]*100] forKey:@"total_fee"];    //订单金额,单位（分）
                /* -------------- 一般情况下拼接的信息不变 --------------*/
                NSString *time_stamp, *nonce_str, *traceid;
                //获取package包
                NSString    *package = [req genPackage:packageParams];
                
                //输出debug info
                NSString *debug     = [req getDebugifo];
                NSLog(@"gen package: %@\n",package);
                NSLog(@"生成package: %@\n",debug);
                
                //设置支付参数
                time_stamp  = [NSString stringWithFormat:@"%ld", now];
                nonce_str	= [TenpayUtil md5:time_stamp];
                traceid		= @"mytestid_001";
                NSMutableDictionary *prePayParams = [NSMutableDictionary dictionary];
                [prePayParams setObject: KWechatAPPI_ID forKey:@"appid"];
                [prePayParams setObject: KWechatAPP_KEY forKey:@"appkey"];
                [prePayParams setObject: nonce_str forKey:@"noncestr"];
                [prePayParams setObject: package forKey:@"package"];
                [prePayParams setObject: time_stamp forKey:@"timestamp"];
                [prePayParams setObject: traceid forKey:@"traceid"];
                
                //生成支付签名
                NSString    *sign;
                sign		= [req createSHA1Sign:prePayParams];
                //增加非参与签名的额外参数
                [prePayParams setObject: @"sha1" forKey:@"sign_method"];
                [prePayParams setObject: sign forKey:@"app_signature"];
                
                //获取prepayId
                [req sendPrepay:prePayParams withPayIdBlock:^(id prePayid) {
                    if (![prePayid isKindOfClass:[NSString class]]) {
                        // 订单已被支付提示
                        NSLog(@"%@",prePayid[@"errmsg"]);
                    }else if ( prePayid != nil) {
                        //重新按提交格式组包，微信客户端5.0.3以前版本只支持package=Sign=***格式，须考虑升级后支持携带package具体参数的情况
                        //package       = [NSString stringWithFormat:@"Sign=%@",package];
                        NSString *package = @"Sign=WXPay";
                        //签名参数列表
                        NSMutableDictionary *signParams = [NSMutableDictionary dictionary];
                        [signParams setObject: KWechatAPPI_ID forKey:@"appid"];
                        [signParams setObject: KWechatAPP_KEY forKey:@"appkey"];
                        [signParams setObject: nonce_str forKey:@"noncestr"];
                        [signParams setObject: package forKey:@"package"];
                        [signParams setObject: KWechatPARTNER_ID forKey:@"partnerid"];
                        [signParams setObject: time_stamp forKey:@"timestamp"];
                        [signParams setObject: prePayid forKey:@"prepayid"];
                        
                        //生成签名
                        NSString    *sign  = [req createSHA1Sign:signParams];
                        
                        //调起微信支付
                        PayReq* req = [[PayReq alloc] init];
                        req.openID      = KWechatAPPI_ID;
                        req.partnerId   = KWechatPARTNER_ID;
                        req.prepayId    = prePayid;
                        req.nonceStr    = nonce_str;
                        req.timeStamp   = now;
                        req.package     = package;
                        req.sign        = sign;
                        
                        // 调用微信支付的sdk 接口
                        BOOL isWeixinExist = [WXApi safeSendReq:req];
                        if (!isWeixinExist) {
                            NSLog(@"请安装微信客户端");
                        }
                        
                    }else{
                        /*long errcode = [req getLasterrCode];
                         if ( errcode == 40001 )
                         {//Token实效，重新获取
                         Token                   = [req GetToken];
                         token_time              = now + 600;
                         NSLog(@"获取Token： %@\n",[req getDebugifo]);
                         };*/
                        NSLog(@"获取prepayid失败\n");
                    }
                }];
            }else{
                NSLog(@"获取Token失败\n");
            }
        }];
    }
}

// 微信支付返回结果后调用的方法
-(void)onResp:(BaseResp*)resp
{
    /*
     WXSuccess           = 0,   // 支付成功
     WXErrCodeCommon     = -1,  // 普通错误编码
     WXErrCodeUserCancel = -2,  // 用户取消
     WXErrCodeSentFail   = -3,  // 发送错误
     WXErrCodeAuthDeny   = -4,  // 没有权限
     WXErrCodeUnsupport  = -5,  // 不支持支付
     */
    NSString *strMsg = [NSString stringWithFormat:@"errcode:%d", resp.errCode];
    NSString *strTitle;
    
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        strTitle = [NSString stringWithFormat:@"发送媒体消息结果"];
    }
    if([resp isKindOfClass:[PayResp class]]){
        //支付返回结果，实际支付结果需要去微信服务器端查询
        strTitle = [NSString stringWithFormat:@"支付结果"];
        
        switch (resp.errCode) {
            case WXSuccess:
                strMsg = @"支付结果：成功！";
                NSLog(@"支付成功－PaySuccess，retcode = %d", resp.errCode);
                break;
                
            default:
                strMsg = [NSString stringWithFormat:@"支付结果：失败！retcode = %d, retstr = %@", resp.errCode,resp.errStr];
                NSLog(@"错误，retcode = %d, retstr = %@", resp.errCode,resp.errStr);
                break;
        }
    }
}



@end
