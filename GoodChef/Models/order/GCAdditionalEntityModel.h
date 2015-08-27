//
//  GCAdditionalEntityModel.h
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"

@interface GCAdditionalEntityModel : GCParentModel
//订单条件实体对象model
/**
 *  标题
 */
@property (nonatomic,copy) NSString *title;// 水果拼盘,
/**
 *  价格
 */
@property (nonatomic,copy) NSString *price;// 0,
/**
 *  有限时间
 */
@property (nonatomic,copy) NSString *limited;// 100,
/**
 *  图片路径
 */
@property (nonatomic,copy) NSString *imgUrl;// http://manage.chushi007.com/assets/images/3.0.0release/additional_1.png,
/**
 *  数量
 */
@property (nonatomic,copy) NSString *number;// 0

@end