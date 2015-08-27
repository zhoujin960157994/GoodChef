//
//  GCAreaEntity.h
//  GoodChef
//
//  Created by Mac on 15-5-29.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"

@interface GCAreaEntity : GCParentModel
//城市区域的模型
/**
 *  城市ID
 */
@property (nonatomic,copy) NSString *cityId; //	:	1
/**
 *  区域id
 */
@property (nonatomic,copy) NSString *areaId; //	:	3
/**
 *  区域名称
 */
@property (nonatomic,copy) NSString *areaName; //	:	浦东新区

@end
