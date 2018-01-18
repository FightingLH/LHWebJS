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
#import <AFNetworking/AFNetworking.h>
@interface WBHomeViewController ()<UITableViewDelegate>
@property  (nonatomic, strong)  UITableView  *tableView;
@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"home";
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];   //请求
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer]; //响应
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/plain", nil];
    [sessionManager GET:@"" parameters:@{} progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        WBHomeModel *mainModel = [WBHomeModel yy_modelWithDictionary:dict[@"data"]];
        NSLog(@"%@",mainModel.ad);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
    }
    return _tableView;
    
}
@end
