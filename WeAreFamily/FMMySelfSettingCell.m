//
//  FMMySelfSettingCell.m
//  WeAreFamily
//
//  Created by lly on 15/5/22.
//  Copyright (c) 2015年 lly. All rights reserved.
//

#import "FMMySelfSettingCell.h"

@interface FMMySelfSettingCell()

@property (strong, nonatomic) UIImageView *iconBackImageView;
@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UIView *lineView;
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UIImageView *arrowImageView;

@end


@implementation FMMySelfSettingCell


// 获取实例
+ (instancetype)cell
{
    return [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self cellReuseIdentifier]];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.iconBackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 70, 70)];
        self.iconBackImageView.backgroundColor = [UIColor clearColor];
        self.iconBackImageView.clipsToBounds = YES;
        self.iconBackImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.iconBackImageView.layer.cornerRadius = self.iconBackImageView.frame.size.width * 0.5;
        [self.contentView addSubview:self.iconBackImageView];
        
        self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 25, 45, 45)];
        self.iconImageView.clipsToBounds = YES;
        self.iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.iconImageView.layer.cornerRadius = self.iconImageView.frame.size.width * 0.5;
        [self.iconImageView setImage:[UIImage imageNamed:@"myself_icon_settings.png"]];
        [self.contentView addSubview:self.iconImageView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 35, SCREEN_WIDTH - 120.0, 25)];
        self.nameLabel.textColor = RGBEQ(51.0);
        self.nameLabel.font = [UIFont systemFontOfSize:16.0];
        [self.nameLabel setBackgroundColor:[UIColor clearColor]];
        [self.nameLabel setText:@"设置"];
        self.nameLabel.numberOfLines = 1;
        [self.contentView addSubview:self.nameLabel];
        
        //        self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 15)];
        //        self.headerView.backgroundColor = RGBEQ(246);
        //        [self.contentView addSubview:self.headerView];
        
        self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 94, SCREEN_WIDTH, 1)];
        self.lineView.backgroundColor = RGBEQ(228.0);
        [self.contentView addSubview:self.lineView];
        
        self.arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 25, 40, 10, 16)];
        self.arrowImageView.image = [UIImage imageNamed:@"myself_cell_next.png"];
        [self.contentView addSubview:self.arrowImageView];
    }
    
    
    return self;
}

// 获取cell高度
+ (CGFloat)heightOfCell
{
    return 95.0f;
}

// 重用标识
+ (NSString *)cellReuseIdentifier
{
    static NSString *cellID = @"FMMySelfSettingCell";
    return cellID;
}

// 更新cell
- (void)updateWithEntity:(FMMySelfSettingEntity *)entity
{}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
