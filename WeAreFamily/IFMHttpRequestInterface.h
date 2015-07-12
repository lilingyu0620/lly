//
//  IFMHttpRequestInterface.h
//  WeAreFamily
//
//  Created by lly on 15/6/5.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import "Pods/AFNetworking/AFNetworking/AFNetworking.h"

#ifndef WeAreFamily_IFMHttpRequestInterface_h
#define WeAreFamily_IFMHttpRequestInterface_h


@protocol FMHttpRequestInterface <NSObject>

/**
 *  获取当前网络状态
 *
 *  @return 返回当前网络状态
 */
-(AFNetworkReachabilityStatus)networkStatus;



/**
 *  Http通用接口
 *
 *  @param urlString        请求文件的地址
 *  @param headers          设置http的head
 *  @param data             设置http的post方式的body，如果该参数为空为Get方式请求，非空为Post方式请求
 *  @param timeoutInterval  设置http请求超时时间
 *  @param success          下载成功回调 requestHeaderDic: 请求头信息，responseHeaderDic: 响应头信息 requestUrl 请求的URL statusCode:网络请求返回码，responseObject: 返回数据
 *  @param failure          下载失败回调 requestHeaderDic: 请求头信息，responseHeaderDic: 响应头信息 statusCode:网络请求返回码，error: 返回错误描述
 *
 *  @return N/A
 */
- (void)FMHttpRequestWithUrlString:(NSString*)urlString
                           Headers:(NSDictionary*)headers
                          HttpData:(NSData*)data
                   TimeoutInterval:(NSTimeInterval)timeoutInterval
                    RequestSuccess:(void (^)(NSDictionary *requestHeaderDic, NSDictionary *responseHeaderDic, NSString *requestUrl, NSInteger statusCode, id responseObject))success
                    RequestFailure:(void (^)(NSDictionary *requestHeaderDic, NSDictionary *responseHeaderDic, NSInteger statusCode, NSError *error))failure;

/**
 *  Http下载重定向文件
 *
 *  @param urlString        请求文件的地址
 *  @param headers          设置http的head
 *  @param data             设置http的post方式的body，如果该参数为空为Get方式请求，非空为Post方式请求
 *  @param timeoutInterval  设置http请求超时时间
 *  @param success          下载成功回调 requestHeaderDic: 请求头信息，responseHeaderDic: 响应头信息 requestUrl 请求的URL statusCode:网络请求返回码，responseObject: 返回数据
 *  @param failure          下载失败回调 requestHeaderDic: 请求头信息，responseHeaderDic: 响应头信息 statusCode:网络请求返回码，error: 返回错误描述
 *
 *  @return N/A
 */
- (void)FMHttpWithRedirectRequestWithUrlString:(NSString*)urlString
                                       Headers:(NSDictionary*)headers
                                      HttpData:(NSData*)data
                               TimeoutInterval:(NSTimeInterval)timeoutInterval
                                RequestSuccess:(void (^)(NSDictionary *requestHeaderDic, NSDictionary *responseHeaderDic, NSString *requestUrl, NSInteger statusCode, id responseObject))success
                                RequestFailure:(void (^)(NSDictionary *requestHeaderDic, NSDictionary *responseHeaderDic, NSInteger statusCode, NSError *error))failure;




/**
 *  Get请求，解析json数据
 *
 *  @param url          请求URL
 *  @param successBlock 请求成功的回调
 *  @param failBlock    请求失败的回调
 */
-(void)GetJSONDataWithUrl:(NSString *)url successBlock:(void (^)(id  json))successBlock failBlock:(void (^)(id error))failBlock;



/**
 *  Get请求，解析xml数据
 *
 *  @param url          请求URL
 *  @param successBlock 请求成功回调
 *  @param failBlock    请求失败回调  
 */
-(void)GetXMLDataWithUrl:(NSString *)url successBlock:(void (^)(id xml))successBlock failBlock:(void (^)(id error))failBlock;



/**
 *  Post请求，请求数据为json格式
 *
 *  @param url          请求URL
 *  @param parameters   请求body
 *  @param successBlock 请求成功回调
 *  @param failBlock    请求失败回调
 */
-(void)PostJSONDataWithUrl:(NSString *)url parameters:(id)parameters successBlock:(void (^)(id resopnseObject))successBlock failBlock:(void (^)(id error))failBlock;























































@end

#endif
