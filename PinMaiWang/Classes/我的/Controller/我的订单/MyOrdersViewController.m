//
//  MyOrdersViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/6/5.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "MyOrdersViewController.h"
#import "LZHTopTitleView.h"
#import "AllOrdersViewController.h"
#import "ObligationViewController.h"
#import "ShipmentPendingViewController.h"
#import "RecipientViewController.h"
#import "PendingEvaluationViewController.h"
#import "CanceledViewController.h"


@interface MyOrdersViewController ()
@property (nonatomic,strong) LZHTopTitleView * lzhTopTitleView;

@end

@implementation MyOrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view .backgroundColor = [UIColor whiteColor];
    self.title = @"我的订单";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    [self CraeteUI];
    
}

-(void)CraeteUI{
    
    NSArray *array = @[@"全部",@"待付款",@"待发货",@"待收货",@"待评价",@"已取消"];
    self.lzhTopTitleView.titles = array;
    [self.lzhTopTitleView SetUpViewControllerWithFatherVC:self ChildVC:[self setUpChildVC]];
    [self.view addSubview:self.lzhTopTitleView];
}

-(NSArray<UIViewController *>*)setUpChildVC{
    AllOrdersViewController *allVC = [AllOrdersViewController new];
    ObligationViewController *obVC = [ObligationViewController new];
    ShipmentPendingViewController *shipVC = [ShipmentPendingViewController new];
    RecipientViewController *recVC = [RecipientViewController new];
    PendingEvaluationViewController *pendVC = [PendingEvaluationViewController new];
    CanceledViewController *canceVC = [CanceledViewController new];
    
    NSArray *childVC = @[allVC,obVC,shipVC,recVC,pendVC,canceVC];
    return childVC;
    
}

-(LZHTopTitleView *)lzhTopTitleView{
    
    if (!_lzhTopTitleView) {
        _lzhTopTitleView = [[LZHTopTitleView alloc]initWithFrame:CGRectMake(0, 64, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT)];
    }
    return _lzhTopTitleView;
}



@end
