//
//  PMCategoryCollectionViewHeaderView.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/6/15.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMCategoryCollectionViewHeaderView.h"

@implementation PMCategoryCollectionViewHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(2, 0, self.frame.size.width, 30)];
        self.label.font = [UIFont systemFontOfSize:20.0];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.backgroundColor = XHBRGBColor(206, 206, 206);
        [self addSubview:self.label];
    }
    return self;
}


@end
