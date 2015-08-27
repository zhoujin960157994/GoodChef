//
//  GCOrderModel.m
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCOrderModel.h"
#import "GCAdditionalEntityModel.h"

@implementation GCOrderModel
- (instancetype)init
{
    _AdditionalEntityArr = [NSMutableArray array];
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"AdditionalEntity"]) {
        
        for (NSDictionary *add in value) {
            GCAdditionalEntityModel *addition = [[GCAdditionalEntityModel alloc]init];
            
            [addition setValuesForKeysWithDictionary:add];
            [_AdditionalEntityArr addObject:addition];
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}
@end
