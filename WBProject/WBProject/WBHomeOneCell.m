//
//  WBHomeOneCell.m
//  WBProject
//
//  Created by feeyo on 2018/1/24.
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

- (void)setBuyBtton:(UIButton *)buyBtton
{
    
}


- (IBAction)buySenderClick:(UIButton *)sender {
    
    if (self.cellDelegate)
    {
        [self.cellDelegate clickCellWithCallBack:@"testOne"];
    }
}

@end
