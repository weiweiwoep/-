//
//  SWBSearchBar.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/4/25.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "SWBSearchBar.h"

@implementation SWBSearchBar

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"请输入搜索条件。";
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        
        //设置左边的放大镜图标
        //注意点：通过initWithImage来创建初始化UIImageView，UIImageView的尺寸默认就等于image的尺寸
        //UIImageView *searchIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        
        UIImageView *searchIcon = [[UIImageView alloc] init];
        //通过init来创建初始化的绝大部份控件，控件都是没有尺寸
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.width = 30;
        searchIcon.height = 30;
        searchIcon.contentMode = UIViewContentModeCenter;
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

+(instancetype)searchBar{
    return [[self alloc] init];
}

@end
