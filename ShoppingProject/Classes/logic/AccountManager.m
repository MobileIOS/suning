//
//  AccountManager.m
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "AccountManager.h"
#import "ManagerUtil.h"
#import "MJExtension.h"
#import <SSKeychain/SSKeychain.h>
#import "HTTPFacade.h"
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

+(void)signIn:(AccountModel*)account callback:(ManagerCallBack*)callback
{
    HttpCallBack* http = [ManagerUtil defaultHttpCallBack:callback process:^id(NSDictionary* dict){
        
        AccountModel* result = [AccountModel mj_objectWithKeyValues:dict];
        ManagerEvent* event;
        if (result) {
            event = [ManagerEvent toast:nil title:@"登录成功"];
            [AccountManager sharedAccountManager].account = result;
            [[AccountManager sharedAccountManager] saveAccount];
        }
        
        return event;
    }];
    
    
    [HTTPFacade signIn:account callback:http];
}


-(void)saveAccount
{
    if (self.account) {
//        NSString *uid = self.account.uid;
//        NSString *token = self.account.token;
//        NSString *username = self.account.username;
//        NSString *lock = self.account.lock;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.account.uid forKey:@"uid"];
         [defaults setObject:self.account.username forKey:@"username"];
         [defaults setObject:self.account.token forKey:@"token"];
        [defaults synchronize];
        
    }
    
}
@end
