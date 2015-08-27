//
//  GCBaseModel.h
//  GoodChef
//
//  Created by Mac on 15-5-30.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"
@class GCCityEntity;
@class GCCuisineEntityModel;
@class BannerEntity;

@interface GCBaseModel : GCParentModel

/**
 *  城市模型
 */
@property (nonatomic,strong) NSMutableArray *CityEntity;//		[4]
/**
 *  菜系模型
 */
@property (nonatomic,strong) NSMutableArray *CuisineEntity;//		[6]
/**
 *  首页滚动图片模型
 */
@property (nonatomic,strong) NSMutableArray *BannerEntity;//		[5]
/**
 *  首页图标模型
 */
@property (nonatomic,strong) NSMutableArray *IconEntity	;//	[3]
/**
 *  图片链接
 */
@property (nonatomic,copy) NSString *advertisingImgUrl;//	:
/**
 *  广告链接
 */
@property (nonatomic,copy) NSString *advertisingUrl;//	:

@property (nonatomic,copy) NSString *appVersion;//	:	3.0.0

@property (nonatomic,copy) NSString *servicePhone;//	:
@property (nonatomic,copy) NSString *code;//
@end
