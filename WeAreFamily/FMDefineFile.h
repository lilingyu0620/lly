//
//  FMDefineFile.h
//  WeAreFamily
//
//  Created by lly on 15/5/20.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#ifndef WeAreFamily_FMDefineFile_h
#define WeAreFamily_FMDefineFile_h

//屏幕宽高
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height


//打印日志
# define FMLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);  


//适用于RGB颜色相同的场景
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0f]
#define RGBEQ(rgb) [UIColor colorWithRed:rgb/255.0 green:rgb/255.0 blue:rgb/255.0 alpha:1.0f]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGBEQA(rgb,a) [UIColor colorWithRed:rgb/255.0 green:rgb/255.0 blue:rgb/255.0 alpha:a]
#define RGBDefault [UIColor colorWithRed:228/255.0 green:80/255.0 blue:48/255.0 alpha:a]


#endif
