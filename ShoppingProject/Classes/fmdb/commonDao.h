//
//  commonDao.h
//  ShoppingProject
//
//  Created by stvenfor on 16/1/7.
//  Copyright © 2016年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
@interface commonDao : NSObject
{
    NSString* _tableName;
}
@property (nonatomic, weak) FMDatabase* database;
@property (nonatomic, strong) NSString* tableName;
-(instancetype)init;
- (id)initWithFMDatabase:(FMDatabase*)fmdb;
- (void)createTable;
- (void)clear;

- (int)getCounts;
@end
