//
//  UIImage+Crop.h
//  jianhun
//
//  Created by 谢鸿标 on 2017/3/25.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Crop)

/**
  @param cropRect 截取区域
  @return 返回截取的图片
 */
- (UIImage *)cropImageInRect:(CGRect)cropRect;
/**
  @param oldImg   原始图片
  @param cropRect 街区区域
  @return 返回截取的图片
 */
+ (UIImage *)cropImage:(UIImage *)oldImg InRect:(CGRect)cropRect;

@end
