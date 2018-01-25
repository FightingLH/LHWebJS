//
//  WBHomeTableDataSource.m
//  WBProject
//
//  Created by feeyo on 2018/1/23.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBHomeTableDataSource.h"
#import "WBHomeOneCell.h"
#import "WBHomeTwoCell.h"

@implementation WBHomeTableDataSource

- (instancetype)initWithTableView:(UITableView *)tableView
{
    if (self == [super init]) {
        [tableView registerNib:[UINib nibWithNibName:@"WBHomeOneCell" bundle:nil] forCellReuseIdentifier:@"WBHomeOneCell"];
         [tableView registerNib:[UINib nibWithNibName:@"WBHomeTwoCell" bundle:nil] forCellReuseIdentifier:@"WBHomeTwoCell"];
    }
    return self;
}

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
    WBHomeCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:_dataList[indexPath.section][indexPath.row][@"cellId"] forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.cellDelegate = self;
    return cell;
}

- (void)clickCellWithCallBack:(id)model
{
    NSLog(@"%@",model);
}
@end
