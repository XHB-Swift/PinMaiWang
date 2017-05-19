//
//  MineViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/15.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "MineViewController.h"
#import "PMMineCollectionViewCell.h"
#import "PMSettingViewController.h"
#import "PMLoginViewController.h"
#import "PMMyAccountViewController.h"
#import "PMMyIntegrateViewController.h"

#import "PMMineView.h"
#import "PMMineHeaderView.h"

@interface MineViewController ()

@property (nonatomic,strong) PMMineView *mineView;
@property (nonatomic,strong) NSArray<NSDictionary *> * items;

@end

@implementation MineViewController

-(NSArray<NSDictionary *> *)items{
    
    if (!_items) {
        _items = @[
                   @{@"image":@"me_07",@"title":@"我的账户"},
                   @{@"image":@"me_08",@"title":@"我的积分"},
                   @{@"image":@"me_09",@"title":@"我的拍卖"},
                   @{@"image":@"me_10",@"title":@"我的收藏"},
                   @{@"image":@"me_11",@"title":@"收货地址"},
                   @{@"image":@"me_12",@"title":@"我的发票"},
                   @{@"image":@"me_13",@"title":@"我的优惠券"},
                   @{@"image":@"me_15_2",@"title":@"分享App"},
                   @{@"image":@"me_01",@"title":@"应用设置"}
                ];
    }
    return _items;
}

- (void)confgiureUI {
    
    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.mineView = [PMMineView mineViewForFullScreen];
    self.mineView.funcItems = [self.items mutableCopy];
    [self.view addSubview:self.mineView];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self confgiureUI];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.hidden = YES;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.hidden = NO;
    
    
}




@end
