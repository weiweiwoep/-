//
//  SWDropdownMenu.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/5/25.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "SWDropdownMenu.h"
@interface SWDropdownMenu()
//将来用来显示具体内容的容器
@property (nonatomic,weak) UIImageView *containerView;
@end

@implementation SWDropdownMenu

-(UIImageView *)containerView{
    if(!_containerView){
        //添加灰色图片控件
        UIImageView *contentView = [[UIImageView alloc] init];
        contentView.image = [UIImage imageNamed:@"popover_background"];
//        contentView.width = 217;
//        contentView.height  = 217;
//        contentView.y = 40;
        contentView.userInteractionEnabled = YES;
        [self addSubview:contentView];
        self.containerView = contentView;
    }
    return _containerView;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //清除颜色
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)setContentController:(UIViewController *)contentController{
    _contentController = contentController;
    self.content = contentController.view;
}

+(instancetype)menu{
    return [[self alloc] init];
}

-(void)setContent:(UIView *)content{
    _content = content;
    
    //设置控件位置
    content.x = 10;
    content.y = 15;
    
    // 设置灰色的高度
    self.containerView.height = CGRectGetMaxY(content.frame) + 11;
    // 设置灰色的宽度
//    self.containerView.width = CGRectGetMaxX(content.frame) + 10;
    self.containerView.width = CGRectGetMaxX(content.frame) + 10;
    //调整内容的宽度
//    content.width = self.containerView.width - 2 * content.x;

    //添加内容到灰色图片中
    [self.containerView addSubview:content];
}

//显示
-(void)showFrom:(UIButton *)button{
    
    //1.获取当前最顶层窗口时，使用 [[UIApplication sharedApplication].windows lastObject]
    UIWindow *window =[[UIApplication sharedApplication].windows lastObject];
    
    //2.添加自己到窗口
    [window addSubview:self];
    
    //3.设置尺寸
    self.frame = window.bounds;
    
    //4.设置显示位置
    //默认情况下，frame是以父控件左上角为坐标原点
    //转换坐标系
    CGRect newFrame = [button convertRect:button.bounds toView:window];
    self.containerView.y = CGRectGetMaxY(newFrame);
    self.containerView.centerX = CGRectGetMidX(newFrame);
    
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidShow:)]) {
        [self.delegate dropdownMenuDidShow:self];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}

//销毁
-(void)dismiss{
    [self removeFromSuperview];
    
    //通知外界，自己被销毁了
    if([self.delegate respondsToSelector:@selector(dropdownMenuDidDismiss:)]){
        [self.delegate dropdownMenuDidDismiss:self];
    }
}

@end
