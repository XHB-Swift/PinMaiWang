//
//  PMGoodsDetailViewController.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/18.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMGoodsDetailViewController.h"
#import "PMGoodsDetailView.h"

@interface PMGoodsDetailViewController ()

@end

@implementation PMGoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    PMGoodsDetailView *goodsView = [PMGoodsDetailView goodsDetailViewWithoutTop];
    [self.view addSubview:goodsView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
