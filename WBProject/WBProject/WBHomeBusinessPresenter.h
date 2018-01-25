//
//  WBHomeBusinessPresenter.h
//  WBProject
//
//  Created by feeyo on 2018/1/25.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WBHomeBusinessPresenter <NSObject>
@optional
- (void)requestServiceCallBackJson:(id)json;
- (void)requestServiecCallBackModel:(id)model;
@end
