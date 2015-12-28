//
//  TabBarController.m
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/23.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "TabBarController.h"
#import "HomeController.h"
#import "SearchController.h"
#import "CategoriesController.h"
#import "ShopCartController.h"
#import "MineController.h"

@interface TabBarController ()

@property (nonatomic, strong) HomeController *homeVC;
@property (nonatomic, strong) SearchController *searchVC;
@property (nonatomic, strong) CategoriesController *categoriesVC;
@property (nonatomic, strong) ShopCartController *shopCartVC;
@property (nonatomic, strong) MineController *mine;

@property(nonatomic,strong)UIViewController *currentSelectedVc;

@end
@implementation TabBarController


-(void)viewDidLoad{
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor orangeColor];
    // 1.添加子控制器
    [self addChildViewControllers];
    
}


- (void)addChildViewControllers
{
    // 首页
    self.homeVC = (HomeController *)[self addChildVCWithSBName:@"HomeController" title:@"首页" norImageName:@"tabbar_home_unselect" selectedImageName:@"tabbar_home_selected"];
    self.currentSelectedVc = self.homeVC;
    
    // 搜索
    self.searchVC = (SearchController *)[self addChildVCWithSBName:@"SearchController" title:@"搜索" norImageName:@"tab_message" selectedImageName:@"tab_message_on"];
    
    // 类目
    self.categoriesVC = (CategoriesController *)[self addChildVCWithSBName:@"CategoriesController" title:@"类目" norImageName:@"tab_message" selectedImageName:@"tab_message_on"];
    
    // 购物车
    self.shopCartVC = (ShopCartController *)[self addChildVCWithSBName:@"ShopCartController" title:@"购物车" norImageName:@"tab_message" selectedImageName:@"tab_message_on"];
    // 我
    self.mine = (MineController *)[self addChildVCWithSBName:@"MineController" title:@"我的" norImageName:@"tab_mine" selectedImageName:@"tab_mine_on"];
}


// 通过一个SB创建控制器
- (UIViewController *)addChildVCWithSBName:(NSString *)sbName  title:(NSString *)title norImageName:(NSString *)norImageName selectedImageName:(NSString *)selectedImageName{
    
    // 1.加载Storyboard
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    
    
    // 2.创建Storyboard中的初始控制器
    UINavigationController *nav = sb.instantiateInitialViewController;
    [nav.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsCompact];
    nav.navigationBar.shadowImage =[[UIImage alloc]init];
    nav.navigationBar.translucent = NO;
    
    // 3.调用addChildVCWithController
    [self addChildVCWithController:nav.topViewController title:title norImageName:norImageName selectedImageName:selectedImageName];
    
    return nav.topViewController;
}

// 设置指定控制器的相关属性
- (UIViewController *)addChildVCWithController:(UIViewController *)vc  title:(NSString *)title norImageName:(NSString *)norImageName selectedImageName:(NSString *)selectedImageName{
    // 设置标题
    vc.tabBarItem.title = title;
    vc.navigationItem.title = title;
    
    // 设置选中图片
    vc.tabBarItem.image =  [UIImage imageNamed:norImageName];
    // 设置选中图片
    vc.tabBarItem.selectedImage =  [UIImage imageNamed:selectedImageName];
    // 添加到父控件
    [self addChildViewController:vc.navigationController];
    return vc;
}
@end
