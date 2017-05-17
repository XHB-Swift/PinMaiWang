//
//  UIView+XHBFrame.m
//  JiKeTouTiao
//
//  Created by 谢鸿标 on 2017/4/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "UIView+XHBFrame.h"

@implementation UIView (XHBFrame)

- (void)setX:(CGFloat)x {
    
    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

- (CGFloat)x {
    return CGRectGetMinX(self.frame);
}

- (void)setY:(CGFloat)y {
    
    self.frame = CGRectMake(self.x, y, self.width, self.height);
}

- (CGFloat)y {
    return CGRectGetMinY(self.frame);
}

- (void)setCenterX:(CGFloat)cx {
    
    self.center = CGPointMake(cx, self.centerY);
}

- (CGFloat)centerX {
    
    return self.center.x;
}

- (void)setCenterY:(CGFloat)cy {
    
    self.center = CGPointMake(self.centerX, cy);
}

- (CGFloat)centerY {
    
    return self.center.y;
}

- (CGFloat)midX {
    return CGRectGetMidX(self.frame);
}

- (CGFloat)midY {
    return CGRectGetMidY(self.frame);
}

- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}

- (void)setWidth:(CGFloat)width {
    
    self.frame = CGRectMake(self.x, self.y, width, self.height);
}

- (CGFloat)width {
    return CGRectGetWidth(self.frame);
}

- (void)setHeight:(CGFloat)height {
    
    self.frame = CGRectMake(self.x, self.y, self.width, height);
}

- (CGFloat)height {
    return CGRectGetHeight(self.frame);
}

- (void)setOrigin:(CGPoint)origin {
    
    self.frame = CGRectMake(origin.x, origin.y, self.width, self.height);
}

- (void)setSize:(CGSize)size {
    
    self.frame = CGRectMake(self.x, self.y, size.width, size.height);
}

- (CGSize)size {
    
    return self.frame.size;
}

- (CGPoint)origin {
    
    return self.frame.origin;
}

- (void)highPerformenceRoundRectWithRadius:(CGFloat)radius {
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
}


@end
