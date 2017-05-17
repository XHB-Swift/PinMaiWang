//
//  UIView+XHBFrame.h
//  JiKeTouTiao
//
//  Created by 谢鸿标 on 2017/4/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 屏幕尺寸
 */
#define XHB_SCREEN_BOUDNS        [UIScreen mainScreen].bounds
/**
 屏幕宽度
 */
#define XHB_SCREEN_WIDTH         [UIScreen mainScreen].bounds.size.width
/**
 屏幕高度
 */
#define XHB_SCREEN_HEIGHT        [UIScreen mainScreen].bounds.size.height
/**
 以4.7英寸屏幕为基准计算比例
 */
#define XHB_SCREEN_RATO_WIDTH    SCREEN_WIDTH/375.f
/**
 以4.7英寸屏幕为基准计算比例
 */
#define XHB_SCREEN_RATO_HEIGHT   SCREEN_HEIGHT/667.f
/**
 自定义高度的顶部栏
 */
#define HEIGHT_NOTOP_CUSTOM(height) CGRectMake(0, 64, SCREEN_WIDTH, height)
/**
 不带顶部栏的尺寸
 */
#define FRAME_WITHOUT_TOPBAR CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)
/**
 不带顶部与底部栏的尺寸
 */
#define FRAME_WITHOUT_TOBOTTOMBAR CGRectMake(0, 113, SCREEN_WIDTH, SCREEN_HEIGHT-113)


@interface UIView (XHBFrame)

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic,readonly) CGFloat midX;
@property (nonatomic,readonly) CGFloat midY;
@property (nonatomic,readonly) CGFloat maxX;
@property (nonatomic,readonly) CGFloat maxY;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGSize  size;
@property (nonatomic) CGPoint origin;

/**
 @description 绘制圆角View
 @param radius 圆角半径
 */
- (void)highPerformenceRoundRectWithRadius:(CGFloat)radius;

@end
