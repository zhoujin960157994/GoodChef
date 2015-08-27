//
//  GCParentView.m
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCParentView.h"
#import "AppDelegate.h"


@implementation GCParentView


#pragma mark 拼接字符创方法

- (NSString *)GetStart:(NSString *)start andMiddle:(NSString *)middle andEnd:(NSString *)end
{


    NSString *str = [NSString stringWithFormat:@"%@%@%@",start,middle,end];
    
    return str;



}

@end
