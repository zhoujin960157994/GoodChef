//
//  Interface.h
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#ifndef GoodChef_Interface_h
#define GoodChef_Interface_h


#pragma mark ===========================首页接口数据===================================
//1. 首页接口文档



//域名
#define GCWWWHOST @"http://www.chushi007.com"
#define GCHOST @"http://manage.chushi007.com"


//最基础请求类
#define BASEQUEST GCHOST@"/api/App300/BaseQuest"

//首页滚动图片 -4张，然后 %d -- 1234
#define SCROLLIMG GCHOST@"/assets/images/3.0.0release/banner%d.jpg"

//滚动的
#define ICON1 GCHOST@"/api/App300/AppointmentOrder"
//参数 : userId	24758
#define ICON4 @"http://www.chushi007.com/wechatOfficial/private_insurance.html"

//	左边图片数据来源--http://manage.chushi007.com/assets/images/3.0.0release/icon1/2/3/4.png

#define PCHOST @"http://www.chushi007.com/wechatOfficial"

//预约厨师-本地图片(appointmentBtn@2x) requeest userId=24758 数据Url =
//http://manage.chushi007.com/api/App300/AppointmentOrder -与top icon1的1
//会员服务-本地图片(vipBtn@2x) requeest userId=24758 数据Url =http://manage.chushi007.com/api/App300/AppointmentOrder 链接到top-1的第三张图片
//套餐---接口链接
#define TAOCAN  PCHOST@"/combo.php"
//尝鲜---尝鲜接口链接
#define TASTE PCHOST@"/taste.php"
#define TCHUOTUI  PCHOST@"/taste_detail_huotui.php"
//尝鲜-detai2-接口
#define TCNIU  PCHOST@"/taste_detail_niu.php"
//尝鲜-detai3-接口
#define TCQINGKOU  PCHOST@"/taste_detail_qingkou.php"
//服务保障
#define SERVICE PCHOST@"/service_ensure.php"


#pragma mark ======================厨师信息接口=========================================
//1.厨师首页：


#define CHEFINDEX @"http://manage.chushi007.com/api/App300/GetChefList"
//参数：
//areaId	0
//chefName
//chefType	0
//cityId	58
//isMyChef	0
//orderTime	0
//page	1
//userId	24758
//2.厨师搜索
//厨师搜索接口
//chefName	陈 //如果这里没有参数是，默认是显示全部
//厨师筛选接口
//chefType	0
//cityId	58
//orderTime	0
//3.点击厨师，或者厨师对应的菜品
#define COMMENT @"http://manage.chushi007.com/api/App300/ChefComment"
//请求URL:http://manage.chushi007.com/api/App300/ChefComment
//参数：
//chefId	454
//page	1

//4.点击收藏该厨师
#define FAVORCHEF @"http://manage.chushi007.com/api/App300/FavorChef"

//chefId	454
//isFavor	0
//userId	24758
#pragma mark 菜单
//1.家常菜
#define MENU @"http://manage.chushi007.com/api/App300/GetMenu"
//参数:
//chefId	454
//cid	23
//page	1 //当刷新数据时候，修改Page参数
//3.厨师配菜
//这一步，是预约厨师，要求用户输入相关信息
//然后提交订单，会有请求：
#define SUBMITORDER  @"http://manage.chushi007.com/api/App300/SubmitOrder"
//参数：一般是用户填写的信息和用户购买订单信息
//chefId	459
//chooseFoodType	2
//cityId	58
//cuisineId	21
//greensIdStr	19;20;37
//isFood	0
//orderNote	快点素食主义麻辣厨师要经验丰富的
//orderTime	2015-05-26 12:00:00
//packageId	1
//uaid	13004
//userId	24758

//4.支付
#define PAYORDER @"http://manage.chushi007.com/api/App300/PayOrder"
//参数：
//additional_1
//additional_2
//additional_3	万柏厨房清洁剂
//couponCode	0
//customerIp	192.168.2.2
//orderId	07551432556711154
//payType	A //表示是aliPay 支付宝
//payType	W //微信支付
//userId	24758




#pragma mark ======================订单信息接口========================================

//订单接口
#define USERORDERLIST @"http://manage.chushi007.com/api/App300/GetOrderList"
//参数:
//page	1
//userId	24758


#pragma mark =====================我的接口数据=========================================


//1.登陆信息


#define GetVerificationCode @"http://manage.chushi007.com/api/App300/GetVerificationCode"
//参数  phone	13507920648

#define USERLOGIN @"http://manage.chushi007.com/api/App300/UserLogin"
//参数 userId= 24758

#define USERINFO @"http://manage.chushi007.com/api/App300/GetUserEntityByUserId"
//参数 userId= 24758


//3.我的厨师
#define MYCHEF @"http://manage.chushi007.com/api/App300/GetChefList"
//请求Url : http://manage.chushi007.com/api/App300/GetChefList
//参数列表
//areaId	0	//区域Id
//chefName	//厨师名称
//chefType	//厨师类型
//cityId	1 //城市Id
//isMyChef	1 //是我的厨师
//orderTime	 //订单时间
//page	1 //页数
//userId	24758 //用户ID
//4.得知自己的现金券信息
#define MYCOUPONL @"http://manage.chushi007.com/api/App300/GetCouponlList"
//请求Url:http://manage.chushi007.com/api/App300/GetCouponlList
//参数：
//userId	24758


//6.活动中心
#define ACTIVECENTER @"http://manage.chushi007.com/api/App300/GetActivityList"
//参数:userId	24758

//7.我的评论
#define MYCOMMENT @"http://manage.chushi007.com/api/App300/MyComment"
//请求URL: http://manage.chushi007.com/api/App300/MyComment
//参数:
//page	1
//userId	24758

//8.1. 地址管理
#define MYADDRESS @"http://manage.chushi007.com/api/App300/GetAddr"
//URL： http://manage.chushi007.com/api/App300/GetAddr
//参数: userId	24758
//8.3: 意见反馈
#define FEEDBACK @"http://manage.chushi007.com/api/App300/UserFeedback"
//UrL: http://manage.chushi007.com/api/App300/UserFeedback
//参数: content	蛮好的 --这是用户输入的
//userId	24758
//添加地址信息
#define ADDADDRESS @"http://manage.chushi007.com/api/App300/AddAddr"
//参数
//address	上海路228号
//areaId	3
//cityId	1
//name	小姑
//phone	13688253624
//userId	24758

#endif
