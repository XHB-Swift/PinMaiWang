//
//  UIButton+XHBCommon.m
//  jianhun
//
//  Created by 谢鸿标 on 2017/4/30.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import "UIButton+XHBCommon.h"

@implementation UIButton (XHBCommon)

+ (instancetype)customButtonWithNormalTitle:(NSString *)nt SelectedTitle:(NSString *)st Target:(id)target Selector:(SEL)sel {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:nt forState:UIControlStateNormal];
    [btn setTitle:st forState:UIControlStateSelected];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

+ (instancetype)customButtonWithNormalImage:(UIImage *)ni SelectedImage:(UIImage *)si Target:(id)target Selector:(SEL)sel {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:ni forState:UIControlStateNormal];
    [btn setImage:si forState:UIControlStateSelected];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

+ (instancetype)customButtonWithNormalImgName:(NSString *)nName SelectedImgName:(NSString *)sName Target:(id)target Selector:(SEL)sel {
    
    UIImage *ni = nName ? [UIImage imageNamed:nName] : nil;
    UIImage *si = sName ? [UIImage imageNamed:sName] : nil;
    
    return [UIButton customButtonWithNormalImage:ni SelectedImage:si Target:target Selector:sel];
}

@end
