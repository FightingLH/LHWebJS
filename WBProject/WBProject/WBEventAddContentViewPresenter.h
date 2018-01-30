//
//  WBEventAddContentViewPresenter.h
//  WBProject
//
//  Created by feeyo on 2018/1/30.
//  Copyright © 2018年 lihuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WBEventAddContentViewPresenter <NSObject>
@optional
- (void)fetchRemindContent:(NSString *)content;
- (void)fetchNoteContent:(NSString *)content;
@end
