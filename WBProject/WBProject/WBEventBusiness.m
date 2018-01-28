//
//  WBEventBusiness.m
//  WBProject
//
//  Created by feeyo on 2018/1/28.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBEventBusiness.h"
#import <AFNetworking/AFNetworking.h>

@implementation WBEventBusiness
- (void)requestService
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer= [AFJSONRequestSerializer serializer];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"text/json", nil];
    [session GET:@"http://localhost/Login/login.php" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.eventDelegate) {
            [self.eventDelegate getEventControllerViewModel:@""];
            [self.eventDelegate getEventJSON:@""];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
    }];
    
    
}


@end
