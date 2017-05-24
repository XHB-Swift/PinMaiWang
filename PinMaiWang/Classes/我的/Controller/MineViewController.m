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
#import "PMMyAuctionViewController.h"
#import "PMMyFavoriteViewController.h"
#import "PMMyAddressViewController.h"
#import "PMMyInvoiceViewController.h"
#import "PMMyCouponViewController.h"

#import "PMMineView.h"
#import "PMMineHeaderView.h"


@class MineViewController;
typedef void(^PMMineVCOptions)(MineViewController *mine);
NSString *const OPT_KEY = @"ITEM_OPT_KEY";

@interface MineViewController ()

@property (nonatomic,strong) PMMineView *mineView;

@end

@implementation MineViewController

#pragma mark 账户
static PMMineVCOptions opt_account   = ^(MineViewController *mine){
    PMMyAccountViewController *VC = [[PMMyAccountViewController alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [mine.navigationController pushViewController:VC animated:YES];
};
//- (void)opt_account{
//    
//}
#pragma mark 积分
static PMMineVCOptions opt_points    = ^(MineViewController *mine){
    PMMyIntegrateViewController  *VC = [[PMMyIntegrateViewController alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [mine.navigationController pushViewController:VC animated:YES];
};
//- (void)opt_points{
//    
//}
#pragma mark 拍卖
static PMMineVCOptions opt_auction   = ^(MineViewController *mine){
    PMMyAuctionViewController *VC = [[PMMyAuctionViewController alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [mine.navigationController pushViewController:VC animated:YES];

    
    
};
//- (void)opt_auction{
//    
//}
#pragma mark 收藏
static PMMineVCOptions opt_favorite  = ^(MineViewController *mine){
    PMMyFavoriteViewController *VC = [[PMMyFavoriteViewController alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [mine.navigationController pushViewController:VC animated:YES];
    
};
//- (void)opt_favorite{
//    
//}
#pragma mark 收货地址
static PMMineVCOptions opt_address   = ^(MineViewController *mine){
    PMMyAddressViewController *VC = [[PMMyAddressViewController alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [mine.navigationController pushViewController:VC animated:YES];
};
//- (void)opt_address{
//    
//}
#pragma mark 发票
static PMMineVCOptions opt_invoice   = ^(MineViewController *mine){
    PMMyInvoiceViewController *VC = [[PMMyInvoiceViewController alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [mine.navigationController pushViewController:VC animated:YES];
    
};
//- (void)opt_invoice{
//    
//}
#pragma mark 优惠卷
static PMMineVCOptions opt_favorable = ^(MineViewController *mine){
    PMMyCouponViewController *VC = [[PMMyCouponViewController alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [mine.navigationController pushViewController:VC animated:YES];
    
};
//- (void)opt_favorable{
//    
//}
#pragma mark 分享
static PMMineVCOptions opt_share     = ^(MineViewController *mine){
    
};
//- (void)opt_share{
//    
//}
#pragma mark 设置
static PMMineVCOptions opt_settings  = ^(MineViewController *mine){
    PMSettingViewController *VC = [[PMSettingViewController alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [mine.navigationController pushViewController:VC animated:YES];
};
//- (void)opt_settings{
//    
//}
#pragma mark 登录注册
static PMMineVCOptions opt_loginreg = ^(MineViewController *mine){
    PMLoginViewController *VC = [[PMLoginViewController alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [mine.navigationController pushViewController:VC animated:YES];
    
};
//- (void)opt_loginreg{
//    
//}
#pragma mark 点击头像
static PMMineVCOptions opt_icon     = ^(MineViewController *mine){
    
};
//- (void)opt_icon{
//    
//}
#pragma mark 查看订单
static PMMineVCOptions opt_order    = ^(MineViewController *mine){
    
};
//- (void)opt_order{
//    
//}
#pragma mark 待付款
static PMMineVCOptions opt_pay      = ^(MineViewController *mine){
    
};
//- (void)opt_pay{
//    
//}
#pragma mark 待发货
static PMMineVCOptions opt_delivery = ^(MineViewController *mine){
    
};
//- (void)opt_delivery{
//    
//}
#pragma mark 待收货
static PMMineVCOptions opt_recieve  = ^(MineViewController *mine){
    
};
//- (void)opt_recieve{
//    
//}
#pragma mark 待评价
static PMMineVCOptions opt_comment  = ^(MineViewController *mine){
    
};
//- (void)opt_comment{
//    
//}
#pragma mark 已取消
static PMMineVCOptions opt_cancel   = ^(MineViewController *mine){
    
};
//- (void)opt_cancel{
//    
//}
#pragma mark 静态数据
static NSArray<NSDictionary *> *items = nil;

- (instancetype)init {
    
    if (self = [super init]) {
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            items = @[
                      @{@"image":@"me_07",@"title":@"我的账户",OPT_KEY:opt_account},
                      @{@"image":@"me_08",@"title":@"我的积分",OPT_KEY:opt_points},
                      @{@"image":@"me_09",@"title":@"我的拍卖",OPT_KEY:opt_auction},
                      @{@"image":@"me_10",@"title":@"我的收藏",OPT_KEY:opt_favorite},
                      @{@"image":@"me_11",@"title":@"收货地址",OPT_KEY:opt_address},
                      @{@"image":@"me_12",@"title":@"我的发票",OPT_KEY:opt_invoice},
                      @{@"image":@"me_13",@"title":@"我的优惠券",OPT_KEY:opt_favorable},
                      @{@"image":@"me_15_2",@"title":@"分享App",OPT_KEY:opt_share},
                      @{@"image":@"me_01",@"title":@"应用设置",OPT_KEY:opt_settings}
                      ];

        });
        
    }
    
    return self;
}

- (void)confgiureUI {
    
    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.mineView = [PMMineView mineViewForFullScreen];
    self.mineView.funcItems = [items mutableCopy];
    [self.view addSubview:self.mineView];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self confgiureUI];
    [XHBCenter addObserver:self selector:@selector(handleHeaderViewMsg:) name:PMMineHeaderViewMsg object:nil];
    [XHBCenter addObserver:self selector:@selector(handleHeaderViewMsg:) name:PMMineViewMsg object:nil];
}


- (void)handleHeaderViewMsg:(NSNotification *)msg {
    
    if ([msg.object isKindOfClass:[PMMineHeaderViewMsgType class]]) {
        
        PMMineHeaderViewMsgType *hmsg = msg.object;
        static NSDictionary<PMMineHeaderViewMsgType *, PMMineVCOptions> *options = nil;
        if (!options) {
            
            options = @{
              PMMineHeaderViewMsgLoginReg:opt_loginreg,
              PMMineHeaderViewMsgIcon:opt_icon,
              PMMineHeaderViewMsgOrder:opt_order,
              PMMineHeaderViewMsgNotPay:opt_pay,
              PMMineHeaderViewMsgNotDeliver:opt_delivery,
              PMMineHeaderViewMsgNotRecieve:opt_recieve,
              PMMineHeaderViewMsgNotComment:opt_comment,
              PMMineHeaderViewMsgHasCancel:opt_cancel
            };
            
        }
        
        options[hmsg](self);
        
    }
    
    if ([msg.object isKindOfClass: [NSNumber class]]) {
        
        NSInteger idx = [(NSNumber *)msg.object integerValue];
        PMMineVCOptions opt = (PMMineVCOptions)items[idx][OPT_KEY];
        opt(self);
        
    }

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];

}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

@end
