//
//  AccountModel.h
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountModel : NSObject

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *passwordConfirm;
@property (nonatomic, copy) NSString *sms;          //手机验证码
@property (nonatomic, copy) NSString *mobile;

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *token;

@property (nonatomic, copy) NSString *realName;     //真实姓名，用于数据传输
@property (nonatomic, copy) NSString *IDCode;        //身份证号，用于数据传输
@property (nonatomic, copy) NSNumber *hasReg;          //是否注册

@end
