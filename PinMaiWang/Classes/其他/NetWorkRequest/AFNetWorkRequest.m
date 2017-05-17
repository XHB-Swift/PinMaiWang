//
//  AFNetWorkRequest.m
//  AFWorking
//
//  Created by 嚼华先森 on 2016/10/18.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import "AFNetWorkRequest.h"
#import "AFNetworking.h"

@implementation AFNetWorkRequest

+(void)getRequestWithUrl:(NSString *)urlString result:(dataBlock)block{
    
    
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    absoluteString 完整的字符串
    
    [manager GET:url.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSLog(@"%@",responseObject);
        block(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@",error.debugDescription);
    }];
    

    
}

+(void)postRequestWithUrl:(NSString *)urlString WithPrameters:(NSDictionary *)dictionary result:(dataBlock)block{
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    [manager POST:urlString parameters:dictionary progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSLog(@"%@",responseObject);
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error = %@",error.debugDescription);
    }];
    

    
}

// 检测网络链接状态

+(void)rech:(dataBlock)block{
    
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
       
//        NSLog(@"status = %ld",(long)status);
        block(@(status));
    }];
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
}

@end
