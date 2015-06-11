//
//  AppDelegate.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/4/23.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "SWNewfeatureViewController.h"
#import "SWOAuthViewController.h"
#import "SWAccount.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"沙盒路径：%@",NSHomeDirectory());
//    //1.创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [[UIScreen mainScreen] bounds];

    //2. 设置根控制器
    
    //沙盒路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"account.archive"];
    SWAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (account) {
        NSString *key = @"CFBundleVersion";
        //上一次使用的版本（存储在泥沙盒中的版本号）
        NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
        //当前版本号（从info.plist中获得）
        NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
        
        if([currentVersion isEqualToString:lastVersion]){ //版本号相同
            self.window.rootViewController = [[MainViewController alloc] init];
        }else{  //版本号不同
            self.window.rootViewController = [[SWNewfeatureViewController alloc] init];
            //将版本号存进沙盒
            [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }else{
        self.window.rootViewController = [[SWOAuthViewController alloc] init];
    }
    
    //3.显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
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
