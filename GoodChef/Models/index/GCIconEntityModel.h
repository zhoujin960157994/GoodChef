//
//  GCIconEntityModel.h
//  GoodChef
//
//  Created by Mac on 15-5-30.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"

@interface GCIconEntityModel : GCParentModel

//icon 模型
/**
 *  icon 标题
 */
@property(nonatomic,copy) NSString *contentTitle;/// 套餐,
/**
 *  内容链接
 */
@property(nonatomic,copy) NSString *contentUrl;///: http://www.chushi007.com/wechatOfficial/combo.php,
/**
 *  icon 的Id
 */
@property(nonatomic,copy) NSString *iconId;/// 1,
/**
 *  icon 的URL
 */
@property(nonatomic,copy) NSString *iconUrl;///: http://manage.chushi007.com/assets/images/3.0.0release/icon1.png

@end
