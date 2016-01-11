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
@property(nonatomic,assign)CGFloat hight;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    ManagerCallBack *callback = [[ManagerCallBack alloc]init];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    }
    
    callback.updateBlock = ^(NSArray *result){
        
        self.tableData = result;
        
        [self.tabelView reloadData];
    };
    self.view.backgroundColor = [UIColor grayColor];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-self.tabBarController.tabBar.frame.size.height) style:UITableViewStylePlain];
    self.tabelView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView setRowHeight:50];
    [self.view addSubview:tableView];
     [tableView registerClass:[DrugCell class] forCellReuseIdentifier:@"drugCell"];
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
    tableView.tableHeaderView = view;
    
    [ProjectManager key:keyString callback:callback];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    NSInteger count = 0;
    count =  self.tableData.count-18;

    
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DrugCell *cell = [tableView dequeueReusableCellWithIdentifier:@"drugCell"];
    if (!cell) {
        cell = [[DrugCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"drugCell"];
    }
    DrugListModel *drugModel = self.tableData[indexPath.row];
     CGFloat hight =  [cell getCellHeight];

   
    cell.drugModel = drugModel;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
   DrugCell *cell  = (DrugCell *)[tableView dequeueReusableCellWithIdentifier:@"drugCell"];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    return [cell getCellHeight];
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 20);
    view.backgroundColor = [UIColor clearColor];
    UILabel *lable = [UILabel new];
    lable.text = [NSString stringWithFormat:@"第%tu组",section];
    lable.text = @"fgag";
    lable.backgroundColor = [UIColor redColor];
    lable.font = [UIFont systemFontOfSize:12];
    [view addSubview:lable];
    return view;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}




@end
