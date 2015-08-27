//
//  GCCityViewController.h
//  GoodChef
//
//  Created by Mac on 15-6-1.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentViewController.h"
typedef void(^Myblock)(id str);
@interface GCCityViewController : GCParentViewController
/**
 * block 传值
 */
@property (nonatomic,copy) Myblock sendValue;
/**
 *  城市传值
 */
@property (nonatomic,strong) NSString *cityName;
@end
