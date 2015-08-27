//
//  GCIconEntity.h
//  GoodChef
//
//  Created by Mac on 15-5-29.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"

@interface BannerEntity : GCParentModel
//头部滚动图片模型
/**
 *  内容标题
 */
@property (nonatomic,copy) NSString *contentTitle;//	:	套餐
/**
 *  内容的链接
 */
@property (nonatomic,copy) NSString *contentUrl;//	:	http://www.chushi007.com/wechatOfficial/combo.php
/**
 *  头 的ID
 */
@property (nonatomic,copy) NSString *bannerId;//	:	1

/**
 *  图片的链接
 */
@property (nonatomic,copy) NSString *imgUrl;//	:http://manage.chushi007.com/assets/images/3.0.0release/banner1.jpg

@end
