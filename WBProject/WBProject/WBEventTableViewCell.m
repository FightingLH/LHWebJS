//
//  WBEventTableViewCell.m
//  WBProject
//
//  Created by 李欢 on 2018/1/29.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBEventTableViewCell.h"

@interface WBEventTableViewCell()
@property  (nonatomic,  strong)   UIImageView  *timeIcon;
@property  (nonatomic,  strong)   UILabel      *startLabel;
@property  (nonatomic,  strong)   UILabel      *eventTitle;

@property  (nonatomic,  strong)   UILabel      *eventSchedule;
@property  (nonatomic,  strong)   UILabel      *eventResult;
@property  (nonatomic,  strong)   UILabel      *eventDetail;
@property  (nonatomic,  strong)   UILabel      *eventCalendar;
@end

@implementation WBEventTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = kBackGroundColor;
        [self configView];
    }
    return self;
}

- (void)configView
{
    [self.contentView addSubview:self.timeIcon];
    [self.timeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(10);
        make.height.mas_equalTo(10);
    }];
   
    [self.contentView addSubview:self.startLabel];
    [self.startLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeIcon.mas_centerY);
        make.left.equalTo(self.timeIcon.mas_right).offset(10);
    }];
    
    [self.contentView addSubview:self.eventTitle];
    [self.eventTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.startLabel.mas_left);
        make.top.equalTo(self.startLabel.mas_bottom).offset(15);
    }];
    
    [self.contentView addSubview:self.eventSchedule];
    [self.eventSchedule mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.startLabel.mas_left);
        make.top.equalTo(self.eventTitle.mas_bottom).offset(15);
    }];
    
    [self.contentView addSubview:self.eventResult];
    [self.eventResult mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.eventSchedule.mas_right).offset(3);
        make.top.equalTo(self.eventTitle.mas_bottom).offset(15);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-40);
    }];
    
    [self.contentView addSubview:self.eventCalendar];
    [self.eventCalendar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.centerY.equalTo(self.startLabel.mas_centerY);
    }];
    
    UIImageView *iconCalendar = [[UIImageView alloc]init];
    [self.contentView addSubview:iconCalendar];
    iconCalendar.image = [UIImage imageNamed:@"event_calendar"];
    [iconCalendar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.eventCalendar.mas_left).offset(-5);
        make.centerY.equalTo(self.eventCalendar.mas_centerY);
        make.width.mas_equalTo(12);
        make.height.mas_equalTo(15);
    }];
    
    [self.contentView addSubview:self.eventDetail];
    [self.eventDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.centerY.equalTo(self.eventResult.mas_centerY);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = kLineColor;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.timeIcon.mas_centerX);
        make.top.equalTo(self.timeIcon.mas_bottom).offset(3);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
    }];
    
}


- (UILabel *)eventCalendar
{
    if (!_eventCalendar) {
        _eventCalendar = [[UILabel alloc]init];
        _eventCalendar.text = @"周四 9月28号";
        _eventCalendar.font = [UIFont systemFontOfSize:10];
        _eventCalendar.textColor = kSubtitleColor;
    }
    return _eventCalendar;
}

- (UILabel *)eventDetail
{
    if (!_eventDetail) {
        _eventDetail = [[UILabel alloc]init];
        _eventDetail.text = @"详情 >";
        _eventDetail.font = [UIFont systemFontOfSize:12];
        _eventTitle.textColor = [UIColor blackColor];
    }
    return _eventDetail;
}

- (UILabel *)eventTitle
{
    if (!_eventTitle) {
        _eventTitle = [[UILabel alloc]init];
        _eventTitle.text = @"2.13日放假回家、提醒";
        _eventTitle.font = [UIFont systemFontOfSize:15];
        _eventTitle.textColor = kTitleColor;
    }
    return _eventTitle;
}

- (UILabel *)eventSchedule
{
    if (!_eventSchedule) {
        _eventSchedule = [[UILabel alloc]init];
        _eventSchedule.text = @"⭕️";
        _eventSchedule.font = [UIFont systemFontOfSize:10];
        _eventSchedule.tintColor = [UIColor blueColor];
    }
    return _eventSchedule;
}

- (UILabel *)eventResult
{
    if (!_eventResult) {
        _eventResult = [[UILabel alloc]init];
        _eventResult.text = @" 任务未完成";
        _eventResult.font = [UIFont systemFontOfSize:11];
        _eventResult.textColor = kSubtitleColor;
    }
    return _eventResult;
}

- (UILabel *)startLabel
{
    if (!_startLabel) {
        _startLabel = [[UILabel alloc]init];
        _startLabel.text = @"10:30 AM";
        _startLabel.font = [UIFont systemFontOfSize:10];
        _startLabel.textColor = kSubtitleColor;
    }
    return _startLabel;
}


- (UIImageView *)timeIcon
{
    if (!_timeIcon) {
        _timeIcon = [[UIImageView alloc]init];
        _timeIcon.image = [UIImage imageNamed:@"event_time"];
        _timeIcon.clipsToBounds = YES;
        _timeIcon.layer.cornerRadius = 4;
    }
    return _timeIcon;
}

@end
