//
//  commonDao.m
//  ShoppingProject
//
//  Created by stvenfor on 16/1/7.
//  Copyright © 2016年 郑永能. All rights reserved.
//

#import "commonDao.h"
#import "DBHelper.h"
#import "DBHelper.h"

@implementation commonDao


-(id)initWithFMDatabase:(FMDatabase *)fmdb{
    if (self = [super init]) {
        self.database = fmdb;
        [self createTable];
    }
    return self;
}
-(instancetype)init{
    if (self = [super init]) {
        self.tableName = @"list_tabelname";
    }
    return self;
}


-(void)createTable{
    
    if (self.database) {
        NSString *sql = [NSString stringWithFormat:@"CREATE TABLE if not exists %@ "
                         "(ID INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL ,"
                         "style TEXT,"
                         "use TEXT,"
                         "function TEXT,"
                         "factory TEXT,"
                         "theory TEXT,"
                         "cName TEXT,"
                         "ingredients TEXT,"
                         "bad TEXT,"
                         "forbidden TEXT,"
                         "storage TEXT,"
                         "attention TEXT,"
                         "name TEXT,"
                         "pizhun TEXT)",
                         _tableName];
          [self.database executeUpdate:sql];
    }
    
}

-(void)selectData{
    if (self.database) {
        NSString *sql = @"slect count(*) as count from list_tabelname";
        
    }
}

- (FMDatabase *)database{
    if (!_database) {
        _database = [DBHelper sharedService].database;
    }
    return _database;
}

- (void)clear {
    if (self.database && [self.database open]) {
        [self.database executeUpdate:[NSString stringWithFormat:@"DROP TABLE %@", _tableName]];
    }
}

@end
