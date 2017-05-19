//
//  PMMyIntegrateViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMMyIntegrateViewController.h"


@interface PMMyIntegrateViewController ()
@property (nonatomic,strong) UIView  * integrateTopView;


@end

@implementation PMMyIntegrateViewController

-(UIView *)integrateTopView{
    
    if (!_integrateTopView) {
        _integrateTopView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT/6)];
        _integrateTopView.backgroundColor = XHBRGBColor(58, 148, 231);
    }
    return _integrateTopView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"我的积分";
    [self.view addSubview:self.integrateTopView];
    
}




@end
