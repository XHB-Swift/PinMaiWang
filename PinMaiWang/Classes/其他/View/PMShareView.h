//
//  PMShareView.h
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/26.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PMShareView;

@protocol PMShareViewDelegate <NSObject>

@optional

- (void)shareActionDidCancelInView:(PMShareView *)share;
- (void)shareView:(PMShareView *)share didClickWithTitle:(NSString *)title;

@end

@interface PMShareView : UIView

@property (nonatomic, assign) id<PMShareViewDelegate> delegate;

+ (instancetype)shareViewWithAutoFrame;

@end
