//
//  APIConfiguration.h
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  接口
 */
@interface APIConfiguration : NSObject
/**
 *  baseUrl
 */
@property (nonatomic, strong) NSString *domain;
@property (nonatomic, strong) NSString *login;

@property (nonatomic, strong) NSString *druglistUrl;


+ (APIConfiguration *)sharedAPIConfiguration;


@end
