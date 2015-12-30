//
//  DrugListResultModel.h
//  ShoppingProject
//
//  Created by stvenfor on 15/12/30.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DrugListResultModel : NSObject

@property (nonatomic, assign) NSInteger num;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, assign) NSInteger totalCount;
@property (nonatomic, assign) NSInteger skip;

@end
