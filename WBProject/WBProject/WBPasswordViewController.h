//
//  WBPasswordViewController.h
//  WBProject
//
//  Created by feeyo on 2018/1/29.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^validPasswordBlock)(BOOL show);

@interface WBPasswordViewController : UIViewController
+ (void)configWithWindow:(UIWindow *)window showRootControl:(validPasswordBlock)block;
@end
