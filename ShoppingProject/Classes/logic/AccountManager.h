//
//  AccountManager.h
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountModel.h"

@interface AccountManager : NSObject

@property(nonatomic,copy)AccountModel* account;

+(AccountManager*) sharedAccountManager;
@end
