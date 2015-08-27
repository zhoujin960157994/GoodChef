//
//  GCAddressEntityModel.h
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"

@interface GCAddressEntityModel : GCParentModel
//地址信息模型

/**
 *  城市ID
 */
@property (nonatomic,copy) NSString *cityId; //	58
/**
 *  区域ID
 */
@property (nonatomic,copy) NSString *areaId; //	61
/**
 *  地址
 */
@property (nonatomic,copy) NSString *address; //	:	南山大道2009-2号
/**
 *  手机
 */
@property (nonatomic,copy) NSString *phone; //	13507920648
/**
 *  用户名
 */
@property (nonatomic,copy) NSString *name; //	老李

@property (nonatomic,copy) NSString *uaid; //

@end
