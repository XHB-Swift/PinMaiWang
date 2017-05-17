//
//  PMCategoryItemView.h
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PM_CATEGORY_ITEM_NOTICATION @"PM_CATEGORY_ITEM_NOTICATION"

@interface PMCategoryItemView : UIView

@property (nonatomic,assign) BOOL state;

+ (instancetype)categoryItemWithName:(NSString *)aName NormalImage:(UIImage *)norImage SelectedImage:(UIImage *)selImage;

@end
