//
//  GCUserModel.h
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"
#import "GCAddressEntityModel.h"

@interface GCUserModel : GCParentModel

/**
 *  用户信息model
 */
/**
*  密码
*/
@property (nonatomic,copy) NSString *password;// null,
/**
 *  手机
 */
@property (nonatomic,copy) NSString *phone;//  13507920648,
/**
 *  用户类型
 */
@property (nonatomic,copy) NSString *userType;//  0,
/**
 *  User用户ID
 */
@property (nonatomic,copy) NSString *userId;//  24758,
/**
 *  用户名称
 */
@property (nonatomic,copy) NSString *name;//  好厨师,
/**
 *  费用
 */
@property (nonatomic,copy) NSString *money;//  null,
/**
 *  订单状态
 */
@property (nonatomic,strong) GCAddressEntityModel  *AddressEntity;//  {
/**
 *  订单步骤改变状态
 */
@property (nonatomic,copy) NSString *orderChange;//  0,
/**
 *  
 */
@property (nonatomic,copy) NSString *countOrder;//  0,
@property (nonatomic,copy) NSString *countCoupon;// 0,
@property (nonatomic,copy) NSString *activityChange;// 0

@end
