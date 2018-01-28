//
//  WBEventRouter.h
//  WBProject
//
//  Created by feeyo on 2018/1/28.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBEventRouterPresenter.h"
#import <UIKit/UIKit.h>

@interface WBEventRouter : NSObject
@property  (nonatomic, weak) id<WBEventRouterPresenter>eventRouterDelegate;
- (void)toNextControlWithCurrentControl:(UIViewController *)control withAction:(id)action;
@end
