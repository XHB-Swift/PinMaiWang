//
//  HomeModel.h
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject
// 配图
@property (nonatomic,strong) NSString * icon;
// 标题
@property (nonatomic,strong) NSString * name;
// 规格
@property (nonatomic,strong) NSString * size;
// 单价
@property (nonatomic,strong) NSString * price;
// 总价
@property (nonatomic,strong) NSString * allPrice;
// 已售
@property (nonatomic,strong) NSString * sellOut;
// 产地
@property (nonatomic,strong) NSString * img;

+(instancetype)homeModelDealWithDict:(NSDictionary *)dict;

@end
