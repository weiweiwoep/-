//
//  MainNavigationController.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/4/25.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "MainNavigationController.h"

@implementation MainNavigationController

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    viewController.hidesBottomBarWhenPushed = NO;
    if (self.viewControllers.count > 0) { //这时push进来的控制器viewController，不是第一个控制器（不是根控制器）
        //隐藏tabbar栏
         viewController.hidesBottomBarWhenPushed = YES;
        //添加leftBarButtonItem按钮
        UIButton *backBtn = [self CreateBarButtonWithImage:@"navigationbar_back" hightLightedImage:@"navigationbar_back_highlighted"];
        //设置控制点击事件
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];

        //添加rightBarButtonItem按钮
        UIButton *moreBtn = [self CreateBarButtonWithImage:@"navigationbar_more" hightLightedImage:@"navigationbar_more_highlighted"];
        //设置控制点击事件
        [moreBtn addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:moreBtn];
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
