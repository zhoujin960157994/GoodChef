//
//  GCComboEntityModel.h
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"

@interface GCComboEntityModel : GCParentModel
/**
 *  订单信息 model
 */

/**
*  id
*/
@property (nonatomic,copy) NSString *comboId;//	:	1
/**
 *  订单类型名
 */
@property (nonatomic,copy) NSString *comboName;//	:	四菜一汤
/**
 *  就餐人数
 */
@property (nonatomic,copy) NSString *comboNum;//	:	4-6
/**
 *  价格
 */
@property (nonatomic,copy) NSString *comboPrice;//	:	79
/**
 *  类型
 */
@property (nonatomic,copy) NSString *combodescription;//	:	经济实惠

@end
