//
//  GCCityEntity.m
//  GoodChef
//
//  Created by Mac on 15-5-29.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCCityEntity.h"
//区域模型
#import "GCAreaEntity.h"

@implementation GCCityEntity

- (instancetype)init
{

    self = [super init];
    
    if (self) {
        _AreaEntity = [[NSMutableArray alloc] init];
    }
    
    return self;
    

}

- (void)setValue:(id)value forKey:(NSString *)key
{
    
    if ([key isEqualToString:@"AreaEntity"]) {
        
        for (NSDictionary *areadict in value) {
            
            GCAreaEntity *area = [[GCAreaEntity alloc] init];
            [area setValuesForKeysWithDictionary:areadict];
       
        }


        
    }else{
    
        
        [super setValue:value forKey:key];
    
    }

}

@end
