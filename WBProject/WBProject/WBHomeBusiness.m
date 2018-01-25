//
//  WBHomeBusiness.m
//  WBProject
//
//  Created by feeyo on 2018/1/23.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBHomeBusiness.h"
#import "WBHomeEntity.h"
#import <YYModel/YYModel.h>
#import <AFNetworking/AFNetworking.h>

@implementation WBHomeBusiness
- (void)requestTest
{
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];   //请求
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer]; //响应
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/plain", nil];
    [sessionManager GET:@"" parameters:@{} progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        WBHomeEntity *mainModel = [WBHomeEntity yy_modelWithDictionary:dict[@"data"]];
        NSLog(@"%@",mainModel.model);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
@end
