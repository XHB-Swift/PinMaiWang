//
//  PMProductModel.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/6/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMProductModel.h"

@implementation PMProductModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

+(instancetype)modelDealWithDict:(NSDictionary *)dict{
    
    PMProductModel *model = [[self alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}


@end
