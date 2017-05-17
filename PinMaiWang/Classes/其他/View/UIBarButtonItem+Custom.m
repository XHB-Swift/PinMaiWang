//
//  UIBarButtonItem+Custom.m
//  UStore
//
//  Created by 嚼华先森 on 2017/3/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "UIBarButtonItem+Custom.h"

@implementation UIBarButtonItem (Custom)

+ (instancetype)customBackButtonInBarButtonItemWithTarget:(id)target Selector:(SEL)selector {
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(15, 0, 13, 21);
    [leftBtn setImage:[UIImage resizeImage:[UIImage imageNamed:@"223"] toNewSize:CGSizeMake(13, 21)] forState:UIControlStateNormal];
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [leftBtn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
}

+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalTitle:(NSString *)normalTitle Target:(id)target Selector:(SEL)selector {
    
    return [UIBarButtonItem customButtonInBarButtonItemWithFrame:frame NormalTitle:normalTitle TitleEdgeInsets:UIEdgeInsetsZero Target:target Selector:selector];
}

+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalTitle:(NSString *)normalTitle TitleEdgeInsets:(UIEdgeInsets)titleEdgInsets Target:(id)target Selector:(SEL)selector {
    
    return [UIBarButtonItem customButtonInBarButtonItemWithFrame:frame NormalTitle:normalTitle SelectedTitle:nil TitleEdgeInsets:titleEdgInsets Target:target Selector:selector];
}

+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalImage:(UIImage *)normalImage Target:(id)target Selector:(SEL)selector {
    
    return [UIBarButtonItem customButtonInBarButtonItemWithFrame:frame NormalImage:normalImage ImageEdgInsets:UIEdgeInsetsZero Target:target Selector:selector];
}

+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalImage:(UIImage *)normalImage ImageEdgInsets:(UIEdgeInsets)imageEdgInsets Target:(id)target Selector:(SEL)selector {
    
    return [UIBarButtonItem customButtonInBarButtonItemWithFrame:frame NormalTitle:nil NormalImage:normalImage TitleEdgeInsets:UIEdgeInsetsZero ImageEdgInsets:imageEdgInsets Target:target Selector:selector];
}

+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalTitle:(NSString *)normalTitle NormalImage:(UIImage *)normalImage Target:(id)target Selector:(SEL)selector {
    
    return [UIBarButtonItem customButtonInBarButtonItemWithFrame:frame NormalTitle:normalTitle NormalImage:normalImage TitleEdgeInsets:UIEdgeInsetsZero ImageEdgInsets:UIEdgeInsetsZero Target:target Selector:selector];
}

+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalTitle:(NSString *)normalTitle NormalImage:(UIImage *)normalImage TitleEdgeInsets:(UIEdgeInsets)titleEdgInsets ImageEdgInsets:(UIEdgeInsets)imageEdgInsets Target:(id)target Selector:(SEL)selector {
    
    return [UIBarButtonItem customButtonInBarButtonItemWithFrame:frame NormalTitle:normalTitle SelectedTitle:nil NormalImage:normalImage SelectedImage:nil Target:target Selector:selector TitleEdgeInsets:titleEdgInsets ImageEdgInsets:imageEdgInsets];
}

+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalTitle:(NSString *)normalTitle SelectedTitle:(NSString *)selectedTitle Target:(id)target Selector:(SEL)selector {
    
    return [UIBarButtonItem customButtonInBarButtonItemWithFrame:frame NormalTitle:normalTitle SelectedTitle:selectedTitle TitleEdgeInsets:UIEdgeInsetsZero Target:target Selector:selector];
}

+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalImage:(UIImage *)normalImage SelectedImage:(UIImage *)selectedImage Target:(id)target Selector:(SEL)selector {
    
    return [UIBarButtonItem customButtonInBarButtonItemWithFrame:frame NormalImage:normalImage SelectedImage:selectedImage ImageEdgInsets:UIEdgeInsetsZero Target:target Selector:selector];
}

+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalTitle:(NSString *)normalTitle SelectedTitle:(NSString *)selectedTitle TitleEdgeInsets:(UIEdgeInsets)titleEdgInsets Target:(id)target Selector:(SEL)selector {
    
    return [UIBarButtonItem customButtonInBarButtonItemWithFrame:frame NormalTitle:normalTitle SelectedTitle:selectedTitle NormalImage:nil SelectedImage:nil Target:target Selector:selector TitleEdgeInsets:titleEdgInsets ImageEdgInsets:UIEdgeInsetsZero];
}

+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalImage:(UIImage *)normalImage SelectedImage:(UIImage *)selectedImage ImageEdgInsets:(UIEdgeInsets)imageEdgInsets Target:(id)target Selector:(SEL)selector {
    
    return [UIBarButtonItem customButtonInBarButtonItemWithFrame:frame NormalTitle:nil SelectedTitle:nil NormalImage:normalImage SelectedImage:selectedImage Target:target Selector:selector TitleEdgeInsets:UIEdgeInsetsZero ImageEdgInsets:UIEdgeInsetsZero];
}

+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalTitle:(NSString *)normalTitle SelectedTitle:(NSString *)selectedTitle NormalImage:(UIImage *)normalImage SelectedImage:(UIImage *)selectedImage Target:(id)target Selector:(SEL)selector TitleEdgeInsets:(UIEdgeInsets)titleEdgInsets ImageEdgInsets:(UIEdgeInsets)imageEdgInsets {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:normalTitle forState:UIControlStateNormal];
    [btn setTitle:selectedTitle forState:UIControlStateSelected];
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    btn.titleEdgeInsets = titleEdgInsets;
    btn.imageEdgeInsets = imageEdgInsets;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

@end
