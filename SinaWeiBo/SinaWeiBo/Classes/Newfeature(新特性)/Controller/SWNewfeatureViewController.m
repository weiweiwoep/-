//
//  SWNewfeatureViewController.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/5/29.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "SWNewfeatureViewController.h"
#define SWNewfeatureCount 4

@interface SWNewfeatureViewController()<UIScrollViewDelegate>
@property(nonatomic,weak)UIPageControl *pageControl;
@end

@implementation SWNewfeatureViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    //1.创建一个scrollView,显示所有的新特性图片
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    CGFloat scrollW = scrollView.width;
    CGFloat scrollH = scrollView.height;
    //2.添加图片到ScrollView中
    for (int i = 0; i<SWNewfeatureCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.width = scrollW;
        imageView.height = scrollH;
        imageView.y = 0;
        imageView.x = i * scrollW;
        //显示的图片
        NSString *imgName = [NSString stringWithFormat:@"new_feature_%d",i+1];
        imageView.image = [UIImage imageNamed:imgName];
        [scrollView addSubview:imageView];
    }
    
    //如果想要某个方向上不能滚动，那么这个方向上的数值传递0就可以
    scrollView.contentSize =CGSizeMake(SWNewfeatureCount * scrollView.width, 0);
    scrollView.bounces = NO;    //去除弹簧效果
    scrollView.pagingEnabled = YES; //分页效果
    scrollView.showsHorizontalScrollIndicator = NO; //去掉水平滚动条
    scrollView.delegate = self;
    
    //添加pageControl:分页，展示目前是第几页
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = SWNewfeatureCount;
    pageControl.centerX = scrollW * 0.5;
    pageControl.centerY = scrollH - 50;
    pageControl.currentPageIndicatorTintColor = HWColor(253,98,42);
    pageControl.pageIndicatorTintColor = HWColor(189, 189, 189);
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    
    //PageControl 就算没有设置尺寸，也能显示，这是它与其它控件的特殊之处
    //    pageControl.width = 100;
    //    pageControl.height = 50;
    //    pageControl.userInteractionEnabled = NO;
}

#pragma mark - UIScrollView代理实现

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    double page = scrollView.contentOffset.x / scrollView.width;
    
    self.pageControl.currentPage = (int)(page + 0.5);
}

@end
