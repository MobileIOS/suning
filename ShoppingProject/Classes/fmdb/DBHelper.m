//
//  DBHelper.m
//  ShoppingProject
//
//  Created by stvenfor on 16/1/7.
//  Copyright © 2016年 郑永能. All rights reserved.
//

#import "DBHelper.h"

static DBHelper* sharedService;
static dispatch_queue_t gDatabaseDispatchQueue;
@implementation DBHelper

+ (dispatch_queue_t)getDispatchQueue {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gDatabaseDispatchQueue = dispatch_queue_create("service.datebaseservice", DISPATCH_QUEUE_SERIAL);
    });
    
    return gDatabaseDispatchQueue;
}

+ (DBHelper*)sharedService {
    @synchronized(sharedService) {
        if (sharedService == nil) {
            sharedService = [[self alloc] init];
        }
    }
    return sharedService;
}

+ (id)allocWithZone:(NSZone*)zone {
    @synchronized(sharedService) {
        if (sharedService == nil) {
            sharedService = [super allocWithZone:zone];
            return sharedService;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone*)zone {
    return self;
}

- (void)open {
    if (_database) {
        [_database open];
    }
}


- (void)close {
    if (_database) {
        [_database close];
    }
}

- (void)initDatabaseWith:(NSString*)userAccount {
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentDirectory = [paths objectAtIndex:0];
    NSString* path = [documentDirectory stringByAppendingPathComponent:
                      [NSString stringWithFormat:@"/database/%@", userAccount]];
    if (![fileManager fileExistsAtPath:path]) {
        NSError* error;
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
           
            return ;
        }
    }
    
    NSString* databasePath = [NSString stringWithFormat:@"%@/wxuniversity.db", path];
    _database = [FMDatabase databaseWithPath:databasePath];
    if (!_database || ![_database open]) {
  
        return;
    }
   }


@end
