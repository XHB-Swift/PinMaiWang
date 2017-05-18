//
//  PMCategoryContentView.h
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PMCategoryContentView;

typedef NS_ENUM(NSInteger, PMCategoryContentSide) {
    
    PMCategoryContentSideLeft = 1,
    PMCategoryContentSideRight
    
};

@protocol PMCategoryContentViewDataSource <NSObject>

- (NSInteger)category:(PMCategoryContentView *)content forSide:(PMCategoryContentSide)side numberOfElementsInSection:(NSInteger)section;
- (id)category:(PMCategoryContentView *)content forSide:(PMCategoryContentSide)side dataAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol PMCategoryContentViewDelegate <NSObject>

@optional

- (void)category:(PMCategoryContentView *)content didSelectElementforSide:(PMCategoryContentSide)side AtIndex:(NSInteger)index;

@end

@interface PMCategoryContentView : UIView

@property (nonatomic,weak) id<PMCategoryContentViewDataSource> dataSource;
@property (nonatomic,weak) id<PMCategoryContentViewDelegate>   delegate;

+ (instancetype)categoryContentViewWithFrame:(CGRect)frame;
- (void)reloadDataForSide:(PMCategoryContentSide)side;

@end
