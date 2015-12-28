//
//  ManagerEvent.h
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    EManagerEventToast,
    EManagerEventAlert,
    EManagerEventLoad,
    EManagerEventExpired,
} EManagerEventType;

@interface ManagerEvent : NSObject

@property(nonatomic, assign)EManagerEventType type;
@property(nonatomic, assign)NSInteger code;
@property(nonatomic, copy)NSString* info;
@property(nonatomic, copy)NSString* title;

// 通知类事件
+(ManagerEvent*)toast:(NSString*)info title:(NSString*)title;
+(ManagerEvent*)alert:(NSString*)info title:(NSString*)title;

+(ManagerEvent*)load:(NSString*)info title:(NSString*)title;

// 自定义公共事件
+(ManagerEvent*)expired;

+(ManagerEvent*)event:(NSString*)info code:(NSInteger)code;
@end
