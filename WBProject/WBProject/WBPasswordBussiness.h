//
//  WBPasswordBussiness.h
//  WBProject
//
//  Created by feeyo on 2018/1/29.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBPasswordBusinessPresenter.h"

@interface WBPasswordBussiness : NSObject
- (void)validWithChooseArray:(NSArray *)chooseArray;
@property  (nonatomic, weak)  id<WBPasswordBusinessPresenter>passDelegate;
@end
