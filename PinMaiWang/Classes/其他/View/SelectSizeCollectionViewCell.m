//
//  SelectSizeCollectionViewCell.m
//  UILabel文本自适应
//
//  Created by 嚼华先森 on 2017/6/29.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "SelectSizeCollectionViewCell.h"

@implementation SelectSizeCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        [self setCell];
    }
    return self;
}

-(void)setCell{
    
    self.cellLabel = [[UILabel alloc]init];
    self.cellLabel.frame =CGRectMake(0, 0, self.bounds.size.width, 30);
//    self.cellLabel.layer.cornerRadius = 15.0;
//    self.cellLabel.layer.masksToBounds = YES;
    self.cellLabel.textAlignment = NSTextAlignmentCenter;
    self.cellLabel.font = [UIFont systemFontOfSize:12.0];
    [self addSubview:self.cellLabel];
}

// 更改cell选中的字体和背景颜色
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    self.cellLabel.textColor = selected? [UIColor whiteColor]:[UIColor blackColor];
    self.backgroundColor = selected?XHBRGBColor(252, 81, 31):XHBRGBColor(245, 245, 245);
}

@end
