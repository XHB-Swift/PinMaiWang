//
//  NSArray+Description.m
//  果粉工具箱
//
//  Created by 谢鸿标 on 2017/4/27.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "NSArray+Description.h"

@implementation NSArray (Description)

+ (void)load {
    
    Method sys_desc = class_getInstanceMethod([self class], @selector(description));
    Method cus_desc = class_getInstanceMethod([self class], @selector(cus_description));
    
    method_exchangeImplementations(sys_desc, cus_desc);
    
}

- (NSString *)cus_description {
    
    NSMutableString *muDesc = [NSMutableString string];
    NSUInteger count = self.count;
    
    [muDesc appendString:XHBFormatString(@"array length: %ld", self.count)];
    if (count == 0) {
        return muDesc;
    }
    
    [muDesc appendString:@"elements: [\n"];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [muDesc appendString:XHBFormatString(@"idx: %ld, obj: %@ \n", idx,obj)];
        
    }];
    
    [muDesc appendString:@"]\n"];
    
    return muDesc;
}

@end
