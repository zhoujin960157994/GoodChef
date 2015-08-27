//
//  GCAddressTableViewCell.h
//  GoodChef
//
//  Created by Mac on 15-6-2.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GCAddressEntityModel;

@interface GCAddressTableViewCell : UITableViewCell


/**
 *  addressModel
 */
@property (nonatomic,strong) GCAddressEntityModel *addressModel;

@end
