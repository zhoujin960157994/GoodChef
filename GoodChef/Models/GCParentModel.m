//
//  GCParentModel.m
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentModel.h"
#import "AFNetworking.h"

@implementation GCParentModel

/**
 *  KVC使用注意
 *  1.如果后台字段给你的是系统关键字，需要转换成一个非关键字
 *  2.如果后台给你的字段比你自己的实体字段多，需要重写undefineKey：方法
 *  3.如果后台给你的字段是NSNumber类型，需要做判断
 */

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

     NSLog(@"%@类缺少%@字段",NSStringFromClass(self.class),key);

}
/** xcode plug
 *
 * 3.如果后台给你的字段是NSNumber类型，需要做判断
 */
- (void)setValue:(id)value forKey:(NSString *)key
{
    
    // [value isKindOfClass:[NSNumber class]]
    // 这种判断既是策略模式，又是OC的运行时反射机制
    if ([value isKindOfClass:[NSNumber class]]) {
        NSNumberFormatter *format = [[NSNumberFormatter alloc]init];
        value = [format stringFromNumber:value];
    }
    [super setValue:value forKey:key];

}

@end
