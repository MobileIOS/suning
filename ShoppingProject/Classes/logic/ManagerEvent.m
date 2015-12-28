//
//  ManagerEvent.m
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "ManagerEvent.h"

@implementation ManagerEvent


+(ManagerEvent*)toast:(NSString*)info title:(NSString*)title
{
    ManagerEvent* event = [[ManagerEvent alloc] init];
    event.type = EManagerEventToast;
    event.info = info;
    event.title = title;
    return event;
}

+(ManagerEvent*)alert:(NSString*)info title:(NSString*)title
{
    ManagerEvent* event = [[ManagerEvent alloc] init];
    event.type = EManagerEventAlert;
    event.info = info;
    event.title = title;
    return event;
}

+(ManagerEvent*)load:(NSString*)info title:(NSString*)title
{
    ManagerEvent* event = [[ManagerEvent alloc] init];
    event.type = EManagerEventLoad;
    event.info = info;
    event.title = title;
    return event;
}

+(ManagerEvent*)expired
{
    ManagerEvent* event = [[ManagerEvent alloc] init];
    event.type = EManagerEventExpired;
    return event;
}

+(ManagerEvent*)event:(NSString*)info code:(NSInteger)code
{
    ManagerEvent* event = [[ManagerEvent alloc] init];
    event.info = info;
    event.code = code;
    return event;
}

@end
