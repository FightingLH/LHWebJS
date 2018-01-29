//
//  WBPasswordBusinessPresenter.h
//  WBProject
//
//  Created by feeyo on 2018/1/29.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,WBPasswordValidType)
{
    WBPasswordValidTypeSuccess,//有原始密码、成功登陆
    WBPasswordValidTypeFailWithPassword,//有原始密码、登录失败(绘制数据有误、数组不同)
    WBPasswordValidTypeNOPassword,//没有原始密码、设置密码成功
    WBPasswordValidTypePasswordSubmit//没有原始密码、设置密码有误
};

@protocol WBPasswordBusinessPresenter <NSObject>
- (void)validPasswordWithTypeback:(WBPasswordValidType)type;
@end
