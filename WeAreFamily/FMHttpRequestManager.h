//
//  FMHttpRequestManager.h
//  WeAreFamily
//
//  Created by lly on 15/6/5.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFMHttpRequestInterface.h"
#import "FMBaseHttpRequest.h"

@interface FMHttpRequestManager :FMBaseHttpRequest <FMHttpRequestInterface>

/**
 *  网络管理类单例
 *
 *  @return 管理类唯一实例
 */
+(instancetype)shareInstance;




@end
