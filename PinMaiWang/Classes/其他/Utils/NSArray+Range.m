//
//  NSArray+Range.m
//  果粉工具箱
//
//  Created by 谢鸿标 on 2017/4/27.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "NSArray+Range.h"

@implementation NSArray (Range)

+ (void)load {
    
    Method sys_objAtIndex = class_getInstanceMethod([self class], @selector(objectAtIndex:));
    Method cus_objAtIndex = class_getInstanceMethod([self class], @selector(cus_objectAtIndex:));
    method_exchangeImplementations(sys_objAtIndex, cus_objAtIndex);
    
    Method sys_objAtIndexedSubscript = class_getInstanceMethod([self class], @selector(objectAtIndexedSubscript:));
    Method cus_objAtIndexedSubscript = class_getInstanceMethod([self class], @selector(cus_objectAtIndexedSubscript:));
    
    method_exchangeImplementations(sys_objAtIndexedSubscript, cus_objAtIndexedSubscript);
    
    
}

- (id)cus_objectAtIndex:(NSUInteger)index{
        
    return (index<self.count) ? [self cus_objectAtIndex:index] : nil;
    
}

- (id)cus_objectAtIndexedSubscript:(NSUInteger)idx {
    
    return (idx<self.count) ? [self cus_objectAtIndexedSubscript:idx] : nil;
}

@end
