//
//  WBHomeViewController.m
//  WBProject
//
//  Created by 李欢 on 2018/1/8.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBHomeViewController.h"
#import "WBHomeTableDelegate.h"
#import "WBHomeTableDataSource.h"


@interface WBHomeViewController ()<UITableViewDelegate>
@property  (nonatomic, strong)  UITableView  *tableView;
@property  (nonatomic, strong)  WBHomeTableDelegate *homeDelegate;
@property  (nonatomic, strong)  WBHomeTableDataSource *homeDataSource;
@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"home";
    self.homeDelegate = [[WBHomeTableDelegate alloc]init];
    self.homeDataSource = [[WBHomeTableDataSource alloc]init];
    self.homeDataSource.dataList = @[@"1",@"2",@"3",@"1",@"2",@"3",@"1",@"2",@"3"];
    self.homeDelegate.dataList = @[@"1",@"2",@"3",@"1",@"2",@"3",@"1",@"2",@"3"];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self.homeDelegate;
    self.tableView.dataSource = self.homeDataSource;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    }
    return _tableView;
    
}
@end
