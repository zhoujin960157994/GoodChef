//
//  GCCouponView.h
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentView.h"

@interface GCCouponView : GCParentView
/**
 *
 *描述 frame 是否要加载 tabView
 */
- (instancetype)initWithFrame:(CGRect)frame andHaveInfo:(BOOL)isHave;
/**
 *  tabview
 */
@property (nonatomic,strong) UITableView *tabView;
@end
