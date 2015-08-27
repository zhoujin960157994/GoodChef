//
//  SubscribeView.h
//  GoodChef
//
//  Created by Mac on 15-5-31.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentView.h"

@interface GCSubscribeView : GCParentView

/**
 *  外部uiview
 */
@property (nonatomic,strong) UIView *content;

/**
 *  field
 */

@property (nonatomic,strong) UITextField *field;

//创建PIker
- (void)CreateDataPiker;


@end
