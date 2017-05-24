//
//  PMWatercourseViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/23.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMWatercourseViewController.h"

@interface PMWatercourseViewController ()
@property (nonatomic,strong) UISegmentedControl * segment;
@property (nonatomic,strong) UIView * oneView;
@property (nonatomic,strong) UIView * twoView;
@property (nonatomic,strong) UIView * threeView;


@end

@implementation PMWatercourseViewController
-(UIView *)oneView{
    
    if (!_oneView) {
        self.oneView = [[UIView alloc]initWithFrame:CGRectMake(0, 104, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT)];
        self.oneView.backgroundColor = XHBRGBColor(244, 244, 244);
        [self.view addSubview:self.oneView];
        
        
    }
    return _oneView;
}

-(UIView *)twoView{
    
    if (!_twoView) {
        
        self.twoView = [[UIView alloc]initWithFrame:CGRectMake(0, 104, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT)];
        self.twoView.backgroundColor =[UIColor whiteColor];
        [self.view addSubview:self.twoView];
        
    }return _twoView;
}
-(UIView *)threeView{
    
    if (!_threeView) {
        self.threeView = [[UIView alloc]initWithFrame:CGRectMake(0, 104, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT)];
        self.threeView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.threeView];
    }
    return _threeView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"我的流水";
    [self setUpSegmnetedController];
}

-(void)setUpSegmnetedController{
    
    [self.view bringSubviewToFront:self.oneView];
    self.segment = [[UISegmentedControl alloc]initWithItems:@[@"转入",@"消费",@"提现"]];
    self.segment.frame = CGRectMake(5, 74, XHB_SCREEN_WIDTH-10, 30);
    self.segment.layer.cornerRadius = 3.0;
    self.segment.layer.masksToBounds = YES;
    
    self.segment.selectedSegmentIndex = 0;
    self.segment.layer.borderColor = XHBRGBColor(245, 30, 75).CGColor;
    self.segment.layer.borderWidth = 1.0;
    
    self.segment.tintColor = XHBRGBColor(245, 30, 75);
    self.segment.backgroundColor = [UIColor whiteColor];
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0],NSForegroundColorAttributeName: [UIColor whiteColor]};
    [self.segment setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0],NSForegroundColorAttributeName: XHBRGBColor(245, 30, 75)};
    [self.segment setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    [self.segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segment];
    
}
-(void)segmentAction:(UISegmentedControl *)sender{
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            XHBLogObject(@"转入");
            [self.view bringSubviewToFront:self.oneView];
            break;
        case 1:
            XHBLogObject(@"消费");
            [self.view bringSubviewToFront:self.twoView];
            break;
        case 2:
            XHBLogObject(@"提现");
            [self.view bringSubviewToFront:self.threeView];
        default:
            break;
    }
}
@end
