//
//  AFNetWorkRequest.h
//  AFWorking
//
//  Created by 嚼华先森 on 2016/10/18.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^dataBlock) (id result);
@interface AFNetWorkRequest : NSObject

//get请求
+(void)getRequestWithUrl:(NSString *)urlString result:(dataBlock)block;

//post请求
+(void)postRequestWithUrl:(NSString *)urlString WithPrameters:(NSDictionary *)dictionary result:(dataBlock)block;


// 检测网络链接状态
+(void)rech:(dataBlock)block;

@end
