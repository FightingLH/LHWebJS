//
//  WBHomeOneModel.h
//  WBProject
//
//  Created by 李欢 on 2018/1/18.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WBHomeOneDetailModel : NSObject

@end

//
@interface WBHomeOneModel : NSObject
//原始数据
@property  (nonatomic, strong)  WBHomeOneDetailModel *serviceModel;
//是否为空
@property  (nonatomic, assign)  BOOL                 empty;
//高度
@property  (nonatomic, assign)  float                height;
//宽度
@property  (nonatomic, assign)  float                width;
//位置
@property  (nonatomic, assign)  NSInteger            location;
//是否需要展示
@property  (nonatomic, assign)  BOOL                 show;

@end
