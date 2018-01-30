//
//  WBEventTimeView.m
//  WBProject
//
//  Created by feeyo on 2018/1/30.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBEventAddTimeView.h"
@interface  WBEventAddTimeView()
@property  (nonatomic, strong)  UILabel  *titleLabel;
@property  (nonatomic, strong)  UILabel  *subTitleLabel;
@end

@implementation WBEventAddTimeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
        [self addSubview:self.subTitleLabel];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(15);
        }];
        [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom);
            make.bottom.equalTo(self.mas_bottom).offset(-10);
            make.left.mas_equalTo(15);
        }];
        
        UIImageView *rightImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"event_right"]];
        [self addSubview:rightImg];
        [rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self.mas_right).offset(-15);
        }];
    }
    return self;
}



- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc]init];
        _subTitleLabel.text = @"9:55 AM";
        _subTitleLabel.textColor = [UIColor blackColor];
        _subTitleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _subTitleLabel;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"星期三 9月24日";
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.font = [UIFont systemFontOfSize:10];
    }
    return _titleLabel;
}
@end
