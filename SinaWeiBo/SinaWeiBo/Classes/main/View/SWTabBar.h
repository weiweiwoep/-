//
//  SWTabbar.h
//  SinaWeiBo
//
//  Created by 魏伟 on 15/5/29.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SWTabBar;

@protocol SWTabBarDelegate <UITabBarDelegate>
@optional
-(void)tabBarDidClickPlusButton:(SWTabBar *)tabBar;
@end

@interface SWTabBar : UITabBar

@property(nonatomic,weak) id<SWTabBarDelegate> delegate;

@end
