//
//  WBEventTableDatasource.m
//  WBProject
//
//  Created by feeyo on 2018/1/28.
//  Copyright © 2018年 lihuan. All rights reserved.
//
//http://www.zcool.com.cn/work/ZMTc1MjgxMTY=.html
#import "WBEventTableDatasource.h"
#import "WBEventTableViewCell.h"

@implementation WBEventTableDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WBEventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
    if (!cell) {
        cell = [[WBEventTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
