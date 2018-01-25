//
//  WBHomeTwoCell.h
//  WBProject
//
//  Created by feeyo on 2018/1/25.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBHomeCommonCell.h"

@interface WBHomeTwoCell : WBHomeCommonCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end
