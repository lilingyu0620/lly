//
//  UIImage+Extend.m
//  WeAreFamily
//
//  Created by lly on 15/5/20.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import "UIImage+Extend.h"

@implementation UIImage (Extend)


+ (UIImage *)createImageWithColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


@end
