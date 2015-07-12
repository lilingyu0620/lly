//
//  FMBaseTabbarController.h
//  WeAreFamily
//
//  Created by lly on 15/5/20.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMBaseTabbarController : UITabBarController


//添加tabbar上面所有的navigationController
-(void)addAllNaviControllerToArray;

//加载tabbar上面的资源图片
-(void)addAllImagesResource;

//设置视图控件
-(void)setAllViewsToTabbar;

@end
