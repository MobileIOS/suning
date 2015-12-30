//
//  BaseResultModel.h
//  ShoppingProject
//
//  Created by stvenfor on 15/12/30.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrugListResultModel.h"

@interface BaseResultModel : NSObject

@property (nonatomic, assign) double errorCode;
@property (nonatomic, strong) DrugListResultModel *result;
@property (nonatomic, strong) NSString *reason;
@end
