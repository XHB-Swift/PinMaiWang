//
//  CategoryViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/15.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "CategoryViewController.h"
#import "PMGoodsDetailViewController.h"

#import "PMCategoryItemView.h"
#import "PMCategoryHeaderView.h"
#import "PMCategoryContentView.h"

@interface CategoryViewController () <PMCategoryContentViewDataSource, PMCategoryContentViewDelegate>

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"商品分类";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupHeaderView];
    [self setupContentView];
}

- (void)setupHeaderView {
    
    PMCategoryHeaderView *headerView = [PMCategoryHeaderView categoryHeaderView];
    headerView.y = 64;
    [headerView adjusHeaderViewFrame];
    headerView.tag = 10;
    [self.view addSubview:headerView];
    
}

- (void)setupContentView {
    
    PMCategoryHeaderView *headerView = [self.view viewWithTag:10];
    PMCategoryContentView *contentView = [PMCategoryContentView categoryContentViewWithFrame:CGRectMake(0, headerView.maxY, self.view.width, self.view.height-headerView.height)];
    contentView.dataSource = self;
    contentView.delegate = self;
    
    [self.view addSubview:contentView];
}

- (NSInteger)category:(PMCategoryContentView *)content forSide:(PMCategoryContentSide)side numberOfElementsInSection:(NSInteger)section {
    
    return (side == PMCategoryContentSideLeft) ? 3 : 3;
    
}

- (id)category:(PMCategoryContentView *)content forSide:(PMCategoryContentSide)side dataAtIndexPath:(NSIndexPath *)indexPath {
    
    return (side == PMCategoryContentSideLeft) ? XHBFormatString(@"%ld", indexPath.row+1) : @{@"imgColor":[UIColor cyanColor],@"lblTxt":@"2"};
}

- (void)category:(PMCategoryContentView *)content didSelectElementforSide:(PMCategoryContentSide)side AtIndex:(NSInteger)index {
    
    PMGoodsDetailViewController *vc = [[PMGoodsDetailViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
