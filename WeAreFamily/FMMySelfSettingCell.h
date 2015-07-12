//
//  FMMySelfSettingCell.h
//  WeAreFamily
//
//  Created by lly on 15/5/22.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMBaseCell.h"

@class FMMySelfSettingEntity;
@interface FMMySelfSettingCell : FMBaseCell

// 更新cell
- (void)updateWithEntity:(FMMySelfSettingEntity *)entity;


@end
