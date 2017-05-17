//
//  NSString+Security.m
//  jianhun
//
//  Created by 谢鸿标 on 2017/4/30.
//  Copyright © 2017年 谢鸿标. All rights reserved.
//

#import "NSString+Security.h"

@implementation NSString (Security)

+ (instancetype)md5WithString:(NSString *)target {
    
    return [target md5];
}

- (instancetype)md5 {
    
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *outPut = [NSMutableString string];
    
    for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        
        [outPut appendFormat:@"%02x", digest[i]];
    }
    
    return outPut;
}

+ (instancetype)sha256WithString:(NSString *)target {
    
    return [target sha256];
}

- (instancetype)sha256 {
    
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(cStr, (CC_LONG)strlen(cStr), digest);
    NSMutableString* output = [NSMutableString string];
    
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;

}

+ (instancetype)sha1WithString:(NSString *)target {
    
    return [target sha1];
}

- (instancetype)sha1 {
    
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString* output = [NSMutableString string];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
    
}

@end
