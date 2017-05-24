//
//  PMMyCouponViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMMyCouponViewController.h"
#import "LXSegmentScrollView.h"

@interface PMMyCouponViewController ()

@end

@implementation PMMyCouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"我的优惠券";
    self.automaticallyAdjustsScrollViewInsets=NO;
    NSMutableArray *array=[NSMutableArray array];
    for (int i =0; i<3; i++) {
        UIView *view=[[UIView alloc] init];
        if (i==0) {
            view.backgroundColor = [UIColor whiteColor];
        }else if (i==1) {
            view.backgroundColor = XHBRGBColor(244, 244, 244);
        }else{
            view.backgroundColor = [UIColor yellowColor];
        }
        [array addObject:view];
    }
    LXSegmentScrollView *scrollerView = [[LXSegmentScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height) titleArray:@[@"未使用优惠券",@"已使用优惠券",@"已失效优惠券"] contentViewArray:array];
    [self.view addSubview:scrollerView];
    
}



@end
