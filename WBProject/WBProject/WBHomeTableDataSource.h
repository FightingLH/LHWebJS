//
//  WBHomeTableDataSource.h
//  WBProject
//
//  Created by feeyo on 2018/1/23.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WBHomeCommonCellPresenter.h"

@interface WBHomeTableDataSource : NSObject<UITableViewDataSource,WBHomeCommonCellPresenter>
- (instancetype)initWithTableView:(UITableView *)tableView;
@property  (nonatomic, copy)  NSArray   *dataList;
@end
