//
//  UIBarButtonItem+Extension.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/4/25.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image
                    hightImage:(NSString *)hightImage{
    
    UIButton *barBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置图片
    [barBtn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [barBtn setBackgroundImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    //设置尺寸
    barBtn.size = barBtn.currentBackgroundImage.size;
    //设置按钮点击事件
    [barBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:barBtn];
}

@end
