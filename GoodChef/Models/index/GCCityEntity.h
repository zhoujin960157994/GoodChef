//
//  GCCityEntity.h
//  GoodChef
//
//  Created by Mac on 15-5-29.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"

@interface GCCityEntity : GCParentModel
//城市信息
/**
 *  城市Id
 */
@property (nonatomic,copy) NSString *cityId; //	:	1
/**
 *  城市名
 */
@property (nonatomic,copy) NSString *cityName; //	:	上海市
/**
 *  区域模型数组
 */
@property (nonatomic,copy) NSMutableArray *AreaEntity; //		[15]


@end
