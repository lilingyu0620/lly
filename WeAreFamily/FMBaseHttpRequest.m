//
//  FMBaseHttpRequest.m
//  WeAreFamily
//
//  Created by lly on 15/6/5.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import "FMBaseHttpRequest.h"

@implementation FMBaseHttpRequest
@synthesize queue = _queue;

- (id)init
{
    self = [super init];
    if (self) {
        if (self.queue == nil) {
            _queue = [[NSOperationQueue alloc]init];
            self.queue.maxConcurrentOperationCount = 2;
        }
    }
    
    return self;
}

- (NSInteger)getQueueCount
{
    return self.queue.operations.count;
}

- (void)setSuspended:(BOOL)bl
{
    [self.queue setSuspended:bl];
}

- (void)cancelAllRequest
{
    [self.queue cancelAllOperations];
}

- (void)distoryAllRequest
{
    [self.queue cancelAllOperations];
    
    self.queue = nil;
}

@end
