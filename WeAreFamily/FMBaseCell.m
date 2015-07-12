//
//  FMBaseCell.m
//  WeAreFamily
//
//  Created by lly on 15/5/22.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import "FMBaseCell.h"

@implementation FMBaseCell


// 获取实例
+ (instancetype)cell
{
    return nil;
}

// 获取cell高度
+ (CGFloat)heightOfCell
{
    return 0;
}

// 重用标识
+ (NSString *)cellReuseIdentifier
{
    return nil;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
