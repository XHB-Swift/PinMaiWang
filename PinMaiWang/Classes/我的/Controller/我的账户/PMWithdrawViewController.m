//
//  PMWithdrawViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/23.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMWithdrawViewController.h"

@interface PMWithdrawViewController ()
@property (nonatomic,strong)UITextField *textFiled;
@property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UIButton * confirm;

@end

@implementation PMWithdrawViewController

-(UIButton *)confirm{
    
    if (!_confirm) {
        _confirm = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirm.frame  = CGRectMake(XHB_SCREEN_WIDTH/4, XHB_SCREEN_HEIGHT/2, XHB_SCREEN_WIDTH/2, 35);
        _confirm.backgroundColor = XHBRGBColor(58, 148, 243);
        [_confirm setTitle:@"确认" forState:UIControlStateNormal];
        [_confirm addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirm;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"提现-我的账户";
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, XHB_SCREEN_WIDTH/4, 40)];
    label.text = @"  提现金额";
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15.0];
    [self.view addSubview:label];
    
    self.textFiled = [[UITextField alloc]initWithFrame:CGRectMake(label.maxX, label.y, XHB_SCREEN_WIDTH-label.width, label.height)];
    self.textFiled.backgroundColor = [UIColor whiteColor];
    self.textFiled.font = [UIFont systemFontOfSize:15.0];
    self.textFiled.placeholder = @"请输入提现金额";
    [self.view addSubview:self.textFiled];
    
    self.numLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.textFiled.maxY+5, XHB_SCREEN_WIDTH, 30)];
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"  可提现金额为:%@.00元",self.textFiled.text]];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(7, self.textFiled.text.length+3)];
    self.numLabel.attributedText = AttributedStr;
    [self.view addSubview:self.numLabel];
    
    
    UILabel *tipText = [[UILabel alloc]initWithFrame:CGRectMake(0, self.numLabel.maxY+10, XHB_SCREEN_WIDTH, 100)];
    tipText.font = [UIFont systemFontOfSize:14.0];
    tipText.numberOfLines = 0;
    tipText.text = @"  温馨提示:\n  微信、支付宝支付方式提现按原来支付途径退回\n  提现至银行卡账户1000元内收取1%的手续费";
    [self.view addSubview:tipText];
    [self.view addSubview:self.confirm];
    
    
}

-(void)confirmAction:(UIButton *)sender{
    
    XHBLogObject(@"确认");
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
    
}


@end
