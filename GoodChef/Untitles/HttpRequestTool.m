//
//  HttpRequestTool.m
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "HttpRequestTool.h"
#import "AFNetworking.h"
#import "Interface.h"

@implementation HttpRequestTool

+(void)getRequestWithURL:(NSString *)urlString andParameter:(id)parameters whenSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBolck
{
    //
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //请求数据格式化
    manager.requestSerializer =  [AFHTTPRequestSerializer serializer];
    
    //返回数据格式化
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
     manager.securityPolicy.allowInvalidCertificates = YES;
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failBolck) {
            failBolck(error);
        }
    }];
    


}

+ (void)postRequestWithURL:(NSString *)urlString andParameter:(id)parameters whenSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBolck
{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //这里只是测试

    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 成功回调方法
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        NSLog(@"%@",dataDic);
        if (successBlock) {
            successBlock(dataDic);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // 失败回调方法
        if (failBolck) {
            failBolck(error);
        }
    }];
    
}

@end
