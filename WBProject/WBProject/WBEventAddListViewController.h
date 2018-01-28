//
//  WBEventAddListViewController.h
//  WBProject
//
//  Created by feeyo on 2018/1/28.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^list)(NSArray *array);
@interface WBEventAddListViewController : UIViewController
@property  (nonatomic, copy)  list  listArray;
@end
