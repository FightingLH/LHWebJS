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
        [self configView];
    }
    return self;
}



- (void)configView
{
    [self.contentView addSubview:self.timeIcon];
    self.timeIcon.frame = CGRectMake(15, 5, 8, 8);
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(18, 13, 1, 70)];
    lineView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineView];
    
    [self.contentView addSubview:self.startLabel];
    self.startLabel.frame = CGRectMake(30, 5, 80, 10);
    
    [self.contentView addSubview:self.eventTitle];
    self.eventTitle.frame = CGRectMake(30, 23, 100, 15);
    
    [self.contentView addSubview:self.eventResult];
    self.eventResult.frame = CGRectMake(30, 45, 100, 15);
    
    [self.contentView addSubview:self.eventCalendar];
    self.eventCalendar.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 100, 5, 85, 10);
    
    [self.contentView addSubview:self.eventDetail];
    self.eventDetail.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 100, 45, 80, 15);
}


- (UILabel *)eventCalendar
{
    if (!_eventCalendar) {
        _eventCalendar = [[UILabel alloc]init];
        _eventCalendar.text = @"周四 9月28号";
        _eventCalendar.font = [UIFont systemFontOfSize:10];
        _eventCalendar.textColor = [UIColor blackColor];
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
        _eventTitle.text = @"今晚吃鸡";
        _eventTitle.font = [UIFont systemFontOfSize:15];
        _eventTitle.textColor = [UIColor blackColor];
    }
    return _eventTitle;
}


- (UILabel *)eventResult
{
    if (!_eventResult) {
        _eventResult = [[UILabel alloc]init];
        _eventResult.text = @"任务未完成";
        _eventResult.font = [UIFont systemFontOfSize:11];
        _eventResult.textColor = [UIColor grayColor];
    }
    return _eventResult;
}

- (UILabel *)startLabel
{
    if (!_startLabel) {
        _startLabel = [[UILabel alloc]init];
        _startLabel.text = @"10:30 AM";
        _startLabel.font = [UIFont systemFontOfSize:10];
        _startLabel.textColor = [UIColor grayColor];
    }
    return _startLabel;
}


- (UIImageView *)timeIcon
{
    if (!_timeIcon) {
        _timeIcon = [[UIImageView alloc]init];
        _timeIcon.backgroundColor = [UIColor grayColor];
        _timeIcon.clipsToBounds = YES;
        _timeIcon.layer.cornerRadius = 4;
    }
    return _timeIcon;
}

@end
