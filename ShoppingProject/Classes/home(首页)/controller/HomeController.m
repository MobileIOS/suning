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
#import "DrugCell.h"
#import "DrugListModel.h"
NSString *const keyString = @"6faf1c6432bdd68e6ed896917f807e2d";

@interface HomeController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tabelView;
@property(nonatomic,copy)NSArray *tableData;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    ManagerCallBack *callback = [[ManagerCallBack alloc]init];
    callback.updateBlock = ^(NSArray *result){
        
        self.tableData = result;
        
        [self.tabelView reloadData];
    };
    self.view.backgroundColor = [UIColor grayColor];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-self.tabBarController.tabBar.frame.size.height) style:UITableViewStylePlain];
    self.tabelView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView setRowHeight:50];
    [self.view addSubview:tableView];
     [tableView registerClass:[DrugCell class] forCellReuseIdentifier:@"drugCell"];
    
    [ProjectManager key:keyString callback:callback];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    NSInteger count = 0;
    count =  self.tableData.count;

    
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DrugCell *cell = [tableView dequeueReusableCellWithIdentifier:@"drugCell"];
    if (!cell) {
        cell = [[DrugCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"drugCell"];
    }
    DrugListModel *drugModel = self.tableData[indexPath.row];
    cell.drugModel = drugModel;
    return cell;
}

@end
