//
//  PMGoodsDetailViewController.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/18.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMGoodsDetailViewController.h"
#import "PMGoodsDetailView.h"
#import "PMDetailViewModel.h"

@interface PMGoodsDetailViewController ()

@end

@implementation PMGoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];
    
    [XHBCenter addObserver:self selector:@selector(handleDetailContentMsg:) name:PM_DETAIL_CONTENT_NOTIFICATION object:nil];
}

- (void)handleDetailContentMsg:(NSNotification *)msg {
    
    NSDictionary<NSString *, PMDetailViewModel *> *msgDict = msg.object;
    typedef void(^PMDetailViewMsgOption)(PMDetailViewModel *vm);
    static NSDictionary<NSString *, PMDetailViewMsgOption> *optd = nil;
    if (!optd) {
        
        optd = @{PMDetailPushMessage:^(PMDetailViewModel *vm) {
            
        },PMDetailShowMessage:^(PMDetailViewModel *vm) {
            
        }};
        
    }
    
    NSString *keyMsg = msgDict.allKeys.firstObject;
    optd[keyMsg](msgDict[keyMsg]);
    
}

- (void)configureUI {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    PMGoodsDetailView *goodsView = [PMGoodsDetailView goodsDetailViewWithoutTop];
    
    PMDetailViewModel *titleVM = [PMDetailViewModel detailViewModelWithCellType:PMDetailViewCellTypeTitle data:nil canBeClicked:NO];
    PMDetailViewModel *adsVM = [PMDetailViewModel detailViewModelWithCellType:PMDetailViewCellTypeAds data:nil canBeClicked:YES];
    
    goodsView.menus = @[titleVM, adsVM];
    
    [self.view addSubview:goodsView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
