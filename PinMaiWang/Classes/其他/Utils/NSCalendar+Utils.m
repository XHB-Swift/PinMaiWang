//
//  NSCalendar+Utils.m
//  果粉工具箱
//
//  Created by 谢鸿标 on 2017/4/27.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "NSCalendar+Utils.h"

static NSArray<NSString *> *weeks = nil;
static NSArray<NSDictionary *> *formates = nil;

@implementation NSCalendar (Utils)

+ (void)load {
    
    weeks = @[@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"];
    formates = @[@{@"mark":@"年",@"fmt":@"yyyy年MM月dd日"},
                 @{@"mark":@"-",@"fmt":@"yyyy-MM-dd"},
                 @{@"mark":@"/",@"fmt":@"yyyy/MM/dd"},
                 @{@"mark":@".",@"fmt":@"yyyy.MM.dd"}];
    
}

+ (NSString *)filteredFmtWithMark:(NSString *)target {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF['mark'] IN %@",target];
    
    NSDictionary *resDict = [formates filteredArrayUsingPredicate:predicate][0];
    NSString *resStr = resDict[@"fmt"];
    
    return resStr;
}

+ (NSString *)weekdayByStringDate:(NSString *)strDate {
    
    if (!strDate || ![strDate isDate]) {
        return nil;
    }
    
    NSString *dateFormate = [self filteredFmtWithMark:strDate];
    
    if (!dateFormate) {
        return nil;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormate;
    NSDate *date = [formatter dateFromString:strDate];
    NSCalendar *calender = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *componets = [calender components:NSCalendarUnitWeekday fromDate:date];
    NSUInteger weekday = componets.weekday-1;
    
    return weeks[weekday];
}

@end
