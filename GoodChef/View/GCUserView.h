//
//  GCUserView.h
//  GoodChef
//
//  Created by Mac on 15-5-28.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentView.h"

@interface GCUserView : GCParentView

//tableview
@property (nonatomic,strong) UITableView *tabView;

/**
 *  底部的uiview
 */
@property (nonatomic,strong) UIView *bottom;

@end
