//
//  HTTPFacade.h
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountModel.h"

static NSString *HTTP_HEADER_CLIENT_OS;
static NSString *HTTP_HEADER_VERSION_NAME;
static NSString *HTTP_HEADER_VERSION_CODE;

@interface HTTPFacade : NSObject

//封装默认参数
+(NSDictionary*)defaultParameter;

+ (NSUInteger)signIn:(AccountModel*)account callback:(HttpCallBack *)callback;
//请求药品列表
+ (NSUInteger)key:(NSString*)key callback:(HttpCallBack *)callback;

@end
