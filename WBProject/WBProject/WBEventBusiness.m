//
//  WBEventBusiness.m
//  WBProject
//
//  Created by feeyo on 2018/1/28.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBEventBusiness.h"

@implementation WBEventBusiness
- (void)requestService
{
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0* NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        if (self.eventDelegate) {
            [self.eventDelegate getEventControllerViewModel:@""];
            [self.eventDelegate getEventJSON:@""];
        }
    });
}


@end
