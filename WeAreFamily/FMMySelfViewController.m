//
//  FMMySelfViewController.m
//  WeAreFamily
//
//  Created by lly on 15/5/20.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import "FMMySelfViewController.h"
#import "FMMySelfInfoCell.h"
#import "FMMySelfShareCell.h"
#import "FMMySelfInfoViewController.h"
#import "FMMySelfShareViewController.h"
#import "FMMySelfSettingCell.h"
#import "FMMySelfSettingsViewController.h"

@interface FMMySelfViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic)UITableView *mainTableView;

@end

@implementation FMMySelfViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    CGRect frame = [UIScreen mainScreen].bounds;
    frame.size.height -= 64;
    self.mainTableView = [[UITableView alloc]initWithFrame:frame];
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mainTableView.backgroundColor = [UIColor clearColor];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self.view addSubview:self.mainTableView];
}



#pragma mark -
#pragma mark - UITableView Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1)
    {
        return 1;
    }
    else if (section == 2)
    {
        return 1;
    }
    return 0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        FMMySelfInfoCell *infoCell = [FMMySelfInfoCell cell];
        return infoCell;
    }
    else if (indexPath.section == 1)
    {
        FMMySelfShareCell *shareCell = [FMMySelfShareCell cell];
        return shareCell;
    }
    else if(indexPath.section == 2)
    {
        FMMySelfSettingCell *settingsCell = [FMMySelfSettingCell cell];
        return settingsCell;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        return [FMMySelfInfoCell heightOfCell];
    }
    else if (indexPath.section == 1)
    {
        return [FMMySelfShareCell heightOfCell];
    }
    else if(indexPath.section == 2)
    {
        return [FMMySelfSettingCell heightOfCell];
    }
    
    return 0;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        FMMySelfInfoViewController *infoVC = [[FMMySelfInfoViewController alloc]init];
        infoVC.title = @"个人资料";
        [self.navigationController pushViewController:infoVC animated:YES];
    }
    else if(indexPath.section == 1)
    {
        FMMySelfShareViewController *shareVC = [[FMMySelfShareViewController alloc]init];
        shareVC.title = @"我的分享";
        [self.navigationController pushViewController:shareVC animated:YES];
    }
    else if(indexPath.section == 2)
    {
        FMMySelfSettingsViewController *settingsVC = [[FMMySelfSettingsViewController alloc]init];
        settingsVC.title = @"设置";
        [self.navigationController pushViewController:settingsVC animated:YES];
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"个人资料";
    }
    else if (section == 1)
        return @"我的分享";
    else if (section == 2)
        return @"设置";
    return @"";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headView = [[UIView alloc]init];
    [headView setBackgroundColor:RGBEQ(240)];
    return headView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
