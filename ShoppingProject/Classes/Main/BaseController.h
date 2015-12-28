//
//  BaseController.h
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseController : UIViewController

-(void)showLoad;
-(void)hideLoad;

-(void)showLoadHud;
-(void)hideLoadHud;

-(void)success:(ManagerEvent*)event;
-(void)error:(ManagerEvent*)event;

-(void)toast:(NSString*)title;
-(void)toast:(NSString*)title info:(NSString*)info;

-(void)alert:(NSString*)title;
-(void)alert:(NSString*)title info:(NSString*)info;

-(UITableViewCell*)defaultTableViewCell:(UITableView*)tableView;
-(UITableViewCell*)detailTableViewCell:(UITableView*)tableView;

@end
