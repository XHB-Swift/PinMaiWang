//
//  PMCategoryContentView.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMCategoryContentView.h"
#import "PMCategoryLeftViewCell.h"
#import "PMCategoryRightViewCell.h"

#define CONTENT_SIDE_RATO 100

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
    leftSide.tag = PMCategoryContentSideLeft * CONTENT_SIDE_RATO;
    leftSide.separatorStyle = UITableViewCellSeparatorStyleNone;
    [leftSide registerClass:[PMCategoryLeftViewCell class] forCellReuseIdentifier:[PMCategoryLeftViewCell cellIdentifier]];
    
    CGFloat sideLength = (self.width-leftSide.width-5-5)/2;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(sideLength, sideLength);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.sectionInset = UIEdgeInsetsZero;//UIEdgeInsetsMake(0, 0, 0, 0);
    UICollectionView *rightSide = [[UICollectionView alloc] initWithFrame:CGRectMake(leftSide.maxX+5, leftSide.y, self.width-leftSide.width-5, leftSide.height) collectionViewLayout:flowLayout];
    rightSide.dataSource = self;
    rightSide.delegate = self;
    rightSide.tag = PMCategoryContentSideRight * CONTENT_SIDE_RATO;
    rightSide.backgroundColor = [UIColor whiteColor];
    [rightSide registerClass:[PMCategoryRightViewCell class] forCellWithReuseIdentifier:[PMCategoryRightViewCell cellIdentifier]];
    
    [self addSubview:leftSide];
    [self addSubview:rightSide];
}

#pragma mark 刷新数据

- (void)reloadDataForSide:(PMCategoryContentSide)side {
    
    id sideView = [self viewWithTag:side * CONTENT_SIDE_RATO];
    [sideView performSelector:@selector(reloadData)];
}

#pragma mark UITableView 数据源代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataSource category:self forSide:PMCategoryContentSideLeft numberOfElementsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [PMCategoryLeftViewCell cellForTableView:tableView atIndexPath:indexPath withAnyData: (_dataSource && [self.dataSource respondsToSelector:@selector(category:forSide:dataAtIndexPath:)]) ? [self.dataSource category:self forSide:PMCategoryContentSideLeft dataAtIndexPath:indexPath] : nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger rightSection = [self.dataSource category:self forSide:PMCategoryContentSideLeft numberOfElementsInSection:indexPath.row];
    
    if (_delegate && [self.delegate respondsToSelector:@selector(category:didSelectElementforSide:AtIndex:)]) {
        
        [self.delegate category:self didSelectElementforSide:PMCategoryContentSideLeft AtIndex:rightSection];
        
    }
    
}

#pragma mark UICollectionView 数据源代理方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.dataSource category:self forSide:PMCategoryContentSideRight numberOfElementsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return [PMCategoryRightViewCell cellForCollectionView:collectionView atIndexPath:indexPath withDictionary:(_dataSource && [self.dataSource respondsToSelector:@selector(category:forSide:dataAtIndexPath:)]) ? [self.dataSource category:self forSide:PMCategoryContentSideRight dataAtIndexPath:indexPath] : nil];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_delegate && [self.delegate respondsToSelector:@selector(category:didSelectElementforSide:AtIndex:)]) {
        
        [self.delegate category:self didSelectElementforSide:PMCategoryContentSideRight AtIndex:indexPath.item];
    }
    
}

@end
