
#import <Foundation/Foundation.h>
#import "TenpayUtil.h"
#import "ZXRequestTool.h"
/*
 加密实现MD5和SHA1
 */
@implementation TenpayUtil

//md5 encode
+(NSString *) md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02X", digest[i]];
    
    return output;
}
//sha1 encode
+(NSString*) sha1:(NSString *)str
{
    const char *cstr = [str cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:str.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}
//http 请求解析返回json
+(void) httpSendJson:(NSString *)url method:(NSString *)method data:(NSString *)data withSucceessBlock:(requestBlock)successMessage
{
    if ([method isEqualToString:@"GET"])
    {
        NSDictionary *jsonDic = [TenpayUtil toDictionary:data];
        [ZXRequestTool sendGetAFRequest:url withParameters:jsonDic withSuccess:^(id message) {
            successMessage(message);
        } andWithFail:^(id message) {
            NSLog(@"网络异常，请检查网络~");
            
        }];
    }else if ([method isEqualToString:@"POST"])
    {
        NSDictionary *jsonDic = [TenpayUtil toDictionary:data];
        [ZXRequestTool sendPostAFRequest:url withParameters:jsonDic withSuccess:^(id message) {
            successMessage(message);
        } andWithFail:^(id message) {
            NSLog(@"网络异常，请检查网络~");
            
        }];
    }
    
}
//tojson 将集合的数据转换成json字符串
+(NSString *) toJson:(NSDictionary *)params
{
    NSError *error = nil;
    //ios5.0 自带的NSJSONSerialization序列化
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

//toDictionary 将json字符串数据转换成Dictionary字典
+(NSDictionary *) toDictionary:(NSString *)json
{
    NSError *error = nil;
    //ios5.0 自带的NSJSONSerialization序列化
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    return jsonDic;
}
@end