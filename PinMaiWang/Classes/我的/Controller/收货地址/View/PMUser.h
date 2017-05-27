//
//  PMUser.h
//  我的地址
//
//  Created by 嚼华先森 on 2017/5/26.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const PMUserGoodsListChangeMsg;
UIKIT_EXTERN NSString *const PMUserGoodsListWillChanged;
UIKIT_EXTERN NSString *const PMUserGoodsListDidChanged;

UIKIT_EXTERN NSString *const PMUserAddressListChangeMsg;
UIKIT_EXTERN NSString *const PMUserAddressListWillChanged;
UIKIT_EXTERN NSString *const PMUserAddressListDidChanged;

@interface PMUser : NSObject

+ (instancetype)shareUser;

/**
 收货地址数量
 
 @return 返回用户收货地址数量
 */
- (NSInteger)countOfAddress;

/**
 用户添加收货地址

 @param address 收货地址
 */
- (void)addAddress:(id)address;

/**
 返回收货地址

 @param index 该收货地址在数组中索引
 @return 返回收货
 */
- (id)addressAtIndex:(NSInteger)index;

/**
 删除收货地址

 @param index 收货地址在数组中索引
 */
- (void)removeAddressAtIndex:(NSInteger)index;

/**
 购物车货物数量

 @return 返回购物车货物数量
 */
- (NSInteger)countOfGoodsList;

/**
 用户添加货物

 @param goods 货物
 */
- (void)addGoods:(id)goods;

/**
 返回货物

 @param index 该货物在数组中的索引
 @return 返回货物
 */
- (id)goodsAtIndex:(NSInteger)index;

/**
 删除货物

 @param index 删除货物在数组中索引
 */
- (void)removeGoodsAtIndex:(NSInteger)index;

@end
