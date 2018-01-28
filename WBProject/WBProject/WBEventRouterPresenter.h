//
//  WBEventRouterPresenter.h
//  WBProject
//
//  Created by feeyo on 2018/1/28.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WBEventRouterPresenter <NSObject>
- (void)getFromNextControlWithAction:(NSArray *)model;
@end
