//
//  UIBarButtonItem+Custom.h
//  UStore
//
//  Created by 嚼华先森 on 2017/3/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Custom)

/**
   导航栏返回按钮自定义
 */
+ (instancetype)customBackButtonInBarButtonItemWithTarget:(id)target Selector:(SEL)selector;

/**
 自定义只有普通文本的按钮,添加到UIBarButtonItem
 */
+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalTitle:(NSString *)normalTitle Target:(id)target Selector:(SEL)selector;

/**
 自定义只有普通文本的按钮并且计算文本在按钮的偏移量,添加到UIBarButtonItem
 */
+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalTitle:(NSString *)normalTitle TitleEdgeInsets:(UIEdgeInsets)titleEdgInsets Target:(id)target Selector:(SEL)selector;

/**
   自定义带普通文本和选中文本的按钮添加到UIBarButtonItem
 */
+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalTitle:(NSString *)normalTitle SelectedTitle:(NSString *)selectedTitle Target:(id)target Selector:(SEL)selector;

/**
 自定义带普通图片和选中图片的按钮添加到UIBarButtonItem
 */
+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalImage:(UIImage *)normalImage SelectedImage:(UIImage *)selectedImage Target:(id)target Selector:(SEL)selector;

/**
 自定义带普通文本和选中文本的按钮并且计算文本在按钮的偏移量,添加到UIBarButtonItem
 */
+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalTitle:(NSString *)normalTitle SelectedTitle:(NSString *)selectedTitle TitleEdgeInsets:(UIEdgeInsets)titleEdgInsets Target:(id)target Selector:(SEL)selector;

/**
 自定义带普通图片和选中图片的按钮并且计算图片的偏移量,添加到UIBarButtonItem
 */
+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalImage:(UIImage *)normalImage SelectedImage:(UIImage *)selectedImage ImageEdgInsets:(UIEdgeInsets)imageEdgInsets Target:(id)target Selector:(SEL)selector;

/**
 自定义只有普通图片的按钮添加到UIBarButtonItem
 */
+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalImage:(UIImage *)normalImage Target:(id)target Selector:(SEL)selector;

/**
  自定义只有普通图片的按钮并计算偏移量,添加到UIBarButtonItem
 */
+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalImage:(UIImage *)normalImage ImageEdgInsets:(UIEdgeInsets)imageEdgInsets Target:(id)target Selector:(SEL)selector;

/**
 自定义只有普通图文的按钮添加到UIBarButtonItem
 */
+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalTitle:(NSString *)normalTitle NormalImage:(UIImage *)normalImage Target:(id)target Selector:(SEL)selector;

/**
 自定义只有普通图文的按钮并计算偏移量,添加到UIBarButtonItem
 */
+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalTitle:(NSString *)normalTitle NormalImage:(UIImage *)normalImage TitleEdgeInsets:(UIEdgeInsets)titleEdgInsets ImageEdgInsets:(UIEdgeInsets)imageEdgInsets Target:(id)target Selector:(SEL)selector;

/**
 自定义带普通图文和选中图文的按钮并且计算两者的偏移量,添加到UIBarButtonItem
 */
+ (instancetype)customButtonInBarButtonItemWithFrame:(CGRect)frame NormalTitle:(NSString *)normalTitle SelectedTitle:(NSString *)selectedTitle NormalImage:(UIImage *)normalImage SelectedImage:(UIImage *)selectedImage Target:(id)target Selector:(SEL)selector TitleEdgeInsets:(UIEdgeInsets)titleEdgInsets ImageEdgInsets:(UIEdgeInsets)imageEdgInsets;

@end
