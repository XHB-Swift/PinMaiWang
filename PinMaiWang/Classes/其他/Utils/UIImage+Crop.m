//
//  UIImage+Crop.m
//  jianhun
//
//  Created by 谢鸿标 on 2017/3/25.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import "UIImage+Crop.h"

@implementation UIImage (Crop)

- (UIImage *)cropImageInRect:(CGRect)cropRect {
    
    CGImageRef imageRef     = self.CGImage;
    CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef,cropRect);
    UIImage    *cropImage   = [UIImage imageWithCGImage:imagePartRef];
    CGImageRelease(imagePartRef);
    
    return cropImage;
}

+ (UIImage *)cropImage:(UIImage *)oldImg InRect:(CGRect)cropRect {
    
    return [oldImg cropImageInRect:cropRect];
}

@end
