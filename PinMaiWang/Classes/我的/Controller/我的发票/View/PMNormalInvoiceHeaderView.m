//
//  PMNormalInvoiceHeaderView.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/22.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMNormalInvoiceHeaderView.h"

@interface PMNormalInvoiceHeaderView ()

// 发票抬头
@property (nonatomic,strong) UILabel * title;
@property (nonatomic,strong) UITextField * titleText;

// 收票人姓名
@property (nonatomic,strong) UILabel * name;
@property (nonatomic,strong) UITextField  * nameText;

// 选择区域
@property (nonatomic,strong) UILabel * area;

// 详细地址
@property (nonatomic,strong) UILabel * address;
@property (nonatomic,strong) UITextField * addressText;

// 收票人手机号码
@property (nonatomic,strong) UILabel * number;
@property (nonatomic,strong) UITextField * numerText;

@end

@implementation PMNormalInvoiceHeaderView

+(PMNormalInvoiceHeaderView *)initializeWithSuperView:(UIView *)topNormalView WithFrame:(CGRect)frame{
    
    PMNormalInvoiceHeaderView *headerView = [[PMNormalInvoiceHeaderView alloc]initWithFrame:frame];
    [topNormalView addSubview:headerView];
    return headerView;
}


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setUpHeaderView];
    }
    return self;
}

-(void)setUpHeaderView{
    
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(5, 15, self.bounds.size.width/3, 30)];
    self.title.text = @"(发票抬头):";
    self.title.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:self.title];
    
    self.titleText = [[UITextField alloc]initWithFrame:CGRectMake(self.title.maxX, self.title.y, self.bounds.size.width-self.title.width-10, self.title.height)];
    self.titleText.borderStyle = UITextBorderStyleRoundedRect;
    self.titleText.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:self.titleText];
    
    self.name = [[UILabel alloc]initWithFrame:CGRectMake(self.title.x, self.title.maxY+10, self.title.width, self.title.height)];
    self.name.text = @"收票人姓名:";
    self.name.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:self.name];
    
    self.nameText = [[UITextField alloc]initWithFrame:CGRectMake(self.name.maxX, self.name.y, self.titleText.width, self.titleText.height)];
    self.nameText.borderStyle = UITextBorderStyleRoundedRect;
    self.nameText.font = [UIFont systemFontOfSize:13.0];
    [self addSubview: self.nameText];
    
    self.area = [[UILabel alloc]initWithFrame:CGRectMake(self.name.x, self.name.maxY+10, self.name.width, self.name.height)];
    self.area.font = [UIFont systemFontOfSize:13.0];
    self.area.text = @"选择区域:";
    [self addSubview:self.area];
    
    self.address = [[UILabel alloc]initWithFrame:CGRectMake(self.area.x, self.area.maxY+10, self.area.width, self.area.height)];
    self.address.font = [UIFont systemFontOfSize:13.0];
    self.address.text = @"详细地址:";
    [self addSubview:self.address];
    
    self.addressText = [[UITextField alloc]initWithFrame:CGRectMake(self.address.maxX, self.address.y, self.bounds.size.width-self.address.width-10, self.address.height)];
    self.addressText.font = [UIFont systemFontOfSize:13.0];
    self.addressText.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.addressText];
    
    self.number = [[UILabel alloc]initWithFrame:CGRectMake(self.address.x, self.address.maxY+10, self.address.width, self.address.height)];
    self.number.font = [UIFont systemFontOfSize:13.0];
    self.number.text = @"收票人手机号码:";
    [self addSubview:self.number];
    
    self.numerText = [[UITextField alloc]initWithFrame:CGRectMake(self.number.maxX, self.number.y, self.bounds.size.width-self.number.width-10, self.number.height)];
    self.numerText.borderStyle =UITextBorderStyleRoundedRect;
    [self addSubview:self.numerText];
    
    
    
    
}


@end
