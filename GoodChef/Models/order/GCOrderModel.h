//
//  GCOrderModel.h
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"

@interface GCOrderModel : GCParentModel
//订单首层model 信息
/**
 *  订单Id
 */
@property (nonatomic,strong) NSString  *orderId; //	07551432651363314
/**
 *  订单价格
 */
@property (nonatomic,strong) NSString  *orderPrice; //	79
/**
 *  条件实体对象
 */
@property (nonatomic,strong) NSMutableArray  *AdditionalEntityArr; //		[3]

@end
