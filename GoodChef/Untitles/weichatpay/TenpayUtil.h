

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
typedef void (^requestBlock)(id respond);
@interface TenpayUtil :NSObject
{
}
/*
 加密实现MD5和SHA1
 */
+(NSString *) md5:(NSString *)str;
+(NSString*) sha1:(NSString *)str;
/**
 实现http GET/POST 解析返回的json数据
 */
+(void) httpSendJson:(NSString *)url method:(NSString *)method data:(NSString *)data withSucceessBlock:(requestBlock)successMessage;
//tojson 将集合的数据转换成json字符串
+(NSString *) toJson:(NSDictionary *)params;
@end