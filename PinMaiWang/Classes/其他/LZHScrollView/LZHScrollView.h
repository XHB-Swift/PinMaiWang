//
//  LZHScrollView.h
//  UICollectionView无限轮播
//
//  Created by 嚼华先森 on 2017/6/22.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SelectIndex)(NSInteger index);
@interface LZHScrollView : UIView

// 图片数组
@property (nonatomic,strong) NSArray<NSString *> * images;
// 是否开启自动轮播
@property (nonatomic,assign) BOOL isAutomatic;

//是否添加倒计时
@property (nonatomic,assign) BOOL  isCountdown;

// 对外提供collectionView的cell点击事件
-(void)didSelectCollectionViewItemAtIndex:(SelectIndex)index;


@end
