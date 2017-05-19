//
//  PMMineView.h
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString PMMineViewMsgType;

UIKIT_EXTERN PMMineViewMsgType *const PMMineViewMsg;

@interface PMMineView : UIView

@property (nonatomic, copy) NSMutableArray *funcItems;

+ (instancetype)mineViewForFullScreen;

@end
