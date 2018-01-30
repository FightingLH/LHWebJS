//
//  WBEventAddListViewController.m
//  WBProject
//
//  Created by feeyo on 2018/1/28.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBEventAddListViewController.h"
#import "WBEventAddContentView.h"
#import "WBEventAddSubContenView.h"
#import "WBEventAddTimeView.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface WBEventAddListViewController ()
@property  (nonatomic, strong)  WBEventAddContentView *addContent;
@property  (nonatomic, strong)  WBEventAddContentView *addNote;

@property  (nonatomic, strong)  WBEventAddTimeView         *timeView;
@property  (nonatomic, strong)  WBEventAddSubContenView *repeatClick;
@property  (nonatomic, strong)  WBEventAddSubContenView *remindLock;

@end

@implementation WBEventAddListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kBackGroundColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"event_back"] style:UIBarButtonItemStylePlain target:self action:@selector(addMoreList)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"event_save"] style:UIBarButtonItemStylePlain target:self action:@selector(addMoreList)];
    [self.view addSubview:self.addContent];
    
    [self.addContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(5);
        make.right.equalTo(self.view.mas_right).offset(-5);
        make.top.equalTo(self.view).offset(10);
        make.height.mas_equalTo(100);
    }];
    
    [self.view addSubview:self.addNote];
    [self.addNote mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.addContent.mas_left);
        make.top.equalTo(self.addContent.mas_bottom).offset(10);
        make.right.equalTo(self.addContent.mas_right);
        make.height.mas_equalTo(60);
    }];
    
    [self.view addSubview:self.timeView];
    [self.timeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.addNote.mas_bottom).offset(10);
        make.height.mas_equalTo(50);
    }];
    
    
    [self.view addSubview:self.remindLock];
    [self.remindLock mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.timeView.mas_bottom).offset(10);
        make.height.mas_equalTo(44);
    }];
    
    [self.view addSubview:self.repeatClick];
    [self.repeatClick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.remindLock.mas_bottom).offset(10);
        make.height.mas_equalTo(44);
    }];
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

- (void)addMoreList
{
    if (self.listArray) {
        self.listArray(@[@"新增数据"]);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (WBEventAddTimeView *)timeView
{
    if(!_timeView)
    {
        _timeView = [[WBEventAddTimeView alloc]init];
    }
    return _timeView;
}

- (WBEventAddSubContenView *)remindLock
{
    if (!_remindLock) {
        _remindLock = [[WBEventAddSubContenView alloc]init];
    }
    return _remindLock;
}

- (WBEventAddSubContenView *)repeatClick
{
    if (!_repeatClick) {
        _repeatClick = [[WBEventAddSubContenView alloc]init];
    }
    return _repeatClick;
}

- (WBEventAddContentView *)addNote
{
    if (!_addNote) {
       _addNote = [[WBEventAddContentView alloc]init];
    }
    return _addNote;
}

- (WBEventAddContentView *)addContent
{
    if (!_addContent) {
        _addContent = [[WBEventAddContentView alloc]init];
    }
    return _addContent;
}
@end
