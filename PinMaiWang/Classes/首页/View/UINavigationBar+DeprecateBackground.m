//
//  UINavigationBar+DeprecateBackground.m
//  jianhun
//
//  Created by 谢鸿标 on 2017/3/26.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import "UINavigationBar+DeprecateBackground.h"

#define PRIVATE_BACKGROUND_CLASS @"_UIBarBackground"

@implementation UINavigationBar (DeprecateBackground)

static char overlayKey;

- (UIView *)overLay {
    
    return objc_getAssociatedObject(self, &overlayKey);
    
}

- (void)setOverLay:(UIView *)overLay {
    
    objc_setAssociatedObject(self, &overlayKey, overLay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)xhb_setBackgroundColor:(UIColor *)color {
    
    if (![self overLay]) {
        
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage new]];
        [self setOverLay:[[UIView alloc] initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH, 64)]];
        [self overLay].userInteractionEnabled = NO;
        [self overLay].autoresizingMask = UIViewAutoresizingFlexibleWidth;
        //[self.subviews.firstObject insertSubview:[self overLay] atIndex:0];
        [self.subviews.firstObject addSubview:[self overLay]];
    }
    [self overLay].backgroundColor = color;
}

- (void)xhb_setBackgroundHidden:(BOOL)hidden {
    
    [self overLay].hidden = hidden;
}

- (void)xhb_resetNavigationBar {
    
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self setShadowImage:nil];
    [[self overLay] removeFromSuperview];
    [self setOverLay:nil];
}

@end
