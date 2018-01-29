//
//  WBPasswordViewController.m
//  WBProject
//
//  Created by feeyo on 2018/1/29.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBPasswordViewController.h"
#import "WBPasswordButtonView.h"

@interface WBPasswordViewController ()<WBPasswordButtonViewPresenter>
@property  (nonatomic, strong)   WBPasswordButtonView   *passWordView;
@property  (nonatomic, copy)     validPasswordBlock      result;
@end

@implementation WBPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.passWordView  = [[WBPasswordButtonView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.passWordView.passviewDelegate = self;
    [self.view addSubview:self.passWordView];
}

#pragma mark -valid result delegate
- (void)validResultShowUser:(BOOL)result
{
    if (result) {
        [self.passWordView removeFromSuperview];
        self.passWordView = nil;
        pageVC = nil;
        if (self.result) {
            self.result(result);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


static WBPasswordViewController *pageVC = nil;
+ (void)configWithWindow:(UIWindow *)window showRootControl:(validPasswordBlock)block
{
    pageVC = [[WBPasswordViewController alloc]init];
    pageVC.result = block;
    [window addSubview:pageVC.view];
}
@end
