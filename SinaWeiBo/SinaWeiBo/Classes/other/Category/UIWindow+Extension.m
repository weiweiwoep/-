//
//  UIWindow+Extension.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/6/12.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "MainViewController.h"
#import "SWNewfeatureViewController.h"

@implementation UIWindow (Extension)

-(void)swithRootViewController{
    
    NSString *key = @"CFBundleVersion";
    //上一次使用的版本（存储在泥沙盒中的版本号）
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    //当前版本号（从info.plist中获得）
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if([currentVersion isEqualToString:lastVersion]){ //版本号相同
        self.rootViewController = [[MainViewController alloc] init];
    }else{  //版本号不同
        self.window.rootViewController = [[SWNewfeatureViewController alloc] init];
        //将版本号存进沙盒
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
