//
//  NSString+RegularExpression.m
//  果粉工具箱
//
//  Created by 谢鸿标 on 2017/4/29.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "NSString+RegularExpression.h"

@implementation NSString (RegularExpression)

+ (BOOL)isDate:(NSString *)target {
    
    return [target isDate];
}

- (BOOL)isDate {
    
    NSString *dateRegx = @"^(^(\\d{4}|\\d{2})(\\-|\\/|\\.)\\d{1,2}\3\\d{1,2}$)|(^\\d{4}年\\d{1,2}月\\d{1,2}日$)$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", dateRegx];
    
    return [predicate evaluateWithObject:self];
}

+ (BOOL)isMobilePhone:(NSString *)target {
    
    return [target isMobilePhoe];
}

- (BOOL)isMobilePhoe {
    
    NSString *phoneRegx = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegx];
    
    return [predicate evaluateWithObject:self];
}

+ (BOOL)isTelPhone:(NSString *)target {
    
    return [target isTelPhone];
}

- (BOOL)isTelPhone {
    
    NSString *telRegx = @"^(\\d{3,4}-)\\d{7,8}$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telRegx];
    
    return [predicate evaluateWithObject:self];
}

@end
