//
//  WBHomeOneModel.m
//  WBProject
//
//  Created by 李欢 on 2018/1/18.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBHomeOneModel.h"

@implementation WBHomeOneDetailModel

@end

@implementation WBHomeOneModel

- (BOOL)empty
{
    if (!self.viewModel)
    {
        return YES;
    }
    return NO;
}

- (float)height
{
    return 50.0f;
}

- (float)width
{
    return 320.0f;
}

- (NSInteger)location
{
    return 2;
}

- (BOOL)show
{
    return YES;
}

@end
