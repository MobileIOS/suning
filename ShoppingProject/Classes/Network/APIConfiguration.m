//
//  APIConfiguration.m
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "APIConfiguration.h"

@implementation APIConfiguration

- (NSString *)APIUrlWithPath:(NSString *)path
{
    return [NSString stringWithFormat:@"%@%@",self.domain,path];
}

//初始化设置
- (void)writeDefaultConfiguration{
   //提供接口访问
#ifdef DEBUG
    //Test 环境
    self.domain = @"";
#else
    //正式环境
    self.domain = @"";
#endif
    
    //拼接访问接口
    
    
}

- (id)init
{
    if (self = [super init]) {
        [self writeDefaultConfiguration];
       
    }
    return self;
}

+ (APIConfiguration *)sharedAPIConfiguration
{
    static APIConfiguration *sharedAPIConfiguration = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAPIConfiguration = [[self alloc] init];
    });
    return sharedAPIConfiguration;
}

@end
