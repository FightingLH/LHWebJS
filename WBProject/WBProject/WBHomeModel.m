//
//  WBHomeModel.m
//  WBProject
//
//  Created by 李欢 on 2018/1/8.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBHomeModel.h"

@implementation WBHomeTicketsModel

@end


@implementation WBHomeCardsModel

@end

@implementation WBHomeModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"cards":[WBHomeCardsModel class]
             };
}

@end
