//
//  ChefMenuEntityModel.h
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"

@interface ChefMenuEntityModel : GCParentModel
//菜单的数据模型
/**
 *  食物类型
 */
@property (nonatomic,copy) NSString *foodType;// 1,
/**
 *  菜品名称
 */
@property (nonatomic,copy) NSString *foodName;//  香辣仔鸡,
/**
 *  
 */
@property (nonatomic,copy) NSString *cid;//  21,
/**
 *
 */
@property (nonatomic,copy) NSString *foodSummary;//  ,
/**
 *
 */
@property (nonatomic,copy) NSString *foodId;//  105,
/**
 *  菜品图链接
 */
@property (nonatomic,copy) NSString *foodPicUrl;//  /uploads/foodlog/2014-11-29/1417230320-2091142370.jpg,

@property (nonatomic,copy) NSString *isSpeciality;//  1,
@property (nonatomic,copy) NSString *orderN;// 37
@end
