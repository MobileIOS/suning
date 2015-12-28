//
//  AccountManager.m
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "AccountManager.h"

@implementation AccountManager

+(AccountManager*) sharedAccountManager
{
    static AccountManager *sharedAccountManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAccountManager = [[self alloc] init];
    });
    return sharedAccountManager;
}
@end
