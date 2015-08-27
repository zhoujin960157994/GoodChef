//
//  ZXRequestTool.h
//  QFPocketKitchen
//
//  Created by gorson on 4/20/15.
//  Copyright (c) 2015 1000phone. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^requestBlock)(id message);
@interface ZXRequestTool : NSObject

/**
 *  封装AFNetworking工具方法
 */
+(void)sendGetAFRequest:(NSString *)url withParameters:(NSDictionary *)parDic withSuccess:(requestBlock)successMessage andWithFail:(requestBlock)failMessage;

+(void)sendPostAFRequest:(NSString *)url withParameters:(NSDictionary *)parDic withSuccess:(requestBlock)successMessage andWithFail:(requestBlock)failMessage;
@end
