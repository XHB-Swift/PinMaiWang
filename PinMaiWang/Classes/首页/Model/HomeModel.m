//
//  HomeModel.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

+(instancetype)homeModelDealWithDict:(NSDictionary *)dict{
    
    HomeModel *model = [[HomeModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}


@end
