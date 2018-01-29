//
//  WBPasswordButtonView.h
//  WBProject
//
//  Created by feeyo on 2018/1/29.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBPasswordButtonViewPresenter.h"
@interface WBPasswordButtonView : UIView

@property  (nonatomic, weak)  id<WBPasswordButtonViewPresenter>passviewDelegate;
@end
