//
//  WBHomeTwoCell.m
//  WBProject
//
//  Created by feeyo on 2018/1/25.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBHomeTwoCell.h"

@implementation WBHomeTwoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPhoneTextField:(UITextField *)phoneTextField
{
    phoneTextField.delegate = self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.cellDelegate) {
        [self.cellDelegate clickCellWithCallBack:textField.text];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

@end
