//
//  IntegrateTopView.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/22.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "IntegrateTopView.h"

@interface IntegrateTopView ()

@property (nonatomic,strong) UILabel * currentIntegrate;
@property (nonatomic,strong) UILabel * number;
@end

@implementation IntegrateTopView

+(IntegrateTopView *)initializeWithSuperView:(UIView *)topView WithFrame:(CGRect)frame{
    
    IntegrateTopView *view = [[IntegrateTopView alloc]initWithFrame:frame];
    [topView addSubview:view];
    return view;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setUpHeaderView];
    }
    return self;
}

-(void)setUpHeaderView{
    self.currentIntegrate = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, self.bounds.size.width, 40)];
    self.currentIntegrate.textAlignment = NSTextAlignmentCenter;
    self.currentIntegrate.text = @"当前积分";
    self.currentIntegrate.textColor = [UIColor whiteColor];
    [self addSubview:self.currentIntegrate];
    
    self.number = [[UILabel alloc]initWithFrame:CGRectMake(self.currentIntegrate.x, self.currentIntegrate.maxY, self.bounds.size.width, self.currentIntegrate.height)];
    self.number.textAlignment = NSTextAlignmentCenter;
    self.number.textColor = [UIColor whiteColor];
    self.number.text = @"0";
    [self addSubview:self.number];
    
    
}

@end
