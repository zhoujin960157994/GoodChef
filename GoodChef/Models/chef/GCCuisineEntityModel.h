//
//  GCCuisineEntityModel.h
//  GoodChef
//
//  Created by Mac on 15-5-27.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"

@interface GCCuisineEntityModel : GCParentModel
//菜系的数据模型
/**
 *  菜系的ID
 */
@property (nonatomic,copy) NSString *cid; //24,
/**
 *  菜系名称
 */
@property (nonatomic,copy) NSString *title;// "粤菜"
@end
