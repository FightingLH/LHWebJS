//
//  WBPasswordBussiness.m
//  WBProject
//
//  Created by feeyo on 2018/1/29.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBPasswordBussiness.h"
#define kLocalPassWord   @"kLocalPassWord"

@implementation WBPasswordBussiness

- (void)validWithChooseArray:(NSArray *)chooseArray
{
    NSArray  *localPassAry = [[NSUserDefaults standardUserDefaults]objectForKey: kLocalPassWord];
    NSArray *drawArray = chooseArray;
    if (localPassAry.count >= 2 && drawArray.count >= 2 && [self isTruePassword:localPassAry withChooseArray:chooseArray]) {
        if (self.passDelegate) {
            [[NSUserDefaults standardUserDefaults] setValue:chooseArray forKey:kLocalPassWord];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self.passDelegate validPasswordWithTypeback:WBPasswordValidTypeSuccess];
        }
    }else if(localPassAry.count >= 2 && ![self isTruePassword:localPassAry withChooseArray:chooseArray])
    {
        if (self.passDelegate) {
            [self.passDelegate validPasswordWithTypeback:WBPasswordValidTypeFailWithPassword];
        }
    }else if(localPassAry.count < 2 && drawArray.count >= 2)
    {
        if (self.passDelegate) {
            [[NSUserDefaults standardUserDefaults] setValue:chooseArray forKey:kLocalPassWord];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self.passDelegate validPasswordWithTypeback:WBPasswordValidTypeNOPassword];
        }
    }else if(localPassAry.count < 2 && drawArray.count < 2)
    {
        if (self.passDelegate) {
            [self.passDelegate validPasswordWithTypeback:WBPasswordValidTypePasswordSubmit];
        }
    }
}

- (BOOL)isTruePassword:(NSArray *)passwory withChooseArray:(NSArray *)chooseArray
{
    if (passwory.count != chooseArray.count) {
        return NO;
    }
    for (NSInteger i = 0; i < passwory.count; i++) {
        if (![passwory[i] isEqualToString:chooseArray[i]]) {
            return NO;
        }
    }
    return YES;
}
@end
