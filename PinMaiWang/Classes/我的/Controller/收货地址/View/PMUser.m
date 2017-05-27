//
//  PMUser.m
//  我的地址
//
//  Created by 嚼华先森 on 2017/5/26.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMUser.h"

NSString *const PMUserGoodsListChangeMsg = @"PMUserGoodsListChangeMsg";
NSString *const PMUserGoodsListWillChanged = @"PMUserGoodsListWillChanged";
NSString *const PMUserGoodsListDidChanged = @"PMUserGoodsListDidChanged";

NSString *const PMUserAddressListChangeMsg = @"PMUserAddressListChangeMsg";
NSString *const PMUserAddressListWillChanged = @"PMUserAddressListWillChanged";
NSString *const PMUserAddressListDidChanged = @"PMUserAddressListDidChanged";

static PMUser *user = nil;

@interface PMUser ()

@property (nonatomic, strong) NSMutableArray *addressList;
@property (nonatomic, strong) NSMutableArray *goodsList;

@end

@implementation PMUser

+ (instancetype)shareUser {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        user = [[PMUser alloc] init];
        user.addressList = [NSMutableArray array];
        user.goodsList = [NSMutableArray array];
        
    });
    
    return user;
    
}

- (NSInteger)countOfAddress {
    
    return self.addressList.count;
}

- (void)addAddress:(id)address {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:PMUserAddressListChangeMsg object:PMUserAddressListWillChanged];
    
    [self.addressList addObject:address];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:PMUserAddressListChangeMsg object:PMUserAddressListDidChanged];
    
}

- (id)addressAtIndex:(NSInteger)index {
    
    return (index >= [self countOfAddress]) ? nil : self.addressList[index];
}

- (void)removeAddressAtIndex:(NSInteger)index {
    
    id address = [self addressAtIndex:index];
    address ? [self.addressList removeObject:address] : nil;
    
}

- (NSInteger)countOfGoodsList {
    
    return self.goodsList.count;
}

- (void)addGoods:(id)goods {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:PMUserGoodsListChangeMsg object:PMUserGoodsListWillChanged];
    
    [self.goodsList addObject:goods];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:PMUserGoodsListChangeMsg object:PMUserGoodsListDidChanged];
}

- (id)goodsAtIndex:(NSInteger)index {
    
    return (index >= [self countOfGoodsList]) ? nil : self.goodsList[index];
}

- (void)removeGoodsAtIndex:(NSInteger)index {
    
    id goods = [self addressAtIndex:index];
    goods ? [self.goodsList removeObject:goods] : nil;
}

@end
