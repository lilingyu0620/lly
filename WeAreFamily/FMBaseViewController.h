//
//  FMBaseViewController.h
//  WeAreFamily
//
//  Created by lly on 15/5/20.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDefineFile.h"

#define BUTTONMarginX    10
#define BUTTONMarginUP   0
#define NAVBUTTON_WIDTH  44
#define NAVBUTTON_HEIGHT 44
#define NAVIGATION_BAR_HEIGHT self.navigationController.navigationBar.frame.size.height

@class MBProgressHUD;
@interface FMBaseViewController : UIViewController

@property (strong, nonatomic) NSString *strNavTitle;  /**< 导航标题*/
@property (assign, nonatomic) BOOL isTransparent;  /**< 导航是否透明*/
@property (nonatomic,strong)UIButton* rightButton; //右键
@property (nonatomic,strong)UILabel* titleLabel;   //导航标题label
@property (nonatomic,strong)UIButton* leftButton;  //左键
@property (nonatomic,assign)CGRect newStatusBarFrame;
@property (nonatomic, strong)MBProgressHUD *loadingHUD;  //进度条


/**
 *  设置标题字体颜色
 *
 *  @param titleColor 标题颜色
 */
-(void)setNavTitleColor:(UIColor*)titleColor;

/**
 * 设置导航左边的button的名称
 *
 *  @param name 设置button的名称
 */
- (void)setLeftButtonWithName:(NSString*)imageName;

/**
 *	@brief	设置导航左边的button的图片名和背景图片名
 *
 *	@param 	imageName 	button的图片名
 *	@param 	bgImageName 	button的背景图片名
 */
- (void)setLeftButtonWithImageName:(NSString*)imageName bgImageName:(NSString*)bgImageName;

/**
 * 设置导航右边的button的名称
 *
 *  @param name 设置button的名称
 */
- (void)setRightButtonWithName:(NSString*)imageName;

/**
 *	@brief	设置导航右边的button的图片名和背景图片名
 *
 *	@param 	imageName 	button的图片名
 *	@param 	bgImageName 	button的背景图片名
 */
- (void)setRightButtonWithImageName:(NSString*)imageName bgImageName:(NSString*)bgImageName;
/**
 *  设置导航右边的button
 *
 *  @param normaimageName   设置默认状态的图片
 *  @param highlightedImage 设置按下状态的图片
 *  @param disabledImage    设置不可点击状态的图片
 */
-(void)setRightButtonWithStateImage:(NSString*)normaimageName stateHighlightedImage:(NSString*)highlightedImage stateDisabledImage:(NSString*)disabledImage titleName:(NSString*)titleName;

/**
 *	@brief	返回右边按钮的名字
 *
 */
- (NSString *)rightButtonName;

/**
 *	@brief	设置左边按钮的显示or隐藏状态
 *
 *	@param 	hiden 	YES 隐藏 NO 显示
 */
- (void)setLeftButtonHiden:(BOOL)hiden;


/**
 *	@brief	设置右边按钮的显示or隐藏状态
 *
 *	@param 	hiden 	YES 隐藏 NO 显示
 */
- (void)setRightButtonHiden:(BOOL)hiden;

/**
 *  设置右侧按钮是否点击
 *
 *  @param enabled YES 可用   NO 不可用
 */
- (void)setRightButtonEnabled:(BOOL)enabled;
/**
 *  设置左侧侧按钮是否点击
 *
 *  @param enabled YES 可用   NO 不可用
 */
-(void)setLeftButtonEnable:(BOOL)enabled;

/**
 *  @brief 设置导航栏
 *
 */
-(void)setNavigationTransparent;

/*=====================下面的方法需要子类去实现，导航的左按钮时间默认是pop到上一级========================*/

//导航左按钮点击事件
- (void)leftButtonPressed:(id)sender;

//导航右按钮点击事件
- (void)rightButtonPressed:(id)sender;

//处理换肤
- (void)handleSkinChange;

//处理设置字体
- (void)handleFontChange:(UIFont*)font;

-(BOOL)canDragBack;


@end
