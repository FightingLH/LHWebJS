//
//  WBHomeOneCell.m
//  WBProject
//
//  Created by 李欢 on 2018/1/18.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBHomeOneCell.h"

@implementation WBHomeOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setTitleLabel:(UILabel *)titleLabel
{
    _titleLabel = titleLabel;
}

- (void)setSubTitleLabel:(UILabel *)subTitleLabel
{
    _subTitleLabel = subTitleLabel;
}

@end
