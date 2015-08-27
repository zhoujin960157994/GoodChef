//
//  HttpRequestTool.h
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//
typedef void(^SuccessBlock)(id responseObject);
typedef void(^FailBlock)(id error);
#import <Foundation/Foundation.h>

@interface HttpRequestTool : NSObject
/**
 *  AF的get请求
 *
 *  @param urlString    网络连接
 *  @param parameters   字典类型
 *  @param successBlock 成功回调
 *  @param failBolck    失败回调
 */
+ (void)getRequestWithURL:(NSString *)urlString andParameter:(id)parameters whenSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBolck;


/**
 *  AF的post请求
 *
 *  @param urlString    网络连接
 *  @param parameters   字典类型
 *  @param successBlock 成功回调
 *  @param failBolck    失败回调
 */
+ (void)postRequestWithURL:(NSString *)urlString andParameter:(id)parameters whenSuccess:(SuccessBlock)successBlock orFail:(FailBlock)failBolck;
@end
