//
//  FMHttpRequestManager.m
//  WeAreFamily
//
//  Created by lly on 15/6/5.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import "FMHttpRequestManager.h"
#import "Pods/AFNetworking/AFNetworking/AFNetworking.h"

@interface FMHttpRequestManager()



@end


@implementation FMHttpRequestManager

static FMHttpRequestManager *shareInstance = nil;

+(instancetype)shareInstance{

    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        shareInstance = [[FMHttpRequestManager alloc]init];
    });
    
    return shareInstance;
}

#pragma mark -
#pragma mark - 获取网络状态
-(AFNetworkReachabilityStatus)networkStatus{

    __block AFNetworkReachabilityStatus networkStatus;
    
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        networkStatus = status;
    }];
    return networkStatus;
}


#pragma mark -
#pragma mark - Http通用接口
-(void)FMHttpRequestWithUrlString:(NSString *)urlString
                          Headers:(NSDictionary *)headers
                         HttpData:(NSData *)data
                  TimeoutInterval:(NSTimeInterval)timeoutInterval
                   RequestSuccess:(void (^)(NSDictionary *, NSDictionary *, NSString *, NSInteger, id))success RequestFailure:(void (^)(NSDictionary *, NSDictionary *, NSInteger, NSError *))failure{

    NSURL *url = [NSURL URLWithString:urlString];
    if (url == NULL) {
        FMLog("HTTPRequest parameter error: url is nil!!!");
    }
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:timeoutInterval];
    for (NSString*key in headers.allKeys)
    {
        [request addValue:[headers objectForKey:key] forHTTPHeaderField:key];
    }
    
    if (data)
    {
        [request setHTTPBody:data];
        [request setHTTPMethod:@"POST"];
    }
    
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success)
        {
            if (self.queue)
            {
                success(operation.request.allHTTPHeaderFields, operation.response.allHeaderFields, [operation.request.URL absoluteString], operation.response.statusCode, responseObject);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure)
        {
            if (self.queue)
            {
                failure(operation.request.allHTTPHeaderFields, operation.response.allHeaderFields, operation.response.statusCode, error);
            }
        }
    }];
    
    [self.queue addOperation:requestOperation];
}


#pragma mark -
#pragma mark - Http下载重定向文件
-(void)FMHttpWithRedirectRequestWithUrlString:(NSString *)urlString
                                      Headers:(NSDictionary *)headers
                                     HttpData:(NSData *)data
                              TimeoutInterval:(NSTimeInterval)timeoutInterval
                               RequestSuccess:(void (^)(NSDictionary *, NSDictionary *, NSString *, NSInteger, id))success RequestFailure:(void (^)(NSDictionary *, NSDictionary *, NSInteger, NSError *))failure{

    NSURL *url = [NSURL URLWithString:urlString];
    if (url == NULL) {
        FMLog("HTTPRequest parameter error: url is nil!!!");
    }
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:timeoutInterval];
    for (NSString*key in headers.allKeys)
    {
        [request addValue:[headers objectForKey:key] forHTTPHeaderField:key];
    }
    
    if (data)
    {
        [request setHTTPBody:data];
        [request setHTTPMethod:@"POST"];
    }
    
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success)
        {
            if (self.queue)
            {
                success(operation.request.allHTTPHeaderFields, operation.response.allHeaderFields, [operation.request.URL absoluteString], operation.response.statusCode, responseObject);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure)
        {
            if (self.queue)
            {
                failure(operation.request.allHTTPHeaderFields, operation.response.allHeaderFields, operation.response.statusCode, error);
            }
        }
    }];
    
    [requestOperation setRedirectResponseBlock:^NSURLRequest *(NSURLConnection *connection, NSURLRequest *request, NSURLResponse *redirectResponse) {
        if (redirectResponse)
        {
            return nil;
        }
        
        return request;
    }];
    
    [self.queue addOperation:requestOperation];

}


- (void)cancelAllRequest
{
    for (AFHTTPRequestOperation *operation in [self.queue operations])
    {
        [operation cancel];
    }
    
    [super cancelAllRequest];
}

- (void)distoryAllRequest
{
    for (AFHTTPRequestOperation *operation in [self.queue operations])
    {
        [operation cancel];
    }
    
    [super distoryAllRequest];
}



#pragma mark - 
#pragma mark - Get方式请求json数据
-(void)GetJSONDataWithUrl:(NSString *)url successBlock:(void (^)(id))successBlock failBlock:(void (^)(id))failBlock{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSDictionary *dict = @{@"format":@"json"};
    //网络访问是异步的，回调在主线程
    [manager GET:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failBlock) {
            failBlock(error);
        }
    }];
}

#pragma mark Get方式请求xml数据
-(void)GetXMLDataWithUrl:(NSString *)url successBlock:(void (^)(id))successBlock failBlock:(void (^)(id))failBlock{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    NSDictionary *dict = @{@"format":@"xml"};
    
    //网络访问是异步的，回调在主线程
    [manager GET:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failBlock) {
            failBlock(error);
        }
    }];
}


#pragma mark -
#pragma mark - Post方式请求 body数据为json类型。
-(void)PostJSONDataWithUrl:(NSString *)url parameters:(id)parameters successBlock:(void (^)(id))successBlock failBlock:(void (^)(id))failBlock{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];//请求数据格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//返回数据格式
    
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failBlock) {
            failBlock(error);
        }
    }];

}


































































@end
