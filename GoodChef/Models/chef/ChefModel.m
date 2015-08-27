//
//  ChefModel.m
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "ChefModel.h"
//厨师菜单model
#import "ChefMenuEntityModel.h"
//菜系模型
#import "GCCuisineEntityModel.h"

@implementation ChefModel

- (instancetype)init
{
    _ChefMenuEntity = [NSMutableArray array];
    _CuisineEntity = [NSMutableArray array];
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"ChefMenuEntity"]) {
        
        for (NSDictionary *menu in value) {
            ChefMenuEntityModel *menuModel = [[ChefMenuEntityModel alloc]init];
            
            [menuModel setValuesForKeysWithDictionary:menu];

            [_ChefMenuEntity addObject:menuModel];
        }

    }
    else if ([key isEqualToString:@"CuisineEntity"])
    {
        
        for (NSDictionary *Cuisine in value) {
            GCCuisineEntityModel *menuModel = [[GCCuisineEntityModel alloc]init];
            [menuModel setValuesForKeysWithDictionary:Cuisine];
            [_CuisineEntity addObject:menuModel];
        }
    
    }
    else
    {
        [super setValue:value forKey:key];
    }
}





@end
