//
//  HTTPFacade.m
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "HTTPFacade.h"
#import "AccountModel.h"
#import "AccountManager.h"
#import "HttpCallBack.h"
#import "AFNetworking.h"
#import "APIConfiguration.h"


@implementation HTTPFacade

+(NSDictionary*)defaultParameter
{
    NSString* uid ;
    NSString* token ;
    
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        NSLog(@"ONCE");
        HTTP_HEADER_CLIENT_OS = [UIDevice currentDevice].systemVersion;
        HTTP_HEADER_VERSION_NAME = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
        HTTP_HEADER_VERSION_CODE = @"1";
    });
    
    AccountModel* account = [AccountManager sharedAccountManager].account;
    if (account) {
        uid = account.uid;
        token = account.token;
    }
    
    uid = uid ? uid : @"";
    token = token ? token : @"";
    
    NSDictionary* parameter = @{
                                @"client":@"ios",
                                @"client_os":HTTP_HEADER_CLIENT_OS,
                                @"version_name":HTTP_HEADER_VERSION_NAME,
                                @"version_code":HTTP_HEADER_VERSION_CODE,
                                @"uid": uid,
                                @"utoken":token};
    return parameter;
}

//GET
+(NSUInteger) get:(NSString*)url parameter:(NSDictionary*)parameter callback:(HttpCallBack *)callback
{
    NSUInteger tag = 0;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    NSMutableDictionary* para = [ NSMutableDictionary dictionary];
    [para addEntriesFromDictionary:[self defaultParameter]];
    if (parameter) {
        [para addEntriesFromDictionary:parameter];
    }
    
    [manager             GET:url
                  parameters:para
                     success:^(AFHTTPRequestOperation *operation, id responseObject) {
                         callback.doneBlock(responseObject);
                     }
                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                         NSLog(@"Error: %@", error);
                         callback.errorBlock(error);
                     }];
    
    return tag;
}

//POST
+(NSUInteger) post:(NSString*)url parameter:(NSDictionary*)parameter callback:(HttpCallBack *)callback
{
    NSUInteger tag = 0;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    NSMutableDictionary* para = [ NSMutableDictionary dictionary];
    [para addEntriesFromDictionary:[self defaultParameter]];
    if (parameter) {
        [para addEntriesFromDictionary:parameter];
    }
    
    [manager            POST:url
                  parameters:para
                     success:^(AFHTTPRequestOperation *operation, id responseObject) {
                         callback.doneBlock(responseObject);
                     }
                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                         NSLog(@"Error: %@", error);
                         callback.errorBlock(error);
                     }];
    
    return tag;
}

//signin
+ (NSUInteger)signIn:(AccountModel*)account callback:(HttpCallBack *)callback
{
    NSUInteger tag = 0;
    
    NSString* url = [APIConfiguration sharedAPIConfiguration].login;
    //    NSString* name = [account.username stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSDictionary* parameter = nil;
    parameter = @{@"mobile" : account.mobile,
                  @"password" : account.password,
                  };
    tag = [self post:url parameter:parameter callback:callback];
    
    return tag;
}


@end
