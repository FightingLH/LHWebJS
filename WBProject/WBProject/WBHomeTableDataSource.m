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
    WBHomeOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
    if (!cell) {
        cell = [[WBHomeOneCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test"];
    }
    cell.nameLabel.text = [NSString stringWithFormat:@"测试顺序%@",@(indexPath.row)];
    cell.cellDelegate = self;
    return cell;
}

- (void)clickCellWithCallBack:(id)model
{
    NSLog(@"%@",model);
}
@end
