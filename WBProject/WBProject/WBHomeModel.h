//
//  WBHomeModel.h
//  WBProject
//
//  Created by 李欢 on 2018/1/8.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBHomeTicketsModel:NSObject
@property  (nonatomic, copy)    NSString       *title;
@property  (nonatomic, assign)  NSInteger      level;
@end

@interface WBHomeCardsModel:NSObject
@property  (nonatomic, copy)    NSString       *title;
@property  (nonatomic, assign)  NSInteger      level;
@end

@interface WBHomeModel : NSObject
@property  (nonatomic,  copy)    NSString      *name;
@property  (nonatomic,  assign)  NSInteger     age;
@property  (nonatomic,  assign)  BOOL          sex;
@property  (nonatomic,  strong)  WBHomeCardsModel  *cards;//模型
@property  (nonatomic,  strong)  NSArray       *tickets;
@end
