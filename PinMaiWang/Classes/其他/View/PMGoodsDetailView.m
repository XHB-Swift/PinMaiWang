//
//  PMGoodsDetailView.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/18.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMGoodsDetailView.h"

typedef NSInteger PMDetailSubViewTag;

const PMDetailSubViewTag SVMainScrollViewTag = 1000;
const PMDetailSubViewTag SVTableViewTag      = SVMainScrollViewTag * 2;
const PMDetailSubViewTag SVViceScrollViewTag = SVMainScrollViewTag * 3;

@interface PMGoodsDetailView () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation PMGoodsDetailView

+ (instancetype)goodsDetailViewWithoutTop {
    
    return [[PMGoodsDetailView alloc] initWithFrame:CGRectMake(0, 64, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT-64)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self=[super initWithFrame:frame]) {
        [self initializeMainScrollView];
    }
    
    return self;
}

- (void)initializeMainScrollView {
    
    UIScrollView *mainScroll = [[UIScrollView alloc] initWithFrame:self.bounds];
    mainScroll.contentSize = CGSizeMake(self.width, self.height * 2);
    mainScroll.scrollEnabled = NO;
    mainScroll.pagingEnabled = YES;
    mainScroll.bounces = YES;
    mainScroll.tag = SVMainScrollViewTag;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mainScroll.width, mainScroll.height) style:UITableViewStylePlain];
    tableView.tag = SVTableViewTag;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor cyanColor];
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        if (mainScroll.contentOffset.y != mainScroll.height) {
            [mainScroll setContentOffset:CGPointMake(0, mainScroll.height) animated:YES];
        }
        
        [tableView.mj_footer endRefreshing];
        
    }];
    
    [footer setTitle:@"继续拖动查看图文详情" forState:MJRefreshStateIdle];
    [footer setTitle:nil forState:MJRefreshStateNoMoreData];
    [footer setTitle:@"继续拖动查看图文详情" forState:MJRefreshStatePulling];
    [footer setTitle:nil forState:MJRefreshStateWillRefresh];
    footer.pullingPercent = 0.2;
    
    tableView.mj_footer = footer;
    
    UIScrollView *viceScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(mainScroll.x, mainScroll.maxY, mainScroll.width, mainScroll.height)];
    viceScroll.tag = SVViceScrollViewTag;
//    viceScroll.contentSize = CGSizeMake(mainScroll.width*2, mainScroll.height);
    viceScroll.backgroundColor = [UIColor orangeColor];
//    viceScroll.pagingEnabled = YES;
//    viceScroll.bounces = YES;
    
    
    MJRefreshStateHeader *header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
        
        if (mainScroll.contentOffset.y != 0) {
            [mainScroll setContentOffset:CGPointMake(0, 0) animated:YES];
        }
        
        [viceScroll.mj_header endRefreshing];
        
    }];
    
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"继续下拉返回商品详情" forState:MJRefreshStateIdle];
    [header setTitle:@"松开返回商品详情" forState:MJRefreshStatePulling];
    [header setTitle:nil forState:MJRefreshStateWillRefresh];
    [header setTitle:nil forState:MJRefreshStateNoMoreData];
    header.pullingPercent = 0.2;
    
    viceScroll.mj_header = header;
    
    [self addSubview:mainScroll];
    [mainScroll addSubview:tableView];
    [mainScroll addSubview:viceScroll];
}

#pragma mark TableView数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
}

@end
