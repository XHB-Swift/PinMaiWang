//
//  NSCalendar+Utils.h
//  果粉工具箱
//
//  Created by 谢鸿标 on 2017/4/27.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (Utils)

/**
  根据日期字符串分析出星期几
 */
+ (NSString *)weekdayByStringDate:(NSString *)strDate;

@end
