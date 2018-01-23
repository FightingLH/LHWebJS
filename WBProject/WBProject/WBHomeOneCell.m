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
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.nameLabel];
        self.nameLabel.frame = CGRectMake(0, 0, 80, 40);
        self.nameLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickNameGesture)];
        [self.nameLabel addGestureRecognizer:tapGest];
    }
    return self;
}

- (void)clickNameGesture
{
    if (self.cellDelegate) {
        [self.cellDelegate clickCellWithCallBack:@"测试点击"];
    }
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"测试";
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:17];
    }
    return _nameLabel;
}


@end
