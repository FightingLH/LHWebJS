//
//  WBHomeOneCell.h
//  WBProject
//
//  Created by feeyo on 2018/1/24.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBHomeOneCellPresenter.h"

@interface WBHomeOneCell : UITableViewCell<WBHomeOneCellPresenter>
@property  (nonatomic, weak)  id<WBHomeOneCellPresenter>oneCellDelegate;
+ (instancetype)cellWithTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier;
@property (weak, nonatomic) IBOutlet UIButton *buyBtton;
@end
