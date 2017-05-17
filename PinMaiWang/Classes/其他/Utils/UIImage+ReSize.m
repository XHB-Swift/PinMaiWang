//
//  UIImage+ReSize.m
//  jianhun
//
//  Created by 谢鸿标 on 2017/3/6.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import "UIImage+ReSize.h"

@implementation UIImage (ReSize)

+ (UIImage *)resizeImage:(UIImage *)old toNewSize:(CGSize)size {
    
    UIGraphicsBeginImageContext(size);
    [old drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)resizeImage:(UIImage *)old byScale:(CGFloat)scale {
    
    CGSize size = old.size;
    CGSize newSize = CGSizeMake(size.width*scale, size.height*scale);
    return [UIImage resizeImage:old toNewSize:newSize];
}

+ (UIImage *)resizeImage:(UIImage *)old byScaleSize:(CGSize)sSize {
    
    CGSize size = old.size;
    CGSize newSize = CGSizeMake(size.width*sSize.width, size.height*sSize.height);
    return [UIImage resizeImage:old toNewSize:newSize];
}

- (UIImage *)resizeImageToSize:(CGSize)size {
    
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}

- (UIImage *)resizeImageByScale:(CGFloat)scale {
    
    CGSize size = self.size;
    CGSize newSize = CGSizeMake(size.width*scale, size.height*scale);
    return [self resizeImageToSize:newSize];
}

- (UIImage *)resizeImageByScaleSize:(CGSize)sSize {
    
    CGSize size = self.size;
    CGSize newSize = CGSizeMake(size.width*sSize.width, size.height*sSize.height);
    return [self resizeImageToSize:newSize];
}

@end
