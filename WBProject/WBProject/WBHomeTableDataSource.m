//
//  WBHomeTableDataSource.m
//  WBProject
//
//  Created by feeyo on 2018/1/23.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBHomeTableDataSource.h"
#import "WBHomeOneCell.h"

@implementation WBHomeTableDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WBHomeOneCell *cell = [WBHomeOneCell cellWithTableView:tableView];
    return cell;
}

- (void)clickCellWithCallBack:(id)model
{
    NSLog(@"%@",model);
}
@end
