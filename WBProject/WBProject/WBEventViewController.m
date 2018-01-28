//
//  WBEventViewController.m
//  WBProject
//
//  Created by feeyo on 2018/1/26.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBEventViewController.h"
#import "WBEventBusiness.h"

@interface WBEventViewController ()<WBEventBusinessPresenter>
@property  (nonatomic, strong)  WBEventBusiness  *eventBusiness;

@end

@implementation WBEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"事件";
    self.view.backgroundColor = [UIColor whiteColor];
    self.eventBusiness = [[WBEventBusiness alloc]init];
    self.eventBusiness.eventDelegate = self;
}


#pragma mark -service delegate
- (void)getEventControllerViewModel:(id)model
{
    
}

- (void)getEventJSON:(id)json
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
