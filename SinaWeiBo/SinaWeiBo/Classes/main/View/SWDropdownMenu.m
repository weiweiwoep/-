//
//  SWDropdownMenu.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/5/25.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "SWDropdownMenu.h"

@implementation SWDropdownMenu

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

+(instancetype)menu{
    return [[self alloc] init];
}

-(void)show{
    
    //获取当前最顶层窗口时，使用 [[UIApplication sharedApplication].windows lastObject]
    UIWindow *window =[[UIApplication sharedApplication].windows lastObject];
    //先添加蒙板
    UIView *cover = [[UIView alloc] init];
    cover.frame = window.bounds;
    cover.backgroundColor = [UIColor clearColor];
    [window addSubview:cover];
    
    //添加带箭头的灰色图片
    UIImageView *dropdownMenu = [[UIImageView alloc] init];
    dropdownMenu.image = [UIImage imageNamed:@"popover_background"];
    dropdownMenu.width = 217;
    dropdownMenu.height  = 217;
    dropdownMenu.y = 40;
    //开启用户交互
    dropdownMenu.userInteractionEnabled = YES;
    [dropdownMenu addSubview:[UIButton buttonWithType:UIButtonTypeContactAdd]];
    [cover addSubview:dropdownMenu];
    //如果图片某个方向上不规则，那么这个方向就不能拉伸
}

@end
