//
//  PMProductModel.h
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/6/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMProductModel : NSObject

@property (nonatomic,strong) NSString * img;//图片
@property (nonatomic,strong) NSString * name;//标题
@property (nonatomic,strong) NSString * number;//单价
@property (nonatomic,strong) NSString * allNumb;//总价
@property (nonatomic,strong) NSString * sizes;//大小
@property (nonatomic,strong) NSString * CutePet;//已售
@property (nonatomic,strong) NSString * sellOut;
@property (nonatomic,strong) NSString * pic;

+(instancetype)modelDealWithDict:(NSDictionary *)dict;

@end
