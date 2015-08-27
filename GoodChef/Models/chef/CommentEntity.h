//
//  CommentEntity.h
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"

@interface CommentEntity : GCParentModel

//这是评论数据的模型
/**
 *  用户评论者名称
 */
@property (nonatomic,strong) NSString *userName; // 王,
/**
 *  订单ID
 */
@property (nonatomic,strong) NSString *orderId; // 07551432513687678,
/**
 *  手机
 */
@property (nonatomic,strong) NSString *phone; // 137*******00,
/**
 *  评分
 */
@property (nonatomic,strong) NSString *score; // 5,
/**
 *  资源
 */
@property (nonatomic,strong) NSMutableArray *source; // [],
/**
 *  内容
 */
@property (nonatomic,strong) NSString *content; // 不错，味道很好，家人喜欢,
/**
 *  评论时间
 */
@property (nonatomic,strong) NSString *commentTime; // 2015-05-25 13:18:33,
/**
 *  是否是VIP
 */
@property (nonatomic,strong) NSString *isVip; // 1
@end
