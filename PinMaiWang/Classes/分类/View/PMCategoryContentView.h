//
//  PMCategoryContentView.h
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PMCategoryContentView;

@protocol PMCategoryContentViewDataSource <NSObject>

- (NSInteger)category:(PMCategoryContentView *)content leftSide:(UITableView *)left numberOfRowsInSection:(NSInteger)section;
- (NSString *)category:(PMCategoryContentView *)content contentTxtAtIndexPath:(NSIndexPath *)indexPath;


- (NSInteger)category:(PMCategoryContentView *)content rightSide:(UICollectionView *)right numberOfItemsInSection:(NSInteger)section;


@end

@interface PMCategoryContentView : UIView

@property (nonatomic,weak) id<PMCategoryContentViewDataSource> dataSource;
//@property (nonatomic,weak)

+ (instancetype)categoryContentViewWithFrame:(CGRect)frame;

@end
