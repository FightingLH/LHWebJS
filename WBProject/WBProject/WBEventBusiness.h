//
//  WBEventBusiness.h
//  WBProject
//
//  Created by feeyo on 2018/1/28.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBEventBusinessPresenter.h"

@interface WBEventBusiness : NSObject<WBEventBusinessPresenter>
@property  (nonatomic, weak)  id<WBEventBusinessPresenter>eventDelegate;
- (void)requestService;
@end
