//
//  WBHomeBusiness.h
//  WBProject
//
//  Created by feeyo on 2018/1/23.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBHomeBusinessPresenter.h"

@interface WBHomeBusiness : NSObject<WBHomeBusinessPresenter>
@property  (nonatomic, weak)   id<WBHomeBusinessPresenter>homeBusinessDelegate;
- (void)pullToServiceForData;
@end
