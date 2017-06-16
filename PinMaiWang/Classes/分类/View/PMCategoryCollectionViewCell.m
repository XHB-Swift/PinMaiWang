//
//  PMCategoryCollectionViewCell.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/6/15.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMCategoryCollectionViewCell.h"

@implementation PMCategoryCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(2, 2, self.bounds.size.width-4, self.bounds.size.width-4)];
        self.imgView.contentMode = UIViewContentModeScaleAspectFit;
        //        self.imgView.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:self.imgView];
        
        self.name = [[UILabel alloc]initWithFrame:CGRectMake(2, CGRectGetMaxY(self.imgView.frame)+5, self.bounds.size.width-4, 30)];
        self.name.font = [UIFont systemFontOfSize:12.0];
        self.name.numberOfLines = 0;
        self.name.textAlignment = NSTextAlignmentCenter;
//        self.name.backgroundColor = [UIColor yellowColor];
        [self .contentView addSubview:self.name];
    }
    return self;
}


@end
