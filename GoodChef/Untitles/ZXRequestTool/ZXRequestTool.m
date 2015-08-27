//
//  ZXRequestTool.m
//  QFPocketKitchen
//
//  Created by gorson on 4/20/15.
//  Copyright (c) 2015 1000phone. All rights reserved.
//

#import "ZXRequestTool.h"

@implementation ZXRequestTool

/**
 *  封装AFNetworking工具方法
 */
+(void)sendGetAFRequest:(NSString *)url withParameters:(NSDictionary *)parDic withSuccess:(requestBlock)successMessage andWithFail:(requestBlock)failMessage
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        调用成功的block
        if (successMessage) {
            successMessage(jsonDic);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        调用失败的block
        if (failMessage) {
            failMessage(error);
        }
        NSLog(@"失败");
    }];
}

/**
 *  封装AFNetworking工具方法
 */
+(void)sendPostAFRequest:(NSString *)url withParameters:(NSDictionary *)parDic withSuccess:(requestBlock)successMessage andWithFail:(requestBlock)failMessage
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"text/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"UTF-8" forHTTPHeaderField:@"charset"];
    
    [manager POST:url parameters:parDic success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
         //        调用成功的block
         if (successMessage) {
             successMessage(jsonDic);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         //        调用失败的block
         if (failMessage) {
             failMessage(error);
         }
         NSLog(@"失败");
     }];
}

@end
