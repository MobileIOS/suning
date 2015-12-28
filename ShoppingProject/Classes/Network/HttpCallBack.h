//
//  HttpCallBack.h
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^HttpBasicBlock)(void);
typedef void (^HttpResultBlock)(id result);
typedef void (^HttpProgressBlock)(unsigned long long size, unsigned long long total);

@interface HttpCallBack : NSObject

@property (nonatomic, copy) HttpBasicBlock startBlock;
@property (nonatomic, copy) HttpResultBlock doneBlock;
@property (nonatomic, copy) HttpResultBlock errorBlock;

@end
