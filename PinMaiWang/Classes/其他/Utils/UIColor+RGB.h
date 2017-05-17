//
//  UIColor+RGB.h
//  jianhun
//
//  Created by 谢鸿标 on 2017/3/2.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import <UIKit/UIKit.h>

#define XHBRGBColor(r,g,b) [UIColor colorWithRed:r green:g blue:b alpha:1]
#define XHBRGBAColor(r,g,b,a) [UIColor colorWithRed:r green:g blue:b alpha:a]
#define XHBHexColor(hex) [UIColor colorWithHex:hex]
#define XHBHexAColor(hex, a) [UIColor colorWithHex:hex alpha:a]

@interface UIColor (RGB)

/**
  @param hexColor 十六进制颜色
 */
+ (UIColor *)colorWithHex:(long)hexColor;
/**
  @param hexColor 十六进制颜色
  @param alpha    透明度
 */
+ (UIColor *)colorWithHex:(long)hexColor alpha:(CGFloat)alpha;

@end
