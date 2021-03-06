//
//  WBEventViewController.m
//  WBProject
//
//  Created by feeyo on 2018/1/26.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBEventViewController.h"
#import "WBEventBusiness.h"
#import "JSAnimatedImagesView.h"
#import "WBEventViewController+WBEventControlCategory.h"
#import "WBEventTableDelegate.h"
#import "WBEventTableDatasource.h"
#import "MJRefresh.h"
#import "WBEventRouter.h"

#define kTextValid  getEventControllerViewModel
@interface WBEventViewController ()<WBEventBusinessPresenter,JSAnimatedImagesViewDelegate,WBEventRouterPresenter>
@property  (nonatomic, strong)  WBEventBusiness           *eventBusiness;
@property  (nonatomic, strong ) JSAnimatedImagesView      *animatedImages;
@property  (nonatomic, strong)  UITableView               *tableView;
@property  (nonatomic, strong)  WBEventTableDelegate      *tabDelegate;
@property  (nonatomic, strong)  WBEventTableDatasource    *tabDataSource;
@property  (nonatomic, strong)  WBEventRouter             *router;
@property  (nonatomic, copy)    NSArray                   *dataList;

@property  (nonatomic, strong)  UIButton                  *addEventBtn;
@end

@implementation WBEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"事件";
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.31f green:0.73f blue:0.88f alpha:1.00f];;
//
//    self.animatedImages = [[JSAnimatedImagesView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
//    [self.view addSubview:self.animatedImages];
//    self.animatedImages.delegate = self;
//    self.animatedImages.userInteractionEnabled = YES;
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMoreList)];
   
    
    self.tabDelegate = [[WBEventTableDelegate alloc]init];
    self.tabDataSource = [[WBEventTableDatasource alloc]init];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];
    self.tableView.delegate = self.tabDelegate;
    self.tableView.dataSource = self.tabDataSource;
    
    self.eventBusiness = [[WBEventBusiness alloc]init];
    self.eventBusiness.eventDelegate = self;
    [self.eventBusiness requestService];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.mj_header beginRefreshing];
   
    self.router = [[WBEventRouter alloc]init];
    self.router.eventRouterDelegate = self;
    
    
    [self.view addSubview:self.addEventBtn];
    [self.addEventBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.bottom.equalTo(self.view.mas_bottom).offset(-64);
        make.width.mas_equalTo(44);
        make.height.mas_equalTo(44);
    }];
    
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear: animated];
//     [self.animatedImages startAnimating];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
//    [self.animatedImages stopAnimating];
}

- (void)loadNewData
{
    [self.eventBusiness requestService];
}

- (void)addMoreList
{
    [self.router toNextControlWithCurrentControl:self withAction:@""];
}


#pragma mark -service delegate
- (void)kTextValid:(id)model
{
    self.tabDataSource.dataList = self.dataList;
    self.tabDelegate.dataList = self.dataList;
    [self.tableView reloadData];
     [self.tableView.mj_header endRefreshing];
}

#pragma mark -router delegate
- (void)getFromNextControlWithAction:(NSArray *)model
{
    NSMutableArray *data = self.dataList.mutableCopy;
    [data insertObject:model atIndex:0];
    self.dataList = data.copy;
    self.tabDataSource.dataList = self.dataList;
    self.tabDelegate.dataList = self.dataList;
    [self.tableView reloadData];
    
}

#pragma mark -背景动画

- (NSUInteger)animatedImagesNumberOfImages:(JSAnimatedImagesView *)animatedImagesView
{
    return 2;
}

- (UIImage *)animatedImagesView:(JSAnimatedImagesView *)animatedImagesView imageAtIndex:(NSUInteger)index
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"event_0%ld.jpg", index + 1]];
}



- (void)dealloc
{
    [_animatedImages removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundView.backgroundColor = [UIColor clearColor];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
         _tableView.estimatedRowHeight = 100;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
    
}

- (NSArray *)dataList
{
    if (!_dataList) {
        _dataList = @[@[@"事件"],@[@"纪念日"],@[@"会议"]];;
    }
    return _dataList;
}

- (UIButton *)addEventBtn
{
    if (!_addEventBtn) {
        _addEventBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addEventBtn setBackgroundImage:[UIImage imageNamed:@"event_add"] forState:UIControlStateNormal];
        [_addEventBtn addTarget:self action:@selector(addMoreList) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addEventBtn;
}
@end
