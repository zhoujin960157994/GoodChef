//
//  GCOrderEntityModel.h
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"
#import "ChefMenuEntityModel.h"
#import "ChefModel.h"
#import "GCAddressEntityModel.h"
#import "GCComboEntityModel.h"

@interface GCOrderEntityModel :  GCParentModel
/**
 * 订单ID
 */
@property (nonatomic,copy) NSString *orderId; // 07551432651363149,
/**
 *  订单状态
 */
@property (nonatomic,copy) NSString *orderStatus; // 0,
/**
 *  订单价格
 */

@property (nonatomic,copy) NSString *orderPrice; // 79,
/**
 *  付款类型
 */

@property (nonatomic,copy) NSString *payType; // W,
/**
 *  是食材
 */

@property (nonatomic,copy) NSString *isFood; // 0,
/**
 *  选择食材类型
 */
@property (nonatomic,copy) NSString *chooseFoodType; // 2,
/**
 *  订单信息model
 */
@property (nonatomic,strong) GCComboEntityModel *ComboEntity; // {},
/**
 *  厨师Model
 */
@property (nonatomic,strong) ChefModel *ChefEntity; // {},
/**
 *  地址model
 */
@property (nonatomic,strong) GCAddressEntityModel *AddressEntity; // {},
/**
 *  创建时间
 */
@property (nonatomic,copy) NSString *createTime; // 2015-05-26 22; //42; //43,
/**
 *  服务时间
 */
@property (nonatomic,copy) NSString *orderTime; // 2015-05-27 12; //00; //00,
/**
 *  订单菜谱
 */
@property (nonatomic,strong) NSMutableArray *greensName; // [],
/**
 *  是否评论
 */
@property (nonatomic,copy) NSString *isComment; // 0,

@property (nonatomic,copy) NSString *additional_1; // ,
@property (nonatomic,copy) NSString *additional_2; // ,
@property (nonatomic,copy) NSString *additional_3; // 
@end
