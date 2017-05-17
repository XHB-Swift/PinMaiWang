//
//  UIButton+XHBCommon.h
//  jianhun
//
//  Created by 谢鸿标 on 2017/4/30.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XHBCommon)

/**
 @description  创建一个只有文字的按钮
 @param nt     普通状态下字体
 @param st     选中状态下字体
 @param target 绑定方法的对象
 @param sel    被绑定对象的方法
 @return 返回只有文字的按钮
 */
+ (instancetype)customButtonWithNormalTitle:(NSString *)nt SelectedTitle:(NSString *)st Target:(id)target Selector:(SEL)sel;
/**
 @description  创建一个只有图片的按钮
 @param ni     普通状态下图片
 @param si     选中状态下图片
 @param target 绑定方法的对象
 @param sel    被绑定对象的方法
 @return 返回只有图片的按钮
 */
+ (instancetype)customButtonWithNormalImage:(UIImage *)ni SelectedImage:(UIImage *)si Target:(id)target Selector:(SEL)sel;
/**
 @descripiton  根据图片名创建图片按钮
 @param nName  普通状态下图片名
 @param sName  选中状态下图片名
 @param target 绑定方法的对象
 @param sel    被绑定对象的方法
 @return 返回只有图片的按钮
 */
+ (instancetype)customButtonWithNormalImgName:(NSString *)nName SelectedImgName:(NSString *)sName Target:(id)target Selector:(SEL)sel;

@end
