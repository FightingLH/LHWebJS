//
//  WBEventRouter.m
//  WBProject
//
//  Created by feeyo on 2018/1/28.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBEventRouter.h"
#import "WBEventAddListViewController.h"

@implementation WBEventRouter

- (void)toNextControlWithCurrentControl:(UIViewController *)control withAction:(id)action
{
    WBEventAddListViewController *list = [[WBEventAddListViewController alloc]init];
    list.listArray = ^(NSArray *array) {
        if (self.eventRouterDelegate) {
            [self.eventRouterDelegate getFromNextControlWithAction:array];
        }
    };
    list.hidesBottomBarWhenPushed = YES;
    [control.navigationController pushViewController:list animated:YES];
}
@end
