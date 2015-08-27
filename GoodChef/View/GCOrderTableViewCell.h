//
//  GCOrderTableViewCell.h
//  GoodChef
//
//  Created by Mac on 15-5-28.
//  Copyright (c) 2015年 Mac. All rights reserved.
//


#import <UIKit/UIKit.h>
@class GCOrderEntityModel;


typedef void(^ToBlock)(GCOrderEntityModel *model);
/**
 *  sender 按钮传值

 */
typedef void (^SendViewBlock)(id sender);

@interface GCOrderTableViewCell : UITableViewCell
/**
 *  订单ID
 */
@property (weak, nonatomic) IBOutlet UILabel *OrderId;
/**
 *  订单创建时间
 */
@property (weak, nonatomic) IBOutlet UILabel *orderTime;
/**
 *  订单类型
 */
@property (weak, nonatomic) IBOutlet UILabel *orderType;
/**
 *  价格
 */
@property (weak, nonatomic) IBOutlet UILabel *price;
/**
 *  厨师名称
 */
@property (weak, nonatomic) IBOutlet UILabel *chefName;
/**
 *  订单服务时间
 */
@property (weak, nonatomic) IBOutlet UILabel *serviceTime;
/**
 *  查看订单状态
 */
@property (weak, nonatomic) IBOutlet UIButton *scanOrderState;
/**
 *  订单详情
 */
@property (weak, nonatomic) IBOutlet UIButton *orderDetail;

/**
 *  刷新数据
 *
 *  @param model GCOrderEntityModel
 */
- (void)refreshData:(GCOrderEntityModel *)model;

/**
 *  myblock
 */
@property (nonatomic,copy) ToBlock MyBlock;
/**
 *  sendbllock
 */

@property (nonatomic,copy) SendViewBlock sendblock;
/**
 *  创建orderstatus
 */
- (void)CreateOrderStatus:(GCOrderEntityModel *)model andframe:(CGRect)frame;

@end
