//
//  FMBaseViewController.m
//  WeAreFamily
//
//  Created by lly on 15/5/20.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import "FMBaseViewController.h"
#import "MBProgressHUD.h"
#import "FMDefineFile.h"
#import "UIImage+Extend.h"

@interface FMBaseViewController()

@end

@implementation FMBaseViewController
@synthesize strNavTitle,isTransparent,rightButton,titleLabel = _titleLabel,leftButton,loadingHUD,newStatusBarFrame;


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    self.titleLabel = nil;
    
    
    FMLog(@"%@ 当前文件已销毁",[self class]);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.view.backgroundColor = RGBA(244, 245, 249, 1.0);
    self.edgesForExtendedLayout = UIRectEdgeNone;//设置全屏幕显示
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    FMLog(@"内存不足 %@",[self class]);
}

- (void)setNavTitleColor:(UIColor *)titleColor
{
    self.titleLabel.textColor = titleColor;
}

- (void)setStrNavTitle:(NSString *)navTitle
{
    self.strNavTitle = navTitle;
    UIView *navTitleView = self.navigationItem.titleView;
    
    
    if ([navTitleView isKindOfClass:[UILabel class]]) {
        self.titleLabel = (UILabel *)navTitleView;
        self.titleLabel.text = navTitle;
    }
    else
    {
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.titleLabel.text = navTitle;
        self.navigationItem.titleView = _titleLabel;
    }
    
    
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont fontWithName:@"ArialMT" size:18];
    self.titleLabel.textColor = [UIColor blackColor];
    [self.titleLabel sizeToFit];
}

//设置导航左边的button的图片名和背景图片名
- (void)setLeftButtonWithImageName:(NSString*)imageName bgImageName:(NSString*)bgImageName
{
    UIButton *tmpLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    tmpLeftButton.frame = CGRectMake(0, BUTTONMarginUP, NAVBUTTON_WIDTH, NAVBUTTON_HEIGHT);
    tmpLeftButton.showsTouchWhenHighlighted = NO;
    tmpLeftButton.exclusiveTouch = YES; //add by ljj 修改push界面问题
    
    if (bgImageName)//设置button的背景
    {
        [tmpLeftButton setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    }
    
    [tmpLeftButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [tmpLeftButton addTarget:self action:@selector(leftButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    self.leftButton = tmpLeftButton;
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tmpLeftButton];

    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -10;
    [self.navigationItem setLeftBarButtonItems:@[negativeSeperator, leftButtonItem]];
}


//设置导航左边的button的名称
- (void)setLeftButtonWithName:(NSString*)imageName
{
    //计算string的size
    CGSize stringSize = [imageName boundingRectWithSize:CGSizeMake(MAXFLOAT,44) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0]} context:nil].size;
    
    if (stringSize.width<60) {
        stringSize.width = 60;
    }
    else
    {
        stringSize.width+=6;
    }
    UIButton *tmpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tmpButton.frame = CGRectMake(self.view.frame.size.width-NAVBUTTON_WIDTH-BUTTONMarginX, BUTTONMarginUP, stringSize.width, 30);
    
    tmpButton.showsTouchWhenHighlighted = NO;
    tmpButton.exclusiveTouch = YES;
    [tmpButton addTarget:self action:@selector(leftButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [tmpButton setTitleColor:RGBA(47.f, 145.f, 223.f, 1.0f) forState:UIControlStateNormal];
    [tmpButton.titleLabel setFont:[UIFont systemFontOfSize:16.0]];
    [tmpButton setTitle:imageName forState:UIControlStateNormal];
    [tmpButton setTitleColor:RGB(200, 200, 200) forState:UIControlStateDisabled];
    [tmpButton setTitleColor:RGB(200, 200, 200) forState:UIControlStateHighlighted];
    
    self.leftButton = tmpButton;
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tmpButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -10;
    [self.navigationItem setLeftBarButtonItems:@[negativeSeperator, leftButtonItem]];
}





//设置导航右边的button的名称
- (void)setRightButtonWithName:(NSString*)imageName
{
    CGSize size =  [imageName boundingRectWithSize:CGSizeMake(MAXFLOAT,44) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0]} context:nil].size;
    if (size.width<60) {
        size.width = 60;
    }
    else
    {
        size.width+=6;
    }
    UIButton *tmpRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tmpRightButton.frame = CGRectMake(self.view.frame.size.width-NAVBUTTON_WIDTH-BUTTONMarginX, BUTTONMarginUP, size.width, 30);
    
    tmpRightButton.showsTouchWhenHighlighted = NO;
    tmpRightButton.exclusiveTouch = YES;
    [tmpRightButton addTarget:self action:@selector(rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [tmpRightButton setTitleColor:RGBA(47.f, 145.f, 223.f, 1.0f) forState:UIControlStateNormal];
    [tmpRightButton.titleLabel setFont:[UIFont systemFontOfSize:16.0]];
    [tmpRightButton setTitle:imageName forState:UIControlStateNormal];
    [tmpRightButton setTitleColor:RGB(200, 200, 200) forState:UIControlStateDisabled];
    [tmpRightButton setTitleColor:RGB(200, 200, 200) forState:UIControlStateHighlighted];
    
    self.rightButton = tmpRightButton;
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tmpRightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -10;
    [self.navigationItem setRightBarButtonItems:@[negativeSeperator, rightButtonItem]];
}


//设置导航右边的button的图片名和背景图片名
- (void)setRightButtonWithImageName:(NSString*)imageName bgImageName:(NSString*)bgImageName
{
    UIButton *tmpRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tmpRightButton.frame = CGRectMake(self.view.frame.size.width-NAVBUTTON_WIDTH-BUTTONMarginX, BUTTONMarginUP, NAVBUTTON_WIDTH, NAVBUTTON_HEIGHT);
    
    tmpRightButton.showsTouchWhenHighlighted = NO;
    tmpRightButton.exclusiveTouch = YES;//add by ljj 修改push界面问题
    
    if (bgImageName && bgImageName.length>0)//设置button的背景
    {
        [tmpRightButton setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    }
    
    [tmpRightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [tmpRightButton addTarget:self action:@selector(rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.rightButton = tmpRightButton;
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tmpRightButton];
    
    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -10;
    [self.navigationItem setRightBarButtonItems:@[negativeSeperator, rightButtonItem]];

}




-(void)setRightButtonWithStateImage:(NSString*)normaimageName stateHighlightedImage:(NSString*)highlightedImage stateDisabledImage:(NSString*)disabledImage titleName:(NSString*)titleName
{
    UIButton *tmpRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tmpRightButton.exclusiveTouch = YES;//add by ljj 修改push界面问题
    
    tmpRightButton.frame = CGRectMake(self.view.frame.size.width-NAVBUTTON_WIDTH-BUTTONMarginX, BUTTONMarginUP, NAVBUTTON_WIDTH, NAVBUTTON_HEIGHT);
    if (titleName) {
        [tmpRightButton setTitle:titleName forState:UIControlStateNormal];
        [tmpRightButton setTitle:titleName forState:UIControlStateDisabled];
    }
    tmpRightButton.showsTouchWhenHighlighted = NO;
    [tmpRightButton setImage:[UIImage imageNamed:normaimageName] forState:UIControlStateNormal];
    [tmpRightButton setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [tmpRightButton setImage:[UIImage imageNamed:disabledImage] forState:UIControlStateDisabled];
    
    [tmpRightButton addTarget:self action:@selector(rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.rightButton = tmpRightButton;
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tmpRightButton];
    
    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -10;
    [self.navigationItem setRightBarButtonItems:@[negativeSeperator, rightButtonItem]];
    
}


//导航设置为透明
- (void)clearNavigationBar
{
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor] andSize:CGSizeMake(320, 64)] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    if ([UINavigationBar instancesRespondToSelector:@selector(setShadowImage:)])
    {
        [self.navigationController.navigationBar setShadowImage:[UIImage createImageWithColor:[UIColor clearColor] andSize:CGSizeMake(320, 3)]];
    }

}

//设置导航图片
-(void)setNavigationBarImage
{
    
    UIImage *syncBgImg = [UIImage imageNamed:@"nav_public_titlebar_bg03"];
    [self.navigationController.navigationBar setBackgroundImage:syncBgImg forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    if ([UINavigationBar instancesRespondToSelector:@selector(setShadowImage:)])
    {
        [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"nav_public_titlebar_bg02"]];
    }
}



//将UIImage缩放到指定大小尺寸

- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}




- (NSString *)rightButtonName
{
    return [self.rightButton titleForState:UIControlStateNormal];
}

//设置左边按钮的显示or隐藏状态
- (void)setLeftButtonHiden:(BOOL)hiden
{
    if (self.leftButton) {
        [self.leftButton setHidden:hiden];
    }
}


//设置右边按钮的显示or隐藏状态
- (void)setRightButtonHiden:(BOOL)hiden
{
    if (self.rightButton) {
        [self.rightButton setHidden:hiden];
    }
}

- (void)setRightButtonEnabled:(BOOL)enabled
{
    [self.rightButton setEnabled:enabled];
}

-(void)setLeftButtonEnable:(BOOL)enabled
{
    [self.leftButton setEnabled:enabled];
}
//导航左按钮点击事件
- (void)leftButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//设置导航是否透明
- (void)setNavigationTransparent
{
    if (self.isTransparent)
    {
        [self clearNavigationBar];
    }
    else
    {
        [self setNavigationBarImage];
    }
}

//导航右按钮点击事件
- (void)rightButtonPressed:(id)sender{}



//处理字体改变事件
- (void)handleFontChange:(UIFont*)font
{
    _titleLabel.font = font;
}


-(BOOL)canDragBack
{
    return YES;
}


#pragma mark 换肤事件处理

- (void)handleSkinChange
{
    
}


















@end
