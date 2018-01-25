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

+ (instancetype)cellWithTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier

{
    WBHomeOneCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"WBHomeOneCell" owner:nil options:nil].firstObject;
    }
    return cell;
}

- (void)setBuyBtton:(UIButton *)buyBtton
{
    
}

- (IBAction)buySenderClick:(UIButton *)sender {
    
    if (self.oneCellDelegate)
    {
        [self.oneCellDelegate clickCellWithCallBack:@"test"];
    }
}

@end
