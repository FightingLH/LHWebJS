//
//  WBHomeViewController.m
//  WBProject
//
//  Created by 李欢 on 2018/1/8.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBHomeViewController.h"
#import "WBHomeModel.h"
#import <YYModel/YYModel.h>
@interface WBHomeViewController ()

@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"home";
    
    WBHomeModel *model =[WBHomeModel yy_modelWithDictionary:@{@"name":@(13),@"age":@"nv",@"sex":@"x",@"cards":@{@"title":@"标题"}}];
    NSLog(@"%@---%@---%@--%@",model.name,@(model.age),@(model.sex),model.cards.title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
