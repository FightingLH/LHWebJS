//
//  WBHomeModel.h
//  WBProject
//
//  Created by 李欢 on 2018/1/8.
//  Copyright © 2018年 lihuan. All rights reserved.
//
//mainModel -下放数据模型包括数据和属性
#import <Foundation/Foundation.h>
#import "WBHomeOneModel.h"


@interface WBHomeTicketsModel:NSObject
@property  (nonatomic, copy)    NSString       *title;
@property  (nonatomic, assign)  NSInteger      level;
@end

@interface WBHomeCardsModel:NSObject
@property  (nonatomic, copy)    NSString       *Id;
@property  (nonatomic, copy)    NSString       *title;
@property  (nonatomic, assign)  NSInteger      level;

#pragma mark -transform
@property  (nonatomic, copy)    NSString       *transform_title;
@end


@interface WBHomeEntity : NSObject
@property  (nonatomic, strong)   WBHomeOneModel *model;
@end
