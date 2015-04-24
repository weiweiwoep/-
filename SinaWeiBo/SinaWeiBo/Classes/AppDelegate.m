//
//  AppDelegate.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/4/23.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    //1.创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [[UIScreen mainScreen] bounds];
    
    //2. 设置根控制器
    UITabBarController *tabBarVc = [[UITabBarController alloc] init];
    self.window.rootViewController = tabBarVc;
    
    //2.1 设置子控制器
    HomeViewController *home = [[HomeViewController alloc] init];
    [self addChildVc:home tile:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    MessageViewController *messageCenter = [[MessageViewController alloc] init];
    [self addChildVc:messageCenter tile:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    [self addChildVc:discover tile:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    ProfileViewController *profile = [[ProfileViewController alloc] init];
    [self addChildVc:profile tile:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    //两种方式添加子视图
    tabBarVc.viewControllers = @[home,messageCenter,discover,profile];
//    [tabBarVc addChildViewController:vc1];
    
    //3.显示窗口
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

-(void) addChildVc:(UIViewController *) vc tile:(NSString *)title image:(NSString *)image selectedImage:(NSString*)selectedImage{
    //设置文字的样式
    NSMutableDictionary *textAlttrs = [NSMutableDictionary dictionary];
    textAlttrs[NSForegroundColorAttributeName] = HWColor(123,123,123);
    //设置选中文字颜色
    NSMutableDictionary *textSelectedAlttrs = [NSMutableDictionary dictionary];
    textSelectedAlttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.view.backgroundColor = HWRandomColor;
    [vc.tabBarItem setTitleTextAttributes:textAlttrs forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:textSelectedAlttrs forState:UIControlStateSelected];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
