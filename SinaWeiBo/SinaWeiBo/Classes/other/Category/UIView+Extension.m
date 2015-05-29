//
//  UIView+Extension.m
//  SinaWeiBo
//
//  Created by 魏伟 on 15/4/25.
//  Copyright (c) 2015年 weiweiwoep. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

-(CGFloat)x{
    return self.frame.origin.x;
}

-(CGFloat)centerX{
    return self.center.x;
}

-(CGFloat)centerY{
    return self.center.y;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

-(CGSize)size{
    return self.frame.size;
}

-(void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

-(CGPoint)origin{
    return self.frame.origin;
}
@end
