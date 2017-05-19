//
//  PMUpdateViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMUpdateViewController.h"

@interface PMUpdateViewController ()

@end

@implementation PMUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"版本升级";
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 94, XHB_SCREEN_WIDTH, 60)];
    label.font = [UIFont systemFontOfSize:14.0];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"当前版本:2.0.6230\n当前是最新版本";
    [self.view addSubview:label];
    
    
    
}


@end
