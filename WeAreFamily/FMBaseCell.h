//
//  FMBaseCell.h
//  WeAreFamily
//
//  Created by lly on 15/5/22.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDefineFile.h"
#import "UIImage+Extend.h"

@interface FMBaseCell : UITableViewCell

// 获取实例
+ (instancetype)cell;

// 获取cell高度
+ (CGFloat)heightOfCell;

// 重用标识
+ (NSString *)cellReuseIdentifier;

@end
