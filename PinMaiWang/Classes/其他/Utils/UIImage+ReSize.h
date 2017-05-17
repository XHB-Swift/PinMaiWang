//
//  UIImage+ReSize.h
//  jianhun
//
//  Created by 谢鸿标 on 2017/3/6.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ReSize)

/**
 @description 类方法
 @param old   原图片
 @param scale 缩放率（宽高缩放都使用该比例）
 @return 返回缩放后的图片
 */
+ (UIImage *)resizeImage:(UIImage *)old byScale:(CGFloat)scale;
/**
 @description 类方法
 @param old   原图片
 @param size  缩放到新的尺寸（宽缩放到size.width，高缩放到size.height）
 @return 返回缩放后的图片
 */
+ (UIImage *)resizeImage:(UIImage *)old toNewSize:(CGSize)size;
/**
 @description  类方法
 @param old    原图片
 @param sSize  尺寸表示宽高比例（宽按size.width缩放，高按size.height缩放）
 @return 返回缩放后的图片
 */
+ (UIImage *)resizeImage:(UIImage *)old byScaleSize:(CGSize)sSize;
/**
 @description 实例方法
 @param size 缩放率（宽按size.width缩放，高按size.height缩放）
 @return 返回缩放后的图片
 */
- (UIImage *)resizeImageToSize:(CGSize)size;
/**
 @description 实例方法
 @param scale 缩放率（宽高都按照scale缩放）
 @return 返回缩放后的图片
 */

- (UIImage *)resizeImageByScale:(CGFloat)scale;
/**
 @description 实例方法
 @param sSize 缩放率（宽按size.width缩放，高按size.height缩放）
 @return 返回缩放后的图片
 */
- (UIImage *)resizeImageByScaleSize:(CGSize)sSize;

@end
