//
//  FMMySelfShareCell.h
//  WeAreFamily
//
//  Created by lly on 15/5/22.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMBaseCell.h"

@class FMMySelfShareEntity;
@interface FMMySelfShareCell : FMBaseCell

// 更新cell
- (void)updateWithEntity:(FMMySelfShareEntity *)entity;

@end
