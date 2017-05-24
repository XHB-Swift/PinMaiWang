//
//  PMMyIntegrateViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMMyIntegrateViewController.h"
#import "IntegrateTopView.h"

@interface PMMyIntegrateViewController ()
// 当前积分
@property (nonatomic,strong) IntegrateTopView * headerView;
@property (nonatomic,strong) UISegmentedControl * segment;
@property (nonatomic,strong) UIView * oneView;
@property (nonatomic,strong) UIView * twoView;


@end

@implementation PMMyIntegrateViewController

-(UIView *)oneView{
    
    if (!_oneView) {
        self.oneView = [[UIView alloc]initWithFrame:CGRectMake(0, 230, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT*0.6)];
        self.oneView.backgroundColor = XHBRGBColor(244, 244, 244);
        NSArray *titles = @[@"品种",@"站内品种排名",@"排名升降",@"积分"];
        [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(idx*XHB_SCREEN_WIDTH/4, 10, XHB_SCREEN_WIDTH/4, 30);
            [btn setTitle:obj forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:13.0];
            btn.backgroundColor = [UIColor whiteColor];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.oneView addSubview:btn];
        }];
        [self.view addSubview:self.oneView];
    }
    return _oneView;
}

-(UIView *)twoView{
    
    if (!_twoView) {
        self.twoView = [[UIView alloc]initWithFrame:CGRectMake(0, 230, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT*0.6)];
        self.twoView.backgroundColor = XHBRGBColor(244, 244, 244);
        [self.view addSubview:self.twoView];
    }
    return _twoView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = XHBRGBColor(255, 255, 255);
    self.title = @"我的积分";
    self.headerView = [IntegrateTopView initializeWithSuperView:self.view WithFrame:CGRectMake(0, 64, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT/6)];
    self.headerView.backgroundColor = XHBRGBColor(58, 148, 231);
    [self.view addSubview:self.headerView];
    [self setUpSegmnetedController];
    
}

-(void)setUpSegmnetedController{
    
    [self.view bringSubviewToFront:self.oneView];
    self.segment = [[UISegmentedControl alloc]initWithItems:@[@"积分明细",@"积分记录"]];
    self.segment.frame = CGRectMake(40, self.headerView.maxY+10, XHB_SCREEN_WIDTH-80, 30);
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
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
    
}

-(void)segmentAction:(UISegmentedControl *)sender{
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            NSLog(@"积分明细");
            [self.view bringSubviewToFront:self.oneView];
            break;
        case 1:
            NSLog(@"积分记录");
            [self.view bringSubviewToFront:self.twoView];
        default:
            break;
    }

}




@end
