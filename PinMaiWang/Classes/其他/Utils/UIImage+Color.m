//
//  UIImage+Color.m
//  jianhun
//
//  Created by 谢鸿标 on 2017/3/27.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (instancetype)imageWithColor:(UIColor *)color Size:(CGSize)size {
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
