//
//  WBEventAddContentView.m
//  WBProject
//
//  Created by feeyo on 2018/1/30.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBEventAddContentView.h"

#define PLACE_HOLDER_TEXT  @"请输入提醒事项..."

@interface WBEventAddContentView()<UITextViewDelegate>
@property  (nonatomic, strong)  UITextView  *inputTextView;
@end

@implementation WBEventAddContentView
- (instancetype)init
{
    if (self == [super init]) {
        [self configView];
    }
    return self;
}

- (void)configView
{
    [self addSubview:self.inputTextView];
    [self.inputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self);
    }];
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if ([[textView text] isEqualToString:PLACE_HOLDER_TEXT]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if ([[textView text] length] == 0) {
        textView.text = PLACE_HOLDER_TEXT;
        textView.textColor = [UIColor grayColor];
    }
    return YES;
}

- (UITextView *)inputTextView
{
    if (!_inputTextView) {
        _inputTextView = [[UITextView alloc]init];
        _inputTextView.font = [UIFont systemFontOfSize:14];
        _inputTextView.textColor = [UIColor grayColor];
        _inputTextView.delegate = self;
        _inputTextView.text = PLACE_HOLDER_TEXT;
    }
    return _inputTextView;
}
@end
