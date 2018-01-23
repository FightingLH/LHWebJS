//
//  WBHomeOneCell.h
//  WBProject
//
//  Created by 李欢 on 2018/1/18.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBHomeOneCellPresenter.h"

@interface WBHomeOneCell : UITableViewCell
@property  (nonatomic, weak)   id<WBHomeOneCellPresenter> cellDelegate;
@property  (nonatomic, strong)  UILabel  *nameLabel;
@end
