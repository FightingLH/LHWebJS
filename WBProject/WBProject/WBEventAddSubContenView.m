//
//  WBEventAddSubContenView.m
//  WBProject
//
//  Created by feeyo on 2018/1/30.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBEventAddSubContenView.h"

@interface WBEventAddSubContenView()
@property  (nonatomic,  strong)  UIImageView  *leftIcon;
@property  (nonatomic,  strong)  UILabel      *leftTitle;
@property  (nonatomic,  strong)  UIImageView  *rightIcon;
@end

@implementation WBEventAddSubContenView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self configView];
    }
    return self;
}


- (void)configView
{
    [self addSubview:self.leftIcon];
    [self.leftIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.top.equalTo(self.mas_top).offset(10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
    
    [self addSubview:self.leftTitle];
    [self.leftTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.leftIcon.mas_right).offset(8);
    }];
    
    [self addSubview:self.rightIcon];
    [self.rightIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_right).offset(-15);
    }];
}

- (UILabel *)leftTitle
{
    if (!_leftTitle) {
        _leftTitle = [[UILabel alloc]init];
        _leftTitle.textColor = [UIColor grayColor];
        _leftTitle.font = [UIFont systemFontOfSize:14];
        _leftTitle.text = @"重复";
    }
    return _leftTitle;
}

- (UIImageView *)rightIcon
{
    if (!_rightIcon) {
        _rightIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"event_right"]];
        
    }
    return _rightIcon;
}

- (UIImageView *)leftIcon
{
    if (!_leftIcon) {
        _leftIcon = [[UIImageView alloc]init];
        _leftIcon.image = [UIImage imageNamed:@"event_repeat"];
    }
    return _leftIcon;
}
@end
