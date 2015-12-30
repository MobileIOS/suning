//
//  HomeController.m
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "HomeController.h"
#import "HTTPFacade.h"
#import "ProjectManager.h"

NSString *const keyString = @"6faf1c6432bdd68e6ed896917f807e2d";

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    ManagerCallBack *callback = [[ManagerCallBack alloc]init];
    callback.updateBlock = ^(id result){
        NSLog(@"----->%@",result);
    };
    
    [ProjectManager key:keyString callback:callback];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
