//
//  GCWebViewController.h
//  GoodChef
//
//  Created by Mac on 15-5-27.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentViewController.h"

@interface GCWebViewController : GCParentViewController

//url点击对应的url
@property (nonatomic,copy) NSString *urlStr;
/**
 *  标题
 */
@property (nonatomic,copy) NSString *title;

@end
