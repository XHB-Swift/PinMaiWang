//
//  NSString+RegularExpression.h
//  果粉工具箱
//
//  Created by 谢鸿标 on 2017/4/29.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RegularExpression)

/**
  @description 判断日期
  @param target 需要判断的字符串
  @return 返回判断的结果
 */
+ (BOOL)isDate:(NSString *)target;
/**
 @description 判断日期
 @return 返回判断的结果
 */
- (BOOL)isDate;
/**
 @description 判断手机号码
 @param target 需要判断的字符串
 @return 返回判断的结果
 */
+ (BOOL)isMobilePhone:(NSString *)target;
/**
 @description 判断手机号码
 @return 返回判断的结果
 */
- (BOOL)isMobilePhoe;
/**
 @description 判断座机号码
 @param target 需要判断的字符串
 @return 返回判断的结果
 */
+ (BOOL)isTelPhone:(NSString *)target;
/**
 @description 判断座机号码
 @return 返回判断的结果
 */
- (BOOL)isTelPhone;

@end
