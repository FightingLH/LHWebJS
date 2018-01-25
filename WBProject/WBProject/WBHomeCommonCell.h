//
//  WBHomeCommonCell.h
//  WBProject
//
//  Created by feeyo on 2018/1/25.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBHomeCommonCellPresenter.h"

@interface WBHomeCommonCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier;
@property  (nonatomic, weak)  id<WBHomeCommonCellPresenter>cellDelegate;
@end
