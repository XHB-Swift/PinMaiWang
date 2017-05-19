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

typedef void(^PMMineVCOptions)();
NSString *const OPT_KEY = @"ITEM_OPT_KEY";

@interface MineViewController ()

@property (nonatomic,strong) PMMineView *mineView;
@property (nonatomic,strong) NSArray<NSDictionary *> * items;

@end

@implementation MineViewController

#pragma mark 账户
static PMMineVCOptions opt_account   = ^(){
    
};
//- (void)opt_account{
//    
//}
#pragma mark 积分
static PMMineVCOptions opt_points    = ^(){
    
};
//- (void)opt_points{
//    
//}
#pragma mark 拍卖
static PMMineVCOptions opt_auction   = ^(){
    
};
//- (void)opt_auction{
//    
//}
#pragma mark 收藏
static PMMineVCOptions opt_favorite  = ^(){
    
};
//- (void)opt_favorite{
//    
//}
#pragma mark 收货地址
static PMMineVCOptions opt_address   = ^(){
    
};
//- (void)opt_address{
//    
//}
#pragma mark 发票
static PMMineVCOptions opt_invoice   = ^(){
    
};
//- (void)opt_invoice{
//    
//}
#pragma mark 优惠卷
static PMMineVCOptions opt_favorable = ^(){
    
};
//- (void)opt_favorable{
//    
//}
#pragma mark 分享
static PMMineVCOptions opt_share     = ^(){
    
};
//- (void)opt_share{
//    
//}
#pragma mark 设置
static PMMineVCOptions opt_settings  = ^(){
    
};
//- (void)opt_settings{
//    
//}
#pragma mark 登录注册
static PMMineVCOptions opt_loginreg = ^(){
    
};
//- (void)opt_loginreg{
//    
//}
#pragma mark 点击头像
static PMMineVCOptions opt_icon     = ^(){
    
};
//- (void)opt_icon{
//    
//}
#pragma mark 查看订单
static PMMineVCOptions opt_order    = ^(){
    
};
//- (void)opt_order{
//    
//}
#pragma mark 待付款
static PMMineVCOptions opt_pay      = ^(){
    
};
//- (void)opt_pay{
//    
//}
#pragma mark 待发货
static PMMineVCOptions opt_delivery = ^(){
    
};
//- (void)opt_delivery{
//    
//}
#pragma mark 待收货
static PMMineVCOptions opt_recieve  = ^(){
    
};
//- (void)opt_recieve{
//    
//}
#pragma mark 待评价
static PMMineVCOptions opt_comment  = ^(){
    
};
//- (void)opt_comment{
//    
//}
#pragma mark 已取消
static PMMineVCOptions opt_cancel   = ^(){
    
};
//- (void)opt_cancel{
//    
//}

-(NSArray<NSDictionary *> *)items{
    
    if (!_items) {
        _items = @[
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
    [XHBCenter addObserver:self selector:@selector(handleHeaderViewMsg:) name:PMMineHeaderViewMsg object:nil];
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
        
        options[hmsg]();
        
    }
    
    if ([msg.object isKindOfClass: [NSNumber class]]) {
        
        NSInteger idx = [(NSNumber *)msg.object integerValue];
        PMMineVCOptions opt = (PMMineVCOptions)self.items[idx][OPT_KEY];
        opt();
        
    }


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
