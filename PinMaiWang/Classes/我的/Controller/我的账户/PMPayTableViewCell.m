//
//  PMPayTableViewCell.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/24.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMPayTableViewCell.h"

@implementation PMPayTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 30)];
        self.label.textColor =[UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:15.0];
        [self addSubview:self.label];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
