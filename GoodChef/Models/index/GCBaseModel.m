//
//  GCBaseModel.m
//  GoodChef
//
//  Created by Mac on 15-5-30.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCBaseModel.h"
//城市model
#import "GCCityEntity.h"
//菜系的model
#import "GCCuisineEntityModel.h"
//banner model
#import "BannerEntity.h"
//icon model
#import "GCIconEntityModel.h"

@implementation GCBaseModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _CityEntity = [[NSMutableArray alloc] init];
        _CuisineEntity = [[NSMutableArray alloc] init];
        
        _BannerEntity = [[NSMutableArray alloc] init];
        _IconEntity = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    
    if ([key isEqualToString:@"CityEntity"]) {
        for (NSDictionary *dict in value) {
            GCCityEntity *city  = [[GCCityEntity alloc] init];
            
            [city setValuesForKeysWithDictionary:dict];
        }

    }else if([key isEqualToString:@"CuisineEntity"]){
        for (NSDictionary *CuisineDict in value) {
            GCCuisineEntityModel *Cuisine  = [[GCCuisineEntityModel alloc] init];
            [Cuisine setValuesForKeysWithDictionary:CuisineDict];
        }
        
    
    }else if ([key isEqualToString:@"BannerEntity"]){
        for (NSDictionary *BannerDict in value) {
            BannerEntity *banner  = [[BannerEntity alloc] init];
            
            [banner setValuesForKeysWithDictionary:BannerDict];
        }
    
    }else if ([key isEqualToString:@"IconEntity"]){
        for (NSDictionary *iconDict in value) {
            GCIconEntityModel *icon  = [[GCIconEntityModel alloc] init];
            
            [icon setValuesForKeysWithDictionary:iconDict];

        }
        
    }else{
        [super setValue:value forKey:key];
    }
    



}


@end
