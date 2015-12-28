//
//  UIDefine.h
//  ShoppingProject
//
//  Created by stvenfor on 15/12/28.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#ifndef UIDefine_h
#define UIDefine_h


//Font
#define UI_FONT(size) [UIFont systemFontOfSize:size]
#define UI_BOLD_FONT(size) [UIFont boldSystemFontOfSize:size]

//Color
#define UI_COLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define UI_COLOR_A(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//Device
#define IS_IPHONE_DEVICE    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPAD_DEVICE      (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//Image
#define UI_IMAGE(img)    [UIImage imageNamed:img]
#define UI_RESIZEABLE_IMAGE(img, top, left, bottom, right) [[UIImage imageNamed:img] resizableImageWithCapInsets:UIEdgeInsetsMake(top, left, bottom, right)]

#define IS_IPHONE5          [[UIScreen mainScreen] bounds].size.height > 480

#define VC_WIDTH self.view.bounds.size.width
#define VC_HEIGHT self.view.bounds.size.height

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#endif /* UIDefine_h */
