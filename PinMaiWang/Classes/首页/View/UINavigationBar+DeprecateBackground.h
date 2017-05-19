//
//  UINavigationBar+DeprecateBackground.h
//  jianhun
//
//  Created by 谢鸿标 on 2017/3/26.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (DeprecateBackground)

- (void)xhb_setBackgroundColor:(UIColor *)color;
- (void)xhb_setBackgroundHidden:(BOOL)hidden;
- (void)xhb_resetNavigationBar;

@end
