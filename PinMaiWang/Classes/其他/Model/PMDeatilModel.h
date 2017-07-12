//
//  PMDeatilModel.h
//  详情页
//
//  Created by 嚼华先森 on 2017/6/23.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMDeatilModel : NSObject
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSString * tips;
@property (nonatomic,strong) NSString * price;
@property (nonatomic,strong) NSString * allPrices;
@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * date;

+(instancetype)ModelWithDict:(NSDictionary *)dict;


@end
