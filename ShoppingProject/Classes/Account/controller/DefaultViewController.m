//
//  DefaultViewController.m
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "DefaultViewController.h"
#import "HTTPFacade.h"

@interface DefaultViewController ()
@property (weak, nonatomic) IBOutlet UIView *rightLine;

@property (weak, nonatomic) IBOutlet UIView *leftLine;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *verificationCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signInBtn;


- (IBAction)loginBtn:(id)sender;
- (IBAction)verificationCodeBtn:(id)sender;
- (IBAction)signInBtn:(id)sender;


@end

@implementation DefaultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.rightLine.hidden = YES;
    
   
}


- (IBAction)loginBtn:(id)sender {
    self.rightLine.hidden = YES;
    self.leftLine.hidden = NO;
}

- (IBAction)verificationCodeBtn:(id)sender {
    self.leftLine.hidden = YES;
    self.rightLine.hidden = NO;
}

- (IBAction)signInBtn:(id)sender {
    //1.弹框
    //2.隐藏键盘
    //3.发送请求
    HttpCallBack *callback = [[HttpCallBack alloc]init];
    callback.errorBlock = ^(id result){
        NSLog(@"----->%@",result);
    };
    AccountModel *account = [[AccountModel alloc]init];
    account.password = self.passwordTextField.text;
    account.mobile = self.phoneTextField.text;
    [HTTPFacade signIn:account callback:callback];
    
}
@end
