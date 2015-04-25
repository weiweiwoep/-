//
//  MainViewController.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/4/24.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
// 主控制器

#import "MainViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"
#import "MainNavigationController.h"

@interface MainViewController ()

-(void)addChildVc:(UIViewController *) vc tile:(NSString *)title image:(NSString *)image selectedImage:(NSString*)selectedImage;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.初始化子控制器
    HomeViewController *home = [[HomeViewController alloc] init];
    [self addChildVc:home tile:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    MessageViewController *messageCenter = [[MessageViewController alloc] init];
    [self addChildVc:messageCenter tile:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    [self addChildVc:discover tile:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    ProfileViewController *profile = [[ProfileViewController alloc] init];
    [self addChildVc:profile tile:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
}


-(void) addChildVc:(UIViewController *) vc tile:(NSString *)title image:(NSString *)image selectedImage:(NSString*)selectedImage{
    //设置导航栏标题
    //vc.tabBarItem.title = title;    //设置tabbar的标题文字
    //vc.navigationItem.title = title;    //设置navigationBar的标题
    //下面的一句作用与上面两句作用一样，同时设置tabBar与navigationBar的标题
    vc.title = title;
    //设置文字的样式
    NSMutableDictionary *textAlttrs = [NSMutableDictionary dictionary];
    textAlttrs[NSForegroundColorAttributeName] = HWColor(123,123,123);
    //设置选中文字颜色
    NSMutableDictionary *textSelectedAlttrs = [NSMutableDictionary dictionary];
    textSelectedAlttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    //设置tabBar的图片
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.view.backgroundColor = HWRandomColor;
    [vc.tabBarItem setTitleTextAttributes:textAlttrs forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:textSelectedAlttrs forState:UIControlStateSelected];
    
    //先给视图控制器包装一个导航控制器
    MainNavigationController *nva = [[MainNavigationController alloc] initWithRootViewController:vc];
    //两种方式添加子视图
    [self addChildViewController:nva];
}


@end
