//
//  ManagerUtil.h
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ManagerUtil : NSObject

+(HttpCallBack*)defaultHttpCallBack:(ManagerCallBack*)callback process:(ManagerProcessBlock)processBlock;

@end
