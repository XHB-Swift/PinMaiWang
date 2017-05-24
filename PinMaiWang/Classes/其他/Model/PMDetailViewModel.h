//
//  PMDetailViewModel.h
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/20.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const PMDetailViewCellTypeTitle; //详情页标题cell
UIKIT_EXTERN NSString *const PMDetailViewCellTypeDelivery; //快递cell
UIKIT_EXTERN NSString *const PMDetailViewCellTypeAds;  //商家广告cell
UIKIT_EXTERN NSString *const PMDetailViewCellTypeNorms; //产品规格cell
UIKIT_EXTERN NSString *const PMDetailViewCellTypeAddress; //收货地址cell
UIKIT_EXTERN NSString *const PMDetailViewCellTypeComment; //评论cell


@interface PMDetailViewModel : NSObject

@property (nonatomic, readonly) NSDictionary<NSString *, id> *cellTypeOfData;
@property (nonatomic, readonly) NSString *cellIdentifier;
@property (nonatomic, readonly) NSString *curCellType;
@property (nonatomic, readonly) CGFloat   cellHeight;
@property (nonatomic, readonly) BOOL      canClicked;


+ (instancetype)detailViewModelWithCellType:(NSString *)aCellType data:(NSDictionary *)data canBeClicked:(BOOL)can;

@end
