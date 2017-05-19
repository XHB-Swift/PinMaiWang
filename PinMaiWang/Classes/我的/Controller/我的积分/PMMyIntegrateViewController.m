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
// 当前积分
@property (nonatomic,strong) UILabel * number;


@end

@implementation PMMyIntegrateViewController

-(UIView *)integrateTopView{
    
    if (!_integrateTopView) {
        _integrateTopView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT/6)];
        _integrateTopView.backgroundColor = XHBRGBColor(58, 148, 231);
        UILabel *currentIntegrate = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _integrateTopView.width, _integrateTopView.height/2)];
        currentIntegrate.text = @"当前积分";
        currentIntegrate.textColor =[UIColor whiteColor];
        currentIntegrate.textAlignment = NSTextAlignmentCenter;
        [_integrateTopView addSubview:currentIntegrate];
        
        self.number = [[UILabel alloc]initWithFrame:CGRectMake(0, currentIntegrate.maxY, currentIntegrate.width, currentIntegrate.height)];
        self.number.text = [NSString stringWithFormat:@"%@",@"0"];
        self.number.textAlignment = NSTextAlignmentCenter;
        self.number.textColor = [UIColor whiteColor];
        [_integrateTopView addSubview:self.number];
        
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
