//
//  PMMyInvoiceViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMMyInvoiceViewController.h"
#import "PMNormalInvoiceViewController.h"
#import "PMPrivateInvoiceViewController.h"

@interface PMMyInvoiceViewController ()

@property (nonatomic,strong) UIButton * normalBtn;
@property (nonatomic,strong) UIButton * privateBtn;

@end

@implementation PMMyInvoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"我的发票";
    
    
    self.normalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.normalBtn.frame = CGRectMake(40, 108, XHB_SCREEN_WIDTH-80, 40);
    self.normalBtn.backgroundColor = XHBRGBColor(58, 148, 243);
    [self.normalBtn setTitle:@"增值税普通发票" forState:UIControlStateNormal];
    self.normalBtn.layer.cornerRadius = 5.0;
    self.normalBtn.layer.masksToBounds = YES;
    [self.normalBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.normalBtn];
    
    
    self.privateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.privateBtn.frame = CGRectMake(self.normalBtn.x, self.normalBtn.maxY+20, self.normalBtn.width, self.normalBtn.height);
    self.privateBtn.backgroundColor = XHBRGBColor(58, 148, 243);
    [self.privateBtn setTitle:@"增值税专用发票" forState:UIControlStateNormal];
    self.privateBtn .layer.cornerRadius = 5.0;
    self.privateBtn.layer.masksToBounds = YES;
    [self.privateBtn addTarget:self action:@selector(privateBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.privateBtn];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];

}

-(void)buttonAction:(UIButton *)sender{
    
    XHBLogObject(@"增值税普通发票");
    PMNormalInvoiceViewController *VC = [[PMNormalInvoiceViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)privateBtnAction:(UIButton *)sender{
    
    XHBLogObject(@"增值税专用发票");
    PMPrivateInvoiceViewController *VC = [[PMPrivateInvoiceViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
