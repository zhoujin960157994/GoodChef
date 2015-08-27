//
//  GCChefTableViewCell.h
//  GoodChef
//
//  Created by Mac on 15-5-31.
//  Copyright (c) 2015年 Mac. All rights reserved.
//
#import "ChefModel.h"
#import "Macros.h"
#import "Interface.h"
#import <UIKit/UIKit.h>


@interface GCChefTableViewCell : UITableViewCell

/**
 *  chefModel 数据模型
 */
@property (nonatomic,strong) ChefModel *chef;


@end
