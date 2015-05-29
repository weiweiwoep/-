//
//  SWDropdownMenu.h
//  SinaWeiBo
//
//  Created by 魏伟 on 15/5/25.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SWDropdownMenu;
@protocol SWDropdownMenuDelegate <NSObject>

@optional
-(void)dropdownMenuDidDismiss:(SWDropdownMenu *)menu;
-(void)dropdownMenuDidShow:(SWDropdownMenu *)menu;

@end

@interface SWDropdownMenu : UIView

+(instancetype)menu;

//显示菜单
-(void)showFrom:(UIButton *)button;

//销毁菜单
-(void)dismiss;

//控件内容
@property(nonatomic,strong) UIView *content;

//控件内容控制器
@property(nonatomic,strong) UIViewController *contentController;

@property(nonatomic,strong) id<SWDropdownMenuDelegate> delegate;

@end
