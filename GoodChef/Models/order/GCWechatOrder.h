//
//  GCOrderProduct.h
//  GoodChef
//
//  Created by Mac on 15-6-4.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"

@interface GCWechatOrder : GCParentModel
@property(nonatomic, copy) NSString * productPrice; // 价格
@property(nonatomic, copy) NSString * productName;  // 产品名字
@property(nonatomic, copy) NSString * productDescription; // 产品描述
@end
