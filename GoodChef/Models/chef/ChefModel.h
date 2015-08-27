//
//  ChefModel.h
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"
#import "GCCuisineEntityModel.h"

@interface ChefModel : GCParentModel

//这是厨师的数据模型
/**
 *  厨师ID
 */
@property (nonatomic,copy) NSString *chefId; //: 454,
/**
 *  厨师姓名
 */
@property (nonatomic,copy) NSString *chefName; //: 蔡文辉,
/**
 *  身份证ID
 */
@property (nonatomic,copy) NSString *securityIDCode; //: 460************311,
/**
 *  厨师图片的url
 */
@property (nonatomic,copy) NSString *chefUrl; //: /uploads/cheflog/2015-04-28/1430206212-938053714.jpg,
/**
 *  服务时间
 */
@property (nonatomic,copy) NSString *serviceTime; //: 周末全天,
/**
 * 级别
 */
@property (nonatomic,copy) NSString *rankName; //: 国家一级,
/**
 *  分数
 */
@property (nonatomic,copy) NSString *score; //: 5,
/**
 *  赞成
 */
@property (nonatomic,copy) NSString *approve; //: 1,
/**
 * 储备数量
 */
@property (nonatomic,copy) NSString *reserveNum; //: 22,
/**
 *  菜系数组
 */
@property (nonatomic,strong) NSMutableArray *CuisineEntity; //: [],
/**
 *  服务区域
 */
@property (nonatomic,copy) NSString *serviceArea; //: 福田区、罗湖区、南山区、宝安区、龙岗区,
/**
 * 评论总数
 */
@property (nonatomic,copy) NSString *commentItemCount; //: 1,
/**
 *  厨师菜单
 */
@property (nonatomic,copy) NSMutableArray *ChefMenuEntity; //: [],
/**
 *  是否喜爱
 */
@property (nonatomic,copy) NSString *isFavor; //: 0

@end
