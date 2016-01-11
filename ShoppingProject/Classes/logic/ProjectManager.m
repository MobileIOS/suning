//
//  ProjectManager.m
//  ShoppingProject
//
//  Created by stvenfor on 15/12/30.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "ProjectManager.h"
#import "ManagerUtil.h"
#import "DrugListResultModel.h"
#import "DrugListModel.h"
#import "HTTPFacade.h"
#import "DBHelper.h"
#import "AccountManager.h"
#import "commonDao.h"
@implementation ProjectManager



+(void)key:(NSString *)key callback:(ManagerCallBack*)callback{
    
    
    HttpCallBack* http = [ManagerUtil defaultHttpCallBack:callback process:^id(NSDictionary* dict){

        DrugListResultModel* model = [DrugListResultModel mj_objectWithKeyValues:dict[@"result"]];
       
        NSMutableArray* list = nil;
        if (model) {
            NSInteger count = [model.list count];
            list = [NSMutableArray arrayWithCapacity:count];
            
            
            for (DrugListModel* project in model.list) {
              
                [list addObject:project];
            }
            DBHelper *db = [DBHelper sharedService];
            [db initDatabaseWith:@"dafa"];
            
            commonDao *dao = [[commonDao alloc]init];
        
          
            
            NSLog(@"%@---->%tu",list,list.count);
            
        }
        return list;
    }];
    
    [HTTPFacade key:key callback:http];
    
}
@end
