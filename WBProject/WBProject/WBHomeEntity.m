//
//  WBHomeModel.m
//  WBProject
//
//  Created by 李欢 on 2018/1/8.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import "WBHomeEntity.h"


@implementation WBHomeTicketsModel

@end


@implementation WBHomeCardsModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"Id"  : @"id"};
}

- (NSString *)transform_title
{
    return self.title;
}
@end


@implementation WBHomeEntity

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {

    return @{
             @"cards":@"WBHomeCardsModel",
             @"tickets" : [WBHomeTicketsModel class],

             };
}



@end
