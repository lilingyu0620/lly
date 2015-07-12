//
//  FMMySelfInfoCell.h
//  WeAreFamily
//
//  Created by lly on 15/5/22.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMBaseCell.h"

@class FMMySelfInfoEntity;

@interface FMMySelfInfoCell : FMBaseCell

// 更新cell
- (void)updateWithEntity:(FMMySelfInfoEntity *)entity;
@end
