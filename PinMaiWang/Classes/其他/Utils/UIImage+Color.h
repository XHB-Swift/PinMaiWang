//
//  UIImage+Color.h
//  jianhun
//
//  Created by 谢鸿标 on 2017/3/27.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

/**
  @param  color 需要生成图片的颜色
  @param  size  生成图片的尺寸
  @return 返回生成的图片
 */

+ (instancetype)imageWithColor:(UIColor *)color Size:(CGSize)size;

@end
