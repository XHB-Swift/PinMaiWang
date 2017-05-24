//
//  PMGoodsDetailView.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/18.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMGoodsDetailView.h"
#import "PMDetailViewModel.h"
#import "PMDetailTitleViewCell.h"
#import "PMDetailAdsViewCell.h"

typedef NSInteger PMDetailSubViewTag;

NSString *const PMDetailPushMessage = @"PMDetailPushMessage";
NSString *const PMDetailShowMessage = @"PMDetailShowMessage";

const PMDetailSubViewTag SVMainScrollViewTag = 1000;
const PMDetailSubViewTag SVTableViewTag      = SVMainScrollViewTag * 2;
const PMDetailSubViewTag SVViceScrollViewTag = SVMainScrollViewTag * 3;

@interface PMGoodsDetailView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIScrollView *container;
@property (nonatomic, strong) UITableView  *tableView;
@property (nonatomic, strong) UIView       *detailView;

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

- (void)setMenus:(NSArray<PMDetailViewModel *> *)menus {
    
    _menus = [menus copy];
    [self.tableView reloadData];
}

- (void)initializeMainScrollView {
    
    self.container = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.container.contentSize = CGSizeMake(self.width, self.height * 2);
    self.container.scrollEnabled = NO;
    self.container.pagingEnabled = YES;
    self.container.bounces = YES;
    self.container.tag = SVMainScrollViewTag;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.container.width, self.container.height) style:UITableViewStylePlain];
    self.tableView.tag = SVTableViewTag;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[PMDetailTitleViewCell class] forCellReuseIdentifier:[PMDetailTitleViewCell cellIdentifier]];
    [self.tableView registerClass:[PMDetailAdsViewCell class] forCellReuseIdentifier:[PMDetailAdsViewCell cellIdentifier]];
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        if (self.container.contentOffset.y != self.container.height) {
            [self.container setContentOffset:CGPointMake(0, self.container.height) animated:YES];
        }
        
        [self.tableView.mj_footer endRefreshing];
        
    }];
    
    [footer setTitle:@"继续拖动查看图文详情" forState:MJRefreshStateIdle];
    [footer setTitle:nil forState:MJRefreshStateNoMoreData];
    [footer setTitle:@"继续拖动查看图文详情" forState:MJRefreshStatePulling];
    [footer setTitle:nil forState:MJRefreshStateWillRefresh];
    footer.pullingPercent = 0.2;
    
    self.tableView.mj_footer = footer;
    
    UIScrollView *viceScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(self.container.x, self.container.maxY, self.container.width, self.container.height)];
    viceScroll.tag = SVViceScrollViewTag;
    viceScroll.backgroundColor = [UIColor orangeColor];
    
    
    MJRefreshStateHeader *header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
        
        if (self.container.contentOffset.y != 0) {
            [self.container setContentOffset:CGPointMake(0, 0) animated:YES];
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
    
    [self addSubview:self.container];
    [self.container addSubview:self.tableView];
    [self.container addSubview:viceScroll];
}

#pragma mark TableView数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.menus.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellType = self.menus[indexPath.row].curCellType;
    id cellData = self.menus[indexPath.row].cellTypeOfData[cellType];
    [cell configureCellWithAnyData:cellData];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView dequeueReusableCellWithIdentifier:self.menus[indexPath.row].cellIdentifier forIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.menus[indexPath.row].cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSArray *clickedItems = nil;
    PMDetailViewModel *dtvm = self.menus[indexPath.row];
    
    if (!clickedItems) {
        
        NSPredicate *clickedPred = [NSPredicate predicateWithFormat:@"SELF.canClicked == %d", YES];
        clickedItems = [self.menus filteredArrayUsingPredicate:clickedPred];
        XHBLogObject(clickedItems);
    }
    
    if ([clickedItems containsObject:dtvm]) {
        
        BOOL msgType = [dtvm.curCellType isEqualToString:PMDetailViewCellTypeComment];
        NSString *msg = msgType ? PMDetailPushMessage : PMDetailShowMessage;
        NSDictionary *msgDict = @{msg:dtvm};
        XHBPostNotification(PM_DETAIL_CONTENT_NOTIFICATION, msgDict);
    }
    
}

@end
