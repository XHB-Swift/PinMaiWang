//
//  PMPrivateInvoiceHeaderView.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/22.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMPrivateInvoiceHeaderView.h"
#include "BLAreaPickerView.h"

@interface PMPrivateInvoiceHeaderView ()<BLPickerViewDelegate,UITextFieldDelegate>

// 单位名称
@property (nonatomic,strong) UILabel * company;
@property (nonatomic,strong) UITextField * companyText;
// 纳税人识别码
@property (nonatomic,strong) UILabel * taxpayer;
@property (nonatomic,strong) UITextField * taxpayerText;

// 注册电话
@property (nonatomic,strong) UILabel * regisNum;
@property (nonatomic,strong) UITextField * regisNumText;
// 注册地址
@property (nonatomic,strong) UILabel * address;
@property (nonatomic,strong) UITextField * addressText;

// 开户银行
@property (nonatomic,strong) UILabel * bank;
@property (nonatomic,strong) UITextField * bankText;
// 开户银行
@property (nonatomic,strong) UILabel * bankName;
@property (nonatomic,strong) UITextField * bankNameText;

// 收票人姓名
@property (nonatomic,strong) UILabel * name;
@property (nonatomic,strong) UITextField * nameText;
// 收票人电话
@property (nonatomic,strong) UILabel * phone;
@property (nonatomic,strong) UITextField * phoneText;
// 选择区域
@property (nonatomic,strong) UILabel * area;
@property (nonatomic,strong) UITextField * selectText;

// 详细地址
@property (nonatomic,strong) UILabel * minuteAddres;
@property (nonatomic,strong) UITextField * minuteAddresText;
@property (nonatomic,strong) BLAreaPickerView * pickView;


@end

@implementation PMPrivateInvoiceHeaderView


+(PMPrivateInvoiceHeaderView *)initializeWithSuperView:(UIView *)topPrivateView WithFrame:(CGRect)frame{
    
    PMPrivateInvoiceHeaderView *headerView = [[PMPrivateInvoiceHeaderView alloc]initWithFrame:frame];
    [topPrivateView addSubview:headerView];
    return headerView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setUpHeaderView];
    }
    return self;
}

-(void)setUpHeaderView{
    
    self.company = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, self.bounds.size.width/3, 30)];
    self.company.text = @"单位名称:";
    self.company.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:self.company];
    self.companyText = [[UITextField alloc]initWithFrame:CGRectMake(self.company.maxX, self.company.y, self.bounds.size.width-self.company.width-10, 30)];
    self.companyText.borderStyle = UITextBorderStyleRoundedRect;
    self.companyText.font = [UIFont systemFontOfSize:13.0];
    self.companyText.delegate = self;
    [self addSubview:self.companyText];
    
    self.taxpayer = [[UILabel alloc]initWithFrame:CGRectMake(self.company.x, self.company.maxY+10, self.company.width, self.company.height)];
    self.taxpayer.text = @"纳税人识别码:";
    self.taxpayer.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:self.taxpayer];
    self.taxpayerText = [[UITextField alloc]initWithFrame:CGRectMake(self.taxpayer.maxX, self.taxpayer.y, self.companyText.width, self.companyText.height)];
    self.taxpayerText.borderStyle =UITextBorderStyleRoundedRect;
    self.taxpayerText.font = [UIFont systemFontOfSize:13.0];
    self.taxpayerText.delegate = self;
    [self addSubview:self.taxpayerText];
    
    self.regisNum = [[UILabel alloc]initWithFrame:CGRectMake(self.taxpayer.x, self.taxpayer.maxY+10, self.taxpayer.width, self.taxpayer.height)];
    self.regisNum .text = @"注册电话:";
    self.regisNum.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:self.regisNum];
    self.regisNumText = [[UITextField alloc]initWithFrame:CGRectMake(self.regisNum.maxX, self.regisNum.y, self.taxpayerText.width, self.taxpayerText.height)];
    self.regisNumText.borderStyle =UITextBorderStyleRoundedRect;
    self.regisNumText.font = [UIFont systemFontOfSize:13.0];
    self.regisNumText.delegate = self;
    [self addSubview:self.regisNumText];
    
    self.address = [[UILabel alloc]initWithFrame:CGRectMake(self.regisNum.x, self.regisNum.maxY+10, self.regisNum.width, self.regisNum.height)];
    self.address.font = [UIFont systemFontOfSize:13.0];
    self.address.text = @"注册地址:";
    [self addSubview:self.address];
    self.addressText = [[UITextField alloc]initWithFrame:CGRectMake(self.regisNumText.x, self.regisNumText.maxY+10, self.regisNumText.width, self.regisNumText.height)];
    self.addressText.borderStyle =UITextBorderStyleRoundedRect;
    self.addressText.font = [UIFont systemFontOfSize:13.0];
    self.addressText.delegate = self;
    [self addSubview:self.addressText];
    
    self.bank =[[UILabel alloc]initWithFrame:CGRectMake(self.address.x, self.address.maxY+10, self.address.width, self.address.height)];
    self.bank.font = [UIFont systemFontOfSize:13.0];
    self.bank.text = @"开户银行:";
    [self addSubview:self.bank];
    self.bankText = [[UITextField alloc]initWithFrame:CGRectMake(self.bank.maxX, self.addressText.maxY+10, self.addressText.width, self.addressText.height)];
    self.bankText.borderStyle =UITextBorderStyleRoundedRect;
    self.bankText.font = [UIFont systemFontOfSize:13.0];
    self.bankText.delegate =self;
    [self addSubview:self.bankText];
    
    self.bankName = [[UILabel alloc]initWithFrame:CGRectMake(self.bank.x, self.bank.maxY+10, self.bank.width, self.bank.height)];
    self.bankName.font = [UIFont systemFontOfSize:13.0];
    self.bankName.text = @"银行账户:";
    [self addSubview:self.bankName];
    self.bankNameText = [[UITextField alloc]initWithFrame:CGRectMake(self.bankText.x, self.bankText.maxY+10, self.bankText.width, self.bankText.height)];
    self.bankNameText.borderStyle =UITextBorderStyleRoundedRect;
    self.bankNameText.font = [UIFont systemFontOfSize:13.0];
    self.bankNameText.delegate = self;
    [self addSubview:self.bankNameText];
    
    self.name = [[UILabel alloc]initWithFrame:CGRectMake(self.bankName.x, self.bankName.maxY+10, self.bankName.width, self.bankName.height)];
    self.name.font = [UIFont systemFontOfSize:13.0];
    self.name.text = @"收票人姓名";
    [self addSubview:self.name];
    self.nameText = [[UITextField alloc]initWithFrame:CGRectMake(self.bankNameText.x, self.bankNameText.maxY+10, self.bankNameText.width, self.bankNameText.height)];
    self.nameText.borderStyle =UITextBorderStyleRoundedRect;
    self.nameText.font = [UIFont systemFontOfSize:13.0];
    self.nameText.delegate = self;
    [self addSubview:self.nameText];
    
    self.phone = [[UILabel alloc]initWithFrame:CGRectMake(self.name.x, self.name.maxY+10, self.name.width, self.name.height)];
    self.phone.font = [UIFont systemFontOfSize:13.0];
    self.phone.text = @"收票人电话";
    [self addSubview:self.phone];
    self.phoneText = [[UITextField alloc]initWithFrame:CGRectMake(self.nameText.x, self.nameText.maxY+10, self.nameText.width, self.nameText.height)];
    self.phoneText.borderStyle =UITextBorderStyleRoundedRect;
    self.phoneText.font = [UIFont systemFontOfSize:13.0];
    self.phoneText.delegate = self;
    [self addSubview:self.phoneText];
    
    self.area = [[UILabel alloc]initWithFrame:CGRectMake(self.phone.x, self.phone.maxY+10, self.phone.width, self.phone.height)];
    self.area.font = [UIFont systemFontOfSize:13.0];
    self.area.text = @"选择区域";
    [self addSubview:self.area];
    self.selectText = [[UITextField alloc]initWithFrame:CGRectMake(self.phoneText.x, self.phoneText.maxY+10, self.phoneText.width, self.phoneText.height)];
    self.selectText.borderStyle = UITextBorderStyleRoundedRect;
    self.selectText.font = [UIFont systemFontOfSize:12.0];
    self.selectText.placeholder = @"请选择省市区";
    self.selectText.delegate = self;
    [self addSubview:self.selectText];
    
    
    self.minuteAddres = [[UILabel alloc]initWithFrame:CGRectMake(self.area.x, self.area.maxY+10, self.area.width, self.area.height)];
    self.minuteAddres.font = [UIFont systemFontOfSize:13.0];
    self.minuteAddres.text = @"详细地址";
    [self addSubview:self.minuteAddres];
    self.minuteAddresText = [[UITextField alloc]initWithFrame:CGRectMake(self.minuteAddres.maxX, self.minuteAddres.y, self.phoneText.width, self.phoneText.height)];
    self.minuteAddresText.font = [UIFont systemFontOfSize:13.0];
    self.minuteAddresText.borderStyle = UITextBorderStyleRoundedRect;
    self.minuteAddresText.delegate = self;
    [self addSubview:self.minuteAddresText];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.minuteAddres.x, self.minuteAddres.maxY, self.bounds.size.width-10, self.minuteAddres.height)];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:8.5];
    label.textColor = [UIColor grayColor];
    label.text = @"*注 增值税专用发票资质信息及资质文件（请把相关文件证明发送至邮箱fp@pmb2b.com 主题栏格式墙填写：增值税专用发票+用户名+联系方式）";
    [self addSubview:label];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    self.pickView = [[BLAreaPickerView alloc]initWithFrame:CGRectMake(0, XHB_SCREEN_HEIGHT/2, XHB_SCREEN_WIDTH, 150)];
    self.pickView.pickViewDelegate = self;
    self.pickView.pickViewBackgroundColor = [UIColor whiteColor];
    [self.pickView bl_show];
}

-(void)bl_selectedAreaResultWithProvince:(NSString *)provinceTitle city:(NSString *)cityTitle area:(NSString *)areaTitle{
    
    self.selectText.text = [NSString stringWithFormat:@"%@%@%@",provinceTitle,cityTitle,areaTitle];
    NSLog(@"self.selectText.text = %@",self.selectText.text);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}


@end
