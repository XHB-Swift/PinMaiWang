//
//  PMDeatilModel.m
//  详情页
//
//  Created by 嚼华先森 on 2017/6/23.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMDeatilModel.h"

@implementation PMDeatilModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

+(instancetype)ModelWithDict:(NSDictionary *)dict{
    
    PMDeatilModel *model = [[PMDeatilModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}


@end
