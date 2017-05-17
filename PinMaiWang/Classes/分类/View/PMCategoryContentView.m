//
//  PMCategoryContentView.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMCategoryContentView.h"
#import "PMCategoryLeftViewCell.h"

@interface PMCategoryContentView () <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation PMCategoryContentView

+ (instancetype)categoryContentViewWithFrame:(CGRect)frame {
    
    return [[PMCategoryContentView alloc] initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self=[super initWithFrame:frame]) {
        [self initializeView];
    }
    
    return self;
}

- (void)initializeView {
    
    self.backgroundColor = PM_CATEGORY_BACKGROUND_COLOR;
    
    UITableView *leftSide = [[UITableView alloc] initWithFrame:CGRectMake(0, 5, (self.width-5)*0.2, self.height-10) style:UITableViewStylePlain];
    leftSide.delegate = self;
    leftSide.dataSource = self;
    leftSide.rowHeight = 32;
    leftSide.separatorStyle = UITableViewCellSeparatorStyleNone;
    [leftSide registerClass:[PMCategoryLeftViewCell class] forCellReuseIdentifier:[PMCategoryLeftViewCell cellIdentifier]];
    
    CGFloat sideLength = (self.width-leftSide.width-5)/2;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(sideLength, sideLength);
    flowLayout.sectionInset = UIEdgeInsetsZero;//UIEdgeInsetsMake(0, 0, 0, 0);
    UICollectionView *rightSide = [[UICollectionView alloc] initWithFrame:CGRectMake(leftSide.maxX+5, leftSide.y, self.width-leftSide.width-5, leftSide.height) collectionViewLayout:flowLayout];
    rightSide.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:leftSide];
    [self addSubview:rightSide];
}

#pragma mark UITableView 数据源代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataSource category:self leftSide:tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [PMCategoryLeftViewCell cellForTableView:tableView atIndexPath:indexPath withAnyData: (_dataSource && [self.dataSource respondsToSelector:@selector(category:contentTxtAtIndexPath:)]) ? [self.dataSource category:self contentTxtAtIndexPath:indexPath] : nil];
}

#pragma mark UICollectionView 数据源代理方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.dataSource category:self rightSide:collectionView numberOfItemsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
}

@end
