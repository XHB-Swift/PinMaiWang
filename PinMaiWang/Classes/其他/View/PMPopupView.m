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
NSInteger const PMPopupContentViewTag = PMPopupViewTag - 1000;

@implementation PMPopupView

- (void)setupCoverView {
    
    self.tag = PMPopupViewTag;
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

+ (void)showWithContentView:(__kindof UIView *)contentView {
    
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    PMPopupView *popView = [mainWindow viewWithTag:PMPopupViewTag];
    if (!popView) {
        
        popView = [[PMPopupView alloc] initWithFrame:XHB_SCREEN_BOUDNS];
        [popView setupCoverView];
        contentView.y = popView.height;
        contentView.tag = PMPopupContentViewTag;
        [popView addSubview:contentView];
        [mainWindow addSubview:popView];
        [mainWindow bringSubviewToFront:popView];
    }
    
    UIView *coverView = [popView viewWithTag:PMPopupCoverViewTag];
    [UIView animateWithDuration:0.25f animations:^{
        
        coverView.alpha = 1;
        contentView.y = popView.height - contentView.height;
        
    }];
    
}

+ (void)hide {
    
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    PMPopupView *popView = [mainWindow viewWithTag:PMPopupViewTag];
    if (popView) {
        
        UIView *coverView = [popView viewWithTag:PMPopupCoverViewTag];
        __kindof UIView *contentView = [popView viewWithTag:PMPopupContentViewTag];
        [UIView animateWithDuration:0.25f animations:^{
            
            contentView.y = popView.height;
            coverView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            //[mainWindow sendSubviewToBack:popView];
            [popView removeFromSuperview];
            
        }];
        
    }
    
}

@end
