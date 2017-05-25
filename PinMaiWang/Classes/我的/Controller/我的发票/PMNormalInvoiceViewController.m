//
//  PMNormalInvoiceViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/22.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMNormalInvoiceViewController.h"
#import "PMNormalInvoiceHeaderView.h"

@interface PMNormalInvoiceViewController ()
@property (nonatomic,strong) PMNormalInvoiceHeaderView * normlHeaderView;

@end

@implementation PMNormalInvoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"增值税普通发票";
    
    if (UI_IS_IPHONE5) {
        self.normlHeaderView = [PMNormalInvoiceHeaderView initializeWithSuperView:self.view  WithFrame:CGRectMake(10, 74, XHB_SCREEN_WIDTH-20, XHB_SCREEN_HEIGHT/2.5)];
        self.normlHeaderView.backgroundColor = XHBRGBColor(255, 255, 255);
        [self.view addSubview:self.normlHeaderView];
    }else if (UI_IS_IPHONE6){
        self.normlHeaderView = [PMNormalInvoiceHeaderView initializeWithSuperView:self.view  WithFrame:CGRectMake(10, 74, XHB_SCREEN_WIDTH-20, XHB_SCREEN_HEIGHT/3)];
        self.normlHeaderView.backgroundColor = XHBRGBColor(255, 255, 255);
        [self.view addSubview:self.normlHeaderView];
    }else if (UI_IS_IPHONE6PLUS){
        self.normlHeaderView = [PMNormalInvoiceHeaderView initializeWithSuperView:self.view  WithFrame:CGRectMake(10, 74, XHB_SCREEN_WIDTH-20, XHB_SCREEN_HEIGHT/3.5)];
        self.normlHeaderView.backgroundColor = XHBRGBColor(255, 255, 255);
        [self.view addSubview:self.normlHeaderView];
    }
    
    UIButton *OK = [UIButton buttonWithType:UIButtonTypeCustom];
    OK.frame = CGRectMake(XHB_SCREEN_WIDTH/4, self.normlHeaderView.maxY+20, XHB_SCREEN_WIDTH-((XHB_SCREEN_WIDTH/4)*2), 40);
    OK.backgroundColor = XHBRGBColor(58, 148, 243);
    OK.layer.cornerRadius = 5.0;
    OK.layer.masksToBounds = YES;
    [OK setTitle:@"保存" forState:UIControlStateNormal];
    [OK addTarget:self action:@selector(OKAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:OK];

}

-(void)OKAction:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"保存");
}



@end
