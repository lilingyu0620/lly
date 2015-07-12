//
//  FMBaseHttpRequest.h
//  WeAreFamily
//
//  Created by lly on 15/6/5.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDefineFile.h"

@interface FMBaseHttpRequest : NSObject

@property (nonatomic, strong) NSOperationQueue *queue;

/**
 *  获取当前请求剩余队列个数
 *
 *  @return 队列个数
 */
- (NSInteger)getQueueCount;

/**
 *  设置当前线程是否中断
 *
 *  @param bl        是否中断
 *
 *  @return N/A
 */
- (void)setSuspended:(BOOL)bl;

/**
 *  取消当前未完成请求队列
 *
 *  @return N/A
 */
- (void)cancelAllRequest;

/**
 *  销毁当前未完成请求队列
 *
 *  @return N/A
 */
- (void)distoryAllRequest;


@end
