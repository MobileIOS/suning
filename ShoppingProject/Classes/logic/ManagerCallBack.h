//
//  ManegerCallBack.h
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ManagerBasicBlock)(void);
typedef void (^ManagerResultBlock)(id result);
typedef id   (^ManagerProcessBlock)(NSDictionary* result);

@interface ManagerCallBack : NSObject

@property (nonatomic, copy) ManagerResultBlock loadBlock;
@property (nonatomic, copy) ManagerResultBlock updateBlock;
@property (nonatomic, copy) ManagerResultBlock errorBlock;
@end
