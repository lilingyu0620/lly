//
//  FMTabbarController.h
//  WeAreFamily
//
//  Created by lly on 15/5/20.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import "FMBaseTabbarController.h"



#define kMAINTABCOUNT 5              //item 的个数
#define kTabItemWidth 64             //每个Item的宽
#define kTabItemHeight 49            //每个item的高
#define kTabItemImageWidth 33        //item中图片的宽
#define kTabItemImageHeight 33       //item中图片的高
#define kTabSideMarginX 15.5
#define kTabSideMarginY 2
#define kTabSpacing 0


//tabbaritem的类型
typedef enum
{
    kMessageBarItemType = 0,   //消息
    kFamilyTreeBarItemype = 1, //族谱
    kContactBarItemType = 2,   //联系人
    kShareBarItemType = 3,     //分享
    kMySelfBarItemType = 4,    //我的...
}kTabbarItemType;


@class FMBaseNavigationController,FMSessionNavigationController,FMFamilyTreeNavigationController,FMContactNavigationController,FMShareNavigationController,FMMySelfNavigationController;

@interface FMTabbarController : FMBaseTabbarController

@property(nonatomic,strong)FMSessionNavigationController* sessionNavi;                  //消息列表导航控制器
@property(nonatomic,strong)FMFamilyTreeNavigationController* familyTreeNavi;            //族谱导航控制器
@property(nonatomic,strong)FMContactNavigationController* contactNavi;                  //联系人导航控制器
@property(nonatomic,strong)FMShareNavigationController* shareNavi;                      //分享导航控制器
@property(nonatomic,strong)FMMySelfNavigationController* myselfNavi;                    //我的...导航控制器


@property (nonatomic, strong) UIImage         *tabbarBackgroundImage;// 整个tabBar的背景
@property (nonatomic, strong) NSMutableArray  *unSelectedImageArray; // 非选中效果的tabBarItem数组
@property (nonatomic, strong) NSMutableArray  *selectedImageArray;   // 选中效果的tabBarItem数组
@property (nonatomic, strong) NSMutableArray  *itemBgImageViewArray; // item背景UIImageView数组
@property (nonatomic, assign) int             lastSelectedIndex;     // 上一次选中的tabBarItem的index

@property (nonatomic,strong)FMBaseNavigationController *currentSelected;

@property (strong,nonatomic)NSMutableArray*           badgeImageView;               //标记图片
@property (strong,nonatomic)NSMutableArray*           naviArray;                    //存储导航控制器



//显示有更新的红点,count传0时，不显示,返回结果：YES：设置成功  NO:设置失败
- (BOOL)setBadgeValue:(int)count withTabbarType:(kTabbarItemType)barItemType;


@end
