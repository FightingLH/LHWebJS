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
#import "WBHomeBusiness.h"
#import "MJRefresh.h"
#import "IQKeyboardManager.h"

static NSString *oneCellId = @"WBHomeOneCell";
static NSString *twoCellId = @"WBHomeTwoCell";
static NSString *thrCellId = @"WBHomeThreeCell";

@interface WBHomeViewController ()<UITableViewDelegate,WBHomeBusinessPresenter>
@property  (nonatomic, strong)  UITableView              *tableView;
@property  (nonatomic, strong)  WBHomeTableDelegate      *homeDelegate;
@property  (nonatomic, strong)  WBHomeTableDataSource    *homeDataSource;
@property  (nonatomic, strong)  WBHomeBusiness           *homeBusiness;
@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    [self.view addSubview:self.tableView];
    self.homeDelegate = [[WBHomeTableDelegate alloc]init];
    self.homeDataSource = [[WBHomeTableDataSource alloc]initWithTableView:self.tableView];
    self.homeBusiness = [[WBHomeBusiness alloc]init];
    self.homeBusiness.homeBusinessDelegate = self;
    
    
    self.tableView.delegate = self.homeDelegate;
    self.tableView.dataSource = self.homeDataSource;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.mj_header beginRefreshing];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[IQKeyboardManager sharedManager] setEnable:YES];
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[IQKeyboardManager sharedManager] setEnable:NO];
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --homeBusinessDelegate

- (void)loadNewData
{
    self.homeDataSource.dataList = @[];
    self.homeDelegate.dataList = @[];
    [self.tableView reloadData];
    [self.homeBusiness pullToServiceForData];
}

- (void)requestServiecCallBackModel:(id)model
{
    NSLog(@"business----->>>%@",model);
    self.homeDataSource.dataList = @[@[@{@"cellId":oneCellId}],@[@{@"cellId":twoCellId}],@[@{@"cellId":thrCellId},@{@"cellId":thrCellId},@{@"cellId":thrCellId},@{@"cellId":thrCellId}]];
    self.homeDelegate.dataList = @[@[@{@"cellId":oneCellId}],@[@{@"cellId":twoCellId}],@[@{@"cellId":thrCellId},@{@"cellId":thrCellId},@{@"cellId":thrCellId},@{@"cellId":thrCellId}]];
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
}

- (void)requestServiceCallBackJson:(id)json
{
    NSLog(@"business----->>>%@",json);
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.backgroundView.backgroundColor = [UIColor whiteColor];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
    
}
@end
