//
//  PMGoodsDetailView.h
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/18.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PM_DETAIL_CONTENT_NOTIFICATION @"PM_DETAIL_CONTENT_NOTIFICATION"

// Push到评价页面
UIKIT_EXTERN NSString *const PMDetailPushMessage;
// 从底部弹出View
UIKIT_EXTERN NSString *const PMDetailShowMessage;

@class PMDetailViewModel;
@interface PMGoodsDetailView : UIView

@property (nonatomic, copy) NSArray<PMDetailViewModel *> *menus;

+ (instancetype)goodsDetailViewWithoutTop;

@end
