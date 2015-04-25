//
//  MainNavigationController.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/4/25.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "MainNavigationController.h"
#import "UIBarButtonItem+Extension.h"

@implementation MainNavigationController

+(void)initialize{
    //设置整个项目所有的item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置普通状态
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    //设置普通状态
    NSMutableDictionary *disabletextAttrs = [NSMutableDictionary dictionary];
    disabletextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    disabletextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:disabletextAttrs forState:UIControlStateDisabled];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    viewController.hidesBottomBarWhenPushed = NO;
    if (self.viewControllers.count > 0) { //这时push进来的控制器viewController，不是第一个控制器（不是根控制器）
        //隐藏tabbar栏
         viewController.hidesBottomBarWhenPushed = YES;
        
        //添加leftBarButtonItem按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" hightImage:@"navigationbar_back_highlighted"];

        //添加rightBarButtonItem按钮
        viewController.navigationItem.rightBarButtonItem =  [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_more" hightImage:@"navigationbar_more_highlighted"];
    }
    [super pushViewController:viewController animated: animated];
}

-(UIButton *)CreateBarButtonWithImage:(NSString *)image
                    hightLightedImage:(NSString *)hightLightedImage{
    
    UIButton *barBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置图片
    [barBtn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [barBtn setBackgroundImage:[UIImage imageNamed:hightLightedImage] forState:UIControlStateHighlighted];
    //设置尺寸
    barBtn.size = barBtn.currentBackgroundImage.size;
    return barBtn;
}


#pragma mark - Target Action

-(void)back{
    [self popViewControllerAnimated:YES];
}

-(void)more{
    [self popToRootViewControllerAnimated:YES];
}


@end
