//
//  FMTabbarController.m
//  WeAreFamily
//
//  Created by lly on 15/5/20.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import "FMTabbarController.h"
#import "FMDefineFile.h"
#import "UIImage+Extend.h"
#import "MBProgressHUD.h"

#import "FMSessionNavigationController.h"
#import "FMFamilyTreeNavigationController.h"
#import "FMContactNavigationController.h"
#import "FMShareNavigationController.h"
#import "FMMySelfNavigationController.h"

#import "FMSessionViewController.h"
#import "FMFamilyTreeViewController.h"
#import "FMContactViewController.h"
#import "FMShareViewController.h"
#import "FMMySelfViewController.h"

@implementation FMTabbarController
@synthesize sessionNavi = _sessionNavi,familyTreeNavi = _familyTreeNavi,contactNavi = _contactNavi,shareNavi = _shareNavi,myselfNavi = _myselfNavi;


- (void)dealloc
{
    
    //界面释放时清理内存
    self.sessionNavi = nil;
    self.familyTreeNavi = nil;
    self.contactNavi = nil;
    self.shareNavi = nil;
    self.myselfNavi = nil;
    
    self.tabbarBackgroundImage = nil;
    self.unSelectedImageArray = nil;
    self.selectedImageArray = nil;
    self.itemBgImageViewArray = nil;
    
    self.currentSelected = nil;
    
    self.badgeImageView = nil;
    self.naviArray = nil;
    
    NSLog(@"%@ 界面内存已经释放",[self class]);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}


#pragma mark -
#pragma mark - itemIndex methods


//显示红点，count为0时不显示
- (BOOL)setBadgeValue:(int)count withTabbarType:(kTabbarItemType)barItemType
{
    return NO;
}


- (void)addAllNaviControllerToArray
{
    self.naviArray = [NSMutableArray array];
    
    //会话页面
    FMSessionViewController *sessionVC = [[FMSessionViewController alloc]init];
    sessionVC.title = @"会话";
    self.sessionNavi = [[FMSessionNavigationController alloc]initWithRootViewController:sessionVC];
    [self.sessionNavi setHidesBottomBarWhenPushed:NO];
    [self.naviArray addObject:_sessionNavi];
    
    //族谱页面
    FMFamilyTreeViewController *familyTreeVC = [[FMFamilyTreeViewController alloc]init];
    familyTreeVC.title = @"族谱";
    self.familyTreeNavi = [[FMFamilyTreeNavigationController alloc]initWithRootViewController:familyTreeVC];
    [self.familyTreeNavi setHidesBottomBarWhenPushed:NO];
    [self.naviArray addObject:_familyTreeNavi];
    
    //联系人
    FMContactViewController *contactVC = [[FMContactViewController alloc]init];
    contactVC.title = @"联系人";
    self.contactNavi = [[FMContactNavigationController alloc]initWithRootViewController:contactVC];
    [self.contactNavi setHidesBottomBarWhenPushed:NO];
    [self.naviArray addObject:_contactNavi];
    
    //分享
    FMShareViewController *shareVC = [[FMShareViewController alloc]init];
    shareVC.title = @"分享";
    self.shareNavi = [[FMShareNavigationController alloc]initWithRootViewController:shareVC];
    [self.shareNavi setHidesBottomBarWhenPushed:NO];
    [self.naviArray addObject:_shareNavi];
    
    //我的...
    FMMySelfViewController *mySelfVC = [[FMMySelfViewController alloc]init];
    mySelfVC.title = @"我";
    self.myselfNavi = [[FMMySelfNavigationController alloc]initWithRootViewController:mySelfVC];
    [self.myselfNavi setHidesBottomBarWhenPushed:NO];
    [self.naviArray addObject:_myselfNavi];
    
    self.currentSelected = _sessionNavi;
    
}



//加载tabbar上面的资源图片
-(void)addAllImagesResource
{
    self.tabbarBackgroundImage = [UIImage imageNamed:@"tabbar_bg_5"];

    //未选中的图标
    NSMutableArray *aunSelectedImageArray = [[NSMutableArray alloc] initWithObjects:
                                             [UIImage  imageNamed:@"tabbar_icon_messag"],
                                             [UIImage imageNamed:@"tabbar_icon_friend"],
                                             [UIImage imageNamed:@"tabbar_icon_contacts"],
                                             [UIImage imageNamed:@"tabbar_icon_side"],
                                             [UIImage imageNamed:@"tabbar_icon_more"], nil];
    self.unSelectedImageArray = aunSelectedImageArray;
    
    //选中的图片
    NSMutableArray *aselectedImageArray = [[NSMutableArray alloc] initWithObjects:
                                           [UIImage imageNamed:@"tabbar_icon_messag_press"],
                                           [UIImage imageNamed:@"tabbar_icon_friend_press"],
                                           [UIImage imageNamed:@"tabbar_icon_contacts_press"],
                                           [UIImage imageNamed:@"tabbar_icon_side_press"],
                                           [UIImage imageNamed:@"tabbar_icon_more_press"], nil];
    self.selectedImageArray = aselectedImageArray;
    
    //每一个item的宽度
    CGFloat itemWidth = self.view.frame.size.width/[self.naviArray count];
    //每一个item图标离左侧的距离
    CGFloat marginx = (itemWidth - kTabItemImageWidth)/2;
    
    //设置小红点
    self.badgeImageView = [NSMutableArray array];
    for (int i = 0; i < [self.naviArray count]; i++)
    {
        UIImageView* badge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"msg_tabbar_tips_new"]];
        badge.frame = CGRectMake((i+1) * itemWidth -marginx, 6, 6, 6);
        badge.hidden = YES;
        [self.badgeImageView addObject:badge];
    }
    
    self.itemBgImageViewArray = [NSMutableArray array];
    
    //设置tabbar的items图标
    for (int i = 0; i < [self.naviArray count]; i++)
    {
        UIImageView *itemBg  = [[UIImageView alloc] initWithFrame:CGRectMake(marginx +itemWidth * i + kTabSpacing * i, kTabSideMarginY, kTabItemImageWidth, kTabItemImageHeight)];
        itemBg.contentMode = UIViewContentModeScaleAspectFit;
        [self.itemBgImageViewArray addObject:itemBg];
    }
}

- (void)setAllViewsToTabbar
{
    //初始化tabbarcontroller控件
    self.viewControllers = self.naviArray;
    
    //修正tabbar的frame高度，默认高度是49
    self.tabBar.frame = CGRectMake(0, [UIScreen mainScreen].applicationFrame.size.height - kTabItemHeight, [UIScreen mainScreen].applicationFrame.size.width, kTabItemHeight);
    if ([UIScreen mainScreen].bounds.size.height != [UIScreen mainScreen].applicationFrame.size.height) {
        self.tabBar.frame = CGRectMake(0, [UIScreen mainScreen].applicationFrame.size.height + 20 - kTabItemHeight, [UIScreen mainScreen].applicationFrame.size.width, kTabItemHeight);
    }    //设置tabbar的背景图
    
    FMLog(@"%f",self.tabBar.frame.size.width);
    FMLog(@"%f",self.tabBar.frame.size.height);
    if(self.tabbarBackgroundImage)
    {
        [self.tabBar setBackgroundImage:self.tabbarBackgroundImage];
    }
    if ([self.tabBar respondsToSelector:@selector(setShadowImage:)]) {
        [self.tabBar setShadowImage:[[UIImage alloc] init]];
    }
    //设置tabbarItem文字颜色和位置
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(54/255.0, 149.0/255.0, 217.0/255.0), NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(153.0/255.0, 153.0/255.0, 153.0/255.0), NSForegroundColorAttributeName,[UIFont systemFontOfSize:12.0], NSFontAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    
    //设置tabbar的items图表
    for (int i = 0; i < [self.itemBgImageViewArray count]; i++)
    {
        UIImageView *itemBg  = [self.itemBgImageViewArray objectAtIndex:i];
        itemBg.image = [self.unSelectedImageArray objectAtIndex:i];
        [self.tabBar addSubview:itemBg];
    }
    
    //设置小红点
    for (int i = 0; i < [self.badgeImageView count]; i++)
    {
        UIImageView* badge = [self.badgeImageView objectAtIndex:i];
        [self.tabBar addSubview:badge];
        [self.tabBar bringSubviewToFront:badge];
    }
    
    self.selectedIndex = 0;

}

- (NSArray*)addTabBarItem
{
    NSMutableArray* itemsArray = [[NSMutableArray alloc]initWithCapacity:5];
    for (int i=0; i<self.selectedImageArray.count; i++) {
        UITabBarItem* tabBarItem = [[UITabBarItem alloc]initWithTitle:@"12" image:[self.selectedImageArray objectAtIndex:i]  selectedImage:[self.unSelectedImageArray objectAtIndex:i]];
        [itemsArray addObject:tabBarItem];
    }
    return itemsArray;
}


#pragma mark - View lifecycle

//取消上次的选中状态
- (void)setLastSelectedIndex:(int)lastSelectedIndex
{
    if (_lastSelectedIndex != lastSelectedIndex)
    {
        //将上次的选中效果取消
        UIImageView *lastSelectedImageView = (UIImageView *)[self.itemBgImageViewArray objectAtIndex:_lastSelectedIndex];
        
        lastSelectedImageView.image = [self.unSelectedImageArray objectAtIndex:_lastSelectedIndex];
        _lastSelectedIndex = lastSelectedIndex;
    }
}

//设置当前的选中状态
- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    self.tabBar.selectionIndicatorImage = [UIImage createImageWithColor:[UIColor clearColor] andSize:CGSizeMake(320, 2)];
    [self.currentSelected popToRootViewControllerAnimated:NO];
    self.currentSelected = [self.naviArray objectAtIndex:selectedIndex];
    [self setSelectedViewController:self.currentSelected];
    
    //将上次的选中效果取消
    self.lastSelectedIndex = (int)selectedIndex;
    
    //将本次的选中效果显示
    UIImageView *selectedImageView = (UIImageView *)[self.itemBgImageViewArray objectAtIndex:selectedIndex];
    selectedImageView.image = [self.selectedImageArray objectAtIndex:selectedIndex];
    
}


#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    _lastSelectedIndex = 0;
    
    [self addAllNaviControllerToArray];
    [self addAllImagesResource];
    [self setAllViewsToTabbar]; //添加完资源后才能调用
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}




-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //显示状态栏
    [self setNeedsStatusBarAppearanceUpdate];
}


- (void)showCompleteHUD:(BOOL)success
{
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    if(success){
        HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_complete.png"]];
        HUD.detailsLabelText = @"完成";
    }
    else{
        HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_error.png"]];
        HUD.detailsLabelText = @"错误";
    }
    
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.detailsLabelFont = [UIFont systemFontOfSize:14];
    
    [HUD show:YES];
    [HUD hide:YES afterDelay:3];
}


#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    self.selectedIndex = [tabBar.items indexOfObject:item];
//    [item initWithTitle:@"" image:nil selectedImage:nil];
}









































@end