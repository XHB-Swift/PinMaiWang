//
//  BottomBuyCartView.m
//  详情页
//
//  Created by 嚼华先森 on 2017/6/30.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "BottomBuyCartView.h"

@interface BottomBuyCartView   ()

@property (nonatomic,strong) UIButton * btn;
@property (nonatomic,strong) UIButton * joinCart;
@property (nonatomic,strong) UIButton * buyBtn;

@end

@implementation BottomBuyCartView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI{
    
    NSArray *array = @[@"客服",@"店铺",@"收藏"];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.btn.frame = CGRectMake(idx *(self.bounds.size.width/3)/3, 0, (self.bounds.size.width/3)/3, 50);
        [self.btn setTitle:obj forState:UIControlStateNormal];
        self.btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        self.btn.tag = idx;
        [self.btn addTarget:self action:@selector(BottonBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn];
    }];
    
    self.joinCart = [UIButton buttonWithType:UIButtonTypeCustom];
    self.joinCart.frame = CGRectMake(CGRectGetMaxX(self.btn.frame), 0, (self.bounds.size.width/3), 50);
    self.joinCart.backgroundColor = XHBRGBColor(255, 194, 56);
    [self.joinCart setTitle:@"加入购物车" forState:UIControlStateNormal];
    self.joinCart.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [self.joinCart addTarget:self action:@selector(joinCartAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.joinCart];
    
    self.buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buyBtn.frame = CGRectMake(CGRectGetMaxX(self.joinCart.frame), 0, self.bounds.size.width/3, 50);
    self.buyBtn.backgroundColor = XHBRGBColor(255, 106, 30);
    [self.buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    self.buyBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];    
    [self.buyBtn addTarget:self action:@selector(buyBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.buyBtn];
}

-(void)BottonBtnAction:(UIButton *)sender{
    
    switch (sender.tag) {
        case 0:
            NSLog(@"客服");
            break;
        case 1:
            NSLog(@"店铺");
            break;
        case 2:
            NSLog(@"收藏");
        default:
            break;
    }
}

-(void)joinCartAction:(UIButton *)sender{
    
    NSLog(@"加入购物车");
}

-(void)buyBtnAction:(UIButton *)sender{
    
    NSLog(@"立即购买");
    
}


@end
