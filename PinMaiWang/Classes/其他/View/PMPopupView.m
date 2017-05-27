//
//  PMPopupView.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/26.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMPopupView.h"

NSInteger const PMPopupViewTag = NSNotFound;
NSInteger const PMPopupCoverViewTag = PMPopupViewTag - 100;

@implementation PMPopupView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupCoverView];
        
    }
    
    return self;
}

- (void)setupCoverView {
    
    UIView *coverView = [[UIView alloc] initWithFrame:XHB_SCREEN_BOUDNS];
    coverView.tag = PMPopupCoverViewTag;
    coverView.backgroundColor = XHBRGBAColor(0, 0, 0, 0.5);
    coverView.alpha = 0;
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapCoverViewToHide:)];
    [coverView addGestureRecognizer:tapGest];
    [self addSubview:coverView];
    
}

- (void)TapCoverViewToHide:(UITapGestureRecognizer *)sender {
    
    [PMPopupView hide];
    
}

+ (void)show {
    
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    PMPopupView *popView = [mainWindow viewWithTag:PMPopupViewTag];
    if (!popView) {
        
        popView = [[PMPopupView alloc] initWithFrame:XHB_SCREEN_BOUDNS];
        [mainWindow addSubview:popView];
        [mainWindow bringSubviewToFront:popView];
    }
    
    UIView *coverView = [popView viewWithTag:PMPopupCoverViewTag];
    [UIView animateWithDuration:0.5f animations:^{
        
        coverView.alpha = 1;
        
    }];
    
}

+ (void)hide {
    
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    PMPopupView *popView = [mainWindow viewWithTag:PMPopupViewTag];
    
    if (popView) {
        UIView *coverView = [popView viewWithTag:PMPopupCoverViewTag];
        [UIView animateWithDuration:0.5f animations:^{
            
            coverView.alpha = 0;
            
        }];
    }
    
}

@end
