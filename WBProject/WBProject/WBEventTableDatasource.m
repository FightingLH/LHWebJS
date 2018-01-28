//
//  WBEventTableDatasource.m
//  WBProject
//
//  Created by feeyo on 2018/1/28.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBEventTableDatasource.h"

@implementation WBEventTableDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataList[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"test"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_dataList[indexPath.section][indexPath.row]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"暂未处理(1%ld)",(long)indexPath.row];
    return cell;
}

@end
