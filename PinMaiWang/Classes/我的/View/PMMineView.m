//
//  PMMineView.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMMineView.h"
#import "PMMineCollectionViewCell.h"
#import "PMMineHeaderView.h"

@interface PMMineView () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation PMMineView

+ (instancetype)mineViewForFullScreen {
    
    return [[PMMineView alloc] initWithFrame:XHB_SCREEN_BOUDNS];
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initializeMineView];
    }
    
    return self;
}

- (void)initializeMineView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    CGFloat Spacing = 3;
    flowLayout.itemSize = CGSizeMake((XHB_SCREEN_WIDTH-13)/3, (XHB_SCREEN_WIDTH-4*Spacing)/3);
    flowLayout.minimumInteritemSpacing = Spacing;
    flowLayout.minimumLineSpacing = Spacing;
    flowLayout.sectionInset = UIEdgeInsetsMake(Spacing, Spacing, Spacing, Spacing);
    
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, -20, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT) collectionViewLayout:flowLayout];
    collection.delegate = self;
    collection.dataSource = self;
    collection.backgroundColor = XHBRGBColor(244, 244, 244);
    collection.showsVerticalScrollIndicator = NO;
    collection.showsHorizontalScrollIndicator = NO;
    [collection registerClass:[PMMineCollectionViewCell class] forCellWithReuseIdentifier:[PMMineCollectionViewCell cellIdentifier]];
    [collection registerClass:[PMMineHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[PMMineHeaderView headerIdentifier]];
    flowLayout.headerReferenceSize = CGSizeMake(XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT/1.8);
    
    [self addSubview:collection];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.funcItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return [PMMineCollectionViewCell cellForCollectionView:collectionView atIndexPath:indexPath withDictionary:self.funcItems[indexPath.item]];
}

@end
