//
//  PMPrivateInvoiceViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/22.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMPrivateInvoiceViewController.h"
#import "PMPrivateInvoiceHeaderView.h"

@interface PMPrivateInvoiceViewController ()
@property (nonatomic,strong) PMPrivateInvoiceHeaderView * headerView;
@end

@implementation PMPrivateInvoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"增值税专用发票";

    self.headerView = [PMPrivateInvoiceHeaderView initializeWithSuperView:self.view WithFrame:CGRectMake(5, 74, XHB_SCREEN_WIDTH-10, XHB_SCREEN_HEIGHT*0.75)];
    self.headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.headerView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(XHB_SCREEN_WIDTH/4, self.headerView.maxY+15, XHB_SCREEN_WIDTH-((XHB_SCREEN_WIDTH/4)*2), 40);
    button.layer.cornerRadius = 5.0;
    button.layer.masksToBounds = YES;
    button.backgroundColor = XHBRGBColor(58, 148, 243);
    [button setTitle:@"保存" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self .view addSubview:button];

}

-(void)buttonAction:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}



@end
