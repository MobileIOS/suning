//
//  ProjectManager.h
//  ShoppingProject
//
//  Created by stvenfor on 15/12/30.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectManager : NSObject


+(void)key:(NSString *)key callback:(ManagerCallBack*)callback;
@end
