//
//  GCOrderEntityModel.m
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCOrderEntityModel.h"
//菜品model
#import "GCComboEntityModel.h"
//用户地址model
#import "GCAddressEntityModel.h"
//菜系
#import "GCCuisineEntityModel.h"
//厨师模型
#import "ChefModel.h"

/**
 导入 订单信息 model
 */
#import "GCComboEntityModel.h"

@implementation GCOrderEntityModel

- (instancetype)init
{
    _greensName = [NSMutableArray array];
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"ComboEntity"]) {
        
        GCComboEntityModel *combo = [[GCComboEntityModel alloc] init];
        
        [combo setValuesForKeysWithDictionary:value];
        
        self.ComboEntity = combo;

    }else if ([key isEqualToString:@"ChefEntity"]){
        
        ChefModel *chef = [[ChefModel alloc] init];
        
        [chef setValuesForKeysWithDictionary:value];
        
        self.ChefEntity = chef;

    }else if ([key isEqualToString:@"AddressEntity"]){
        
        GCAddressEntityModel *address = [[GCAddressEntityModel alloc] init];
        [address setValuesForKeysWithDictionary:value];
        
        self.AddressEntity = address;

    }else if ([key isEqualToString:@"greensName"]){
        
        _greensName = value;
    
    }else{
        [super setValue:value forKey:key];
    }
}

- (NSString *)description
{
    
    return [NSString stringWithFormat:@"%@",self.orderPrice];



}

@end
