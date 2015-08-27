//
//  GCOrderDetailView.h
//  GoodChef
//
//  Created by Mac on 15-5-30.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentView.h"
@class GCOrderEntityModel;

@interface GCOrderDetailView : GCParentView

/**
 *  重写 initWithFrame
 */
- (instancetype)initWithFrame:(CGRect)frame andDatamodel:(GCOrderEntityModel *)model;

@end
