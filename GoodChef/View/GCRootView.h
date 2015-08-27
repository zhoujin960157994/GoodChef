//
//  GCRootView.h
//  GoodChef
//
//  Created by Mac on 15-5-27.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentView.h"

@interface GCRootView : GCParentView

/**
 *  头部scroll
 */
@property (nonatomic,strong) UIScrollView *scroll;
/**
 *  UIpageviewcontrol
 */
@property (nonatomic,strong) UIPageControl *page;
/**
 *  uibarbutton
 */
@property (nonatomic,strong) UIBarButtonItem *cityName;

/**
 *  cityImg
 */
@property (nonatomic,strong) UIBarButtonItem *cityImg;

/**
 *  城市选择按钮
 */
@property (nonatomic,strong) UIButton *city;
@end
