//
//  SWNewfeatureViewController.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/5/29.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "SWNewfeatureViewController.h"
#import "MainViewController.h"
#define SWNewfeatureCount 4

@interface SWNewfeatureViewController()<UIScrollViewDelegate>
@property(nonatomic,weak) UIPageControl *pageControl;
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
        
        //给最后一个新特性展示界面添加启动按钮
        if (i == SWNewfeatureCount-1) {
            [self setupLastImageView:imageView];
        }
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

-(void)setupLastImageView:(UIImageView *)imageView{
    //开启图片控件交互功能
    imageView.userInteractionEnabled = YES;
    //1.添加按钮【分享给大家】
    UIButton *shareBtn = [[UIButton alloc] init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    shareBtn.width = 130;
    shareBtn.height = 30;
    shareBtn.centerX = imageView.width  * 0.5;
    shareBtn.centerY = imageView.height * 0.65;
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareBtn];
    
    //2.添加按钮【开始微博】
    UIButton *startBtn = [[UIButton alloc] init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_hightlighted"] forState:UIControlStateHighlighted];
    startBtn.size = startBtn.currentBackgroundImage.size;
    startBtn.centerX = shareBtn.centerX;
    startBtn.centerY = imageView.height * 0.75;
    [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];
}

-(void)shareClick:(UIButton *)shareBtn{
    //状态取反
    shareBtn.selected = !shareBtn.isSelected;
}

-(void)startClick{
    //切换到HWTabBarController
    /**
     切换控制器的方法
     1.putsh
     2.modal
     3.切换window的rootView
     **/

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[MainViewController alloc] init];
}

/**
 一个控件用肉眼看不见，有哪些可能
 1.根本没有创建实例化这个控件
 2.没有设置尺寸
 3.控件的颜色跟父控件的背景色一样（实际上已经显示了，只不过用肉眼看不见）
 4.透明度alpha <= 0.01
 5.hidden = YES
 6.没有添加到父控件中
 7.被其它控件挡住了
 8.位置不对
 9.父控件发生了以上情况
 10.特殊情况：
 比如：UIImageView没有设置图片，或者设置的图片名不对
      UILabel没有设置文字，或者文字颜色跟父控件背景色一样
      UIPageControl没有设置总页数，不会显示小圆点
      UIButton内部imageView和titleLabel的frame被篡改了，或者imageView和titleLabel没有内家
      UITextField没有设置文字，或者没有设置边框样式
 ......
 
 添加一个控件的建议
 1.最好设置背景色和尺寸
 2.控件的颜色尽量不要跟父控件的背景色一样
 **/

#pragma mark - UIScrollView代理实现

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    double page = scrollView.contentOffset.x / scrollView.width;
    
    self.pageControl.currentPage = (int)(page + 0.5);
}

@end
