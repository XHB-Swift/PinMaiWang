//
//  PMAboutViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMAboutViewController.h"

@interface PMAboutViewController ()
@end

@implementation PMAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"关于拼买网";
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, XHB_SCREEN_WIDTH/2, 40)];
    label.backgroundColor = [UIColor whiteColor];
    label.text = @" 软件版本";
    
    UILabel *versions = [[UILabel alloc]initWithFrame:CGRectMake(label.maxX, 64, label.width, label.height)];
    versions.backgroundColor = [UIColor whiteColor];
    versions.text = @"2.0.6230";
    versions.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [self.view addSubview:versions];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, label.maxY, XHB_SCREEN_WIDTH, 0.5)];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    
    UILabel *service = [[UILabel alloc]initWithFrame:CGRectMake(0, view.maxY, label.width, label.height)];
    service.backgroundColor = [UIColor whiteColor];
    service.text = @" 客服电话";
    [self.view addSubview:service];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn .backgroundColor = [UIColor whiteColor];
    btn.frame = CGRectMake(service.maxX, service.y, service.width, service.height);
    [btn setTitle:@"020-81718859" forState:UIControlStateNormal];
    [btn setTitleColor:XHBRGBColor(33, 157, 211) forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

-(void)btnAction:(UIButton *)sender{
    
    NSString *callString = [NSString stringWithFormat:@"tel:020-81718859"];
    UIAlertController *VC = [UIAlertController alertControllerWithTitle:callString message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *call = [UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 调用系统拨号功能
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:callString] options:@{} completionHandler:^(BOOL success) {
            success = YES;
        } ];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [VC addAction:call];
    [VC addAction:cancel];
    [self presentViewController:VC animated:YES completion:nil];
}




@end
