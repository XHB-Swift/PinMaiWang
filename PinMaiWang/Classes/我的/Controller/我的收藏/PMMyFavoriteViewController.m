//
//  PMMyFavoriteViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMMyFavoriteViewController.h"
#import "PMBusinessViewController.h"
#import "PMCommodityViewController.h"

@interface PMMyFavoriteViewController ()

// 商家
@property (nonatomic,strong) PMBusinessViewController * businwss;
// 商品
@property (nonatomic,strong) PMCommodityViewController * commdity;


@end

@implementation PMMyFavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = XHBRGBColor(255, 255, 255);
    self.title = @"我的收藏";
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"商品收藏",@"商家收藏"]];
    segment.frame = CGRectMake(40, 74, self.view.bounds.size.width-80, 30);
    segment.selectedSegmentIndex = 0;
    segment.layer.borderColor = XHBRGBColor(234, 30, 74).CGColor;
    segment.tintColor = XHBRGBColor(234, 30, 74);
    segment.backgroundColor = [UIColor whiteColor];
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0],NSForegroundColorAttributeName: [UIColor whiteColor]};
    [segment setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0],NSForegroundColorAttributeName: XHBRGBColor(234, 30, 74)};
    [segment setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    
    
    self.commdity = [PMCommodityViewController new];
    self.commdity.view.frame = CGRectMake(0, segment.maxY+10, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT-114);
    self.commdity.view.backgroundColor = [UIColor yellowColor];
    
    self.businwss = [PMBusinessViewController new];
    self.businwss.view.frame = self.commdity.view.frame;
    self.businwss.view.backgroundColor =[UIColor greenColor];
    [self.view addSubview:self.commdity.view];
    
    
    
    
}

-(void)segmentAction:(UISegmentedControl *)sender{
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            NSLog(@"商品收藏");
            [self.view addSubview:self.commdity.view];
            [self.businwss.view removeFromSuperview];
            break;
        case 1:
            NSLog(@"商家收藏");
            [self.view addSubview:self.businwss.view];
            [self.commdity.view removeFromSuperview];
        default:
            break;
    }
}


@end
