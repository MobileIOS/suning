//
//  DBHelper.h
//  ShoppingProject
//
//  Created by stvenfor on 16/1/7.
//  Copyright © 2016年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface DBHelper : NSObject {
    FMDatabase* _database;
    NSMutableArray* _daos;
}


@property (nonatomic, readonly) FMDatabase* database;

+ (DBHelper*)sharedService;

- (void)initDatabaseWith:(NSString*)userAccount;

/*
 * 清除数据库
 */
- (void)clearDatabase;

/*
 * 打开数据库
 */
- (void)open;

/*
 * 关闭数据库
 */
- (void)close;




@end
