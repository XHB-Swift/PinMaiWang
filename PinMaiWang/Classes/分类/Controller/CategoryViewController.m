//
//  CategoryViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/15.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "CategoryViewController.h"
#import "PMCategoryItemView.h"
#import "PMCategoryHeaderView.h"
#import "PMCategoryContentView.h"

@interface CategoryViewController () <PMCategoryContentViewDataSource>

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"商品分类";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupHeaderView];
    [self setupContentView];
}

- (void)setupHeaderView {
    
    PMCategoryHeaderView *headerView = [PMCategoryHeaderView categoryHeaderView];
    [headerView setY:64];
    headerView.tag = 10;
    [self.view addSubview:headerView];
    
}

- (void)setupContentView {
    
    PMCategoryHeaderView *headerView = [self.view viewWithTag:10];
    PMCategoryContentView *contentView = [PMCategoryContentView categoryContentViewWithFrame:CGRectMake(0, headerView.maxY, self.view.width, self.view.height-headerView.height)];
    contentView.dataSource = self;
    
    [self.view addSubview:contentView];
}

- (NSInteger)category:(PMCategoryContentView *)content leftSide:(UITableView *)left numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (NSString *)category:(PMCategoryContentView *)content contentTxtAtIndexPath:(NSIndexPath *)indexPath {
    
    return XHBFormatString(@"%ld", indexPath.row+1);
}


- (NSInteger)category:(PMCategoryContentView *)content rightSide:(UICollectionView *)right numberOfItemsInSection:(NSInteger)section {
    
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
