//
//  LZHCollectionViewCell.m
//  UICollectionView无限轮播
//
//  Created by 嚼华先森 on 2017/6/22.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "LZHCollectionViewCell.h"

@interface LZHCollectionViewCell ()

@end

@implementation LZHCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    return self;
}

- (void)config{
    self.imgView = [[UIImageView alloc]init];
    self.imgView.frame = self.bounds;
    [self addSubview:self.imgView];
    self.imgView.userInteractionEnabled = YES;
    self.imgView.layer.masksToBounds = YES;
}

@end
