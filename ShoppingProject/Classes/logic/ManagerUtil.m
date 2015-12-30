//
//  ManagerUtil.m
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "ManagerUtil.h"
#import "AccountManager.h"

@implementation ManagerUtil

+(HttpCallBack*)defaultHttpCallBack:(ManagerCallBack*)callback process:(ManagerProcessBlock)processBlock
{
    HttpCallBack* http = [[HttpCallBack alloc] init];
    
    http.startBlock = nil;
    
    http.doneBlock = ^(id result){
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary* dict = (NSDictionary*)result;
            NSInteger code = [dict[@"error_code"] integerValue];
            if (code == 0) {
                
                NSMutableDictionary *dict1 = [NSMutableDictionary dictionaryWithDictionary:dict];
                [dict1 removeObjectForKey:@"error_code"];
                [dict1 removeObjectForKey:@"reason"];
                id processResult = processBlock(dict1);
                callback.updateBlock(processResult);
                
            }
        }
    };

    http.errorBlock = ^(id result){
        if (callback.errorBlock) {
           
        }
    };
    
    return http;
}
@end
