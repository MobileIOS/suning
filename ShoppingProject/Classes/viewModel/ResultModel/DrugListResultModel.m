//
//  DrugListResultModel.m
//  ShoppingProject
//
//  Created by stvenfor on 15/12/30.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "DrugListResultModel.h"
#import "DrugListModel.h"

@implementation DrugListResultModel

+ (NSDictionary *)objectClassInArray
{
    return @{
             @"list" : [DrugListModel class]
             };
}


@end
