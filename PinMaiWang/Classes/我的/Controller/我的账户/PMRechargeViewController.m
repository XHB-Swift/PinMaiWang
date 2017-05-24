//
//  PMRechargeViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/23.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMRechargeViewController.h"
#import "PMPayViewController.h"

@interface PMRechargeViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *textFiled;
@end

@implementation PMRechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"充值-我的账户";
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, XHB_SCREEN_WIDTH/4, 40)];
    label.text = @"充值金额";
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15.0];
    [self.view addSubview:label];
    
     self.textFiled = [[UITextField alloc]initWithFrame:CGRectMake(label.maxX, label.y, XHB_SCREEN_WIDTH-label.width, label.height)];
    self.textFiled.backgroundColor = [UIColor whiteColor];
    self.textFiled.placeholder = @"请输入充值金额";
    [self.view addSubview:self.textFiled];
    
    UIButton *next = [UIButton buttonWithType:UIButtonTypeCustom];
    next.frame = CGRectMake(XHB_SCREEN_WIDTH/4, self.textFiled.maxY+50, XHB_SCREEN_WIDTH/2, 30);
    [next setTitle:@"下一步" forState:UIControlStateNormal];
    [next addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    next.backgroundColor = XHBRGBColor(58, 148, 243);
    [self.view addSubview:next];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];

}

-(void)nextAction:(UIButton *)sneder{
    
    NSString *strig = self.textFiled.text;
    int ivalue = [strig intValue];
    if ([self.textFiled.text isEqualToString:@""]) {
        UIAlertController *VC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入正确的充值金额" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [VC addAction:ok];
        [self presentViewController:VC animated:YES completion:nil];
    }else if (ivalue < 10){
        UIAlertController *VC = [UIAlertController alertControllerWithTitle:@"提示" message:@"储值充值不能少于10元" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [VC addAction:ok];
        [self presentViewController:VC animated:YES completion:nil];
    }
    XHBLogObject(@"下一步");
    PMPayViewController *VC = [[PMPayViewController alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    VC.money = self.textFiled.text;
    [self.navigationController pushViewController:VC animated:YES];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
    
}

@end
