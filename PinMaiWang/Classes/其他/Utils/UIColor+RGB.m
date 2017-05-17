//
//  UIColor+RGB.m
//  jianhun
//
//  Created by 谢鸿标 on 2017/3/2.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import "UIColor+RGB.h"
#import <objc/runtime.h>

@implementation UIColor (RGB)

+ (void)load {
    
    Method sys_colorWith = class_getClassMethod([self class], @selector(colorWithRed:green:blue:alpha:));
    Method cus_colorWith = class_getClassMethod([self class], @selector(cus_colorWithRed:green:blue:alpha:));
    method_exchangeImplementations(sys_colorWith, cus_colorWith);
    
}

+ (UIColor *)cus_colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a {
    
    return [UIColor cus_colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a];
}

+ (UIColor *)colorWithHex:(long)hexColor {
    
    return [UIColor colorWithHex:hexColor alpha:1];
}

+ (UIColor *)colorWithHex:(long)hexColor alpha:(CGFloat)alpha {
    
    CGFloat red = ((hexColor & 0xFF0000)>>16);
    CGFloat green = ((hexColor & 0xFF00)>>8);
    CGFloat blue = ((hexColor & 0xFF));
    
    return XHBRGBAColor(red, green, blue, alpha);
}

@end
