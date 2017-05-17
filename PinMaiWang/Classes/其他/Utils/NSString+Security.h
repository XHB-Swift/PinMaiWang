//
//  NSString+Security.h
//  jianhun
//
//  Created by 谢鸿标 on 2017/4/30.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Security)

/**
 @param target 需要使用MD5加密的字符串
 @return 返回加密后的字符串
 */
+ (instancetype)md5WithString:(NSString *)target;
- (instancetype)md5;

/**
 @param target 需要使用SHA256加密的字符串
 @return 返回加密后的字符串
 */
+ (instancetype)sha256WithString:(NSString *)target;
- (instancetype)sha256;

/**
 @param target 需要使用SHA1加密的字符串
 @return 返回加密后的字符串
 */
+ (instancetype)sha1WithString:(NSString *)target;
- (instancetype)sha1;

@end
