//
//  BaseController.m
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "BaseController.h"
#import "MBProgressHUD.h"
#import "AccountManager.h"

@interface BaseController ()

@property (strong, nonatomic) UIView *errorView;
@property (strong, nonatomic) UIView *loadingView;
@property (strong, nonatomic) UIImageView *loadingRing;

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBarTintColor:COLOR_MAIN];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.loadingView.hidden = YES;
    self.errorView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ---
#pragma mark hint
-(void)showLoad
{
    if (!_loadingView) {
        CGRect rect = self.view.bounds;
        _loadingView = [[UIView alloc] initWithFrame:rect];
        [_loadingView setBackgroundColor:UI_COLOR(0XEB, 0XEB, 0XEB)];
        [self.view addSubview:_loadingView];
        
        UIImage* img = UI_IMAGE(@"loading_hui");
        UIImageView *hui = [[UIImageView alloc] initWithImage:img];
        hui.center = _loadingView.center;
        [_loadingView addSubview:hui];
        
        
        img = UI_IMAGE(@"loading_ring");
        _loadingRing = [[UIImageView alloc] initWithImage:img];
        _loadingRing.center = _loadingView.center;
        [_loadingView addSubview:_loadingRing];
    }
    
    _loadingView.hidden = NO;
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 1;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = INT32_MAX;
    
    [_loadingRing.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    //    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)hideLoad
{
    [_loadingRing.layer removeAnimationForKey:@"rotationAnimation"];
    _loadingView.hidden = YES;
    //    [_loadingView removeFromSuperview];
    //    _loadingView = nil;
    
    //    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

-(void)showLoadHud
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
-(void)hideLoadHud
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

-(void)info:(ManagerEvent*)event
{
    EManagerEventType type = event.type;
    switch (type) {
        case EManagerEventToast:
        {
            NSString* title = event.title;
            NSString* info = event.info;
            
            MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.labelText = title;
            hud.detailsLabelText = info;
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
        }
            break;
            
        default:
            break;
    }
}

-(void)success:(ManagerEvent*)event
{
    EManagerEventType type = event.type;
    switch (type) {
        case EManagerEventToast:
        {
            NSString* title = event.title;
            NSString* info = event.info;
            
            MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.labelText = title;
            hud.detailsLabelText = info;
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
        }
            break;
            
        default:
            break;
    }
}

-(void)error:(ManagerEvent*)event
{
    EManagerEventType type = event.type;
    switch (type) {
        case EManagerEventToast:
        {
            NSString* title = event.title;
            NSString* info = event.info;
            
            MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.labelText = title;
            hud.detailsLabelText = info;
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
        }
            break;
            
        case EManagerEventExpired:
        {
            //            SCLAlertView *alert = [[SCLAlertView alloc] init];
            //
            //            [alert addButton:@"确定" actionBlock:^{
            //                [self.navigationController popToRootViewControllerAnimated:YES];
            //
            //                [[AccountManager sharedAccountManager] signOut];
            //
            //                UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"signinnavigation"];
            //                [self.navigationController presentViewController:vc animated:YES completion:^(void){
            //
            //                }];
            //            }];
            //
            //            [alert showCustom:self image:[UIImage imageNamed:@"wrong"] color:COLOR_ALERT_ERROR title:@"登录过期" subTitle:@"请重新登录" closeButtonTitle:nil duration:0.0f];
            
        }
            break;
            
        default:
            break;
    }
}

-(void)toast:(NSString*)title
{
    [self toast:title info:nil];
}

-(void)toast:(NSString*)title info:(NSString*)info
{
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = title;
    hud.detailsLabelText = info;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:2];
}

-(void)alert:(NSString*)title
{
    [self alert:title info:nil];
}

-(void)alert:(NSString*)title info:(NSString*)info
{

}

-(UITableViewCell*)defaultTableViewCell:(UITableView*)tableView
{
    
    static NSString *cellIdentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

-(UITableViewCell*)detailTableViewCell:(UITableView*)tableView
{
    static NSString *detailIdentifier = @"detailcell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:detailIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:detailIdentifier];
    }
    return cell;
}

@end
