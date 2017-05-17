//
//  NSDictionary+Description.m
//  果粉工具箱
//
//  Created by 谢鸿标 on 2017/4/27.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "NSDictionary+Description.h"

@implementation NSDictionary (Description)

+ (void)load {
    
    Method sys_desc = class_getInstanceMethod([self class], @selector(description));
    Method cus_desc = class_getInstanceMethod([self class], @selector(cus_description));
    
    method_exchangeImplementations(sys_desc, cus_desc);
}

- (NSString *)cus_description {
    
    NSMutableString *muDesc = [NSMutableString string];
    NSUInteger count = self.count;
    
    [muDesc appendString:XHBFormatString(@"dictionary length: %ld", count)];
    if (count == 0) {
        return muDesc;
    }
    
    [muDesc appendString:@"key -> value: {\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [muDesc appendString:XHBFormatString(@"key=%@, value=%@", key, obj)];
        
    }];
    
    [muDesc appendString:@"}\n"];
    
    return muDesc;
}

@end
