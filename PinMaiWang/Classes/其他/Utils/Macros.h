//
//  Macros.h
//  JiKeTouTiao
//
//  Created by 谢鸿标 on 2017/4/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#import "UIColor+RGB.h"
#import "UIImage+Color.h"
#import "UIImage+Crop.h"
#import "UIImage+ReSize.h"
#import "UITableViewCell+Identifier.h"
#import "UIView+XHBFrame.h"
#import "NSString+RegularExpression.h"
#import "NSString+Security.h"
#import "NSArray+Range.h"
#import "NSArray+Description.h"
#import "NSCalendar+Utils.h"
#import "NSDictionary+Description.h"
#import "UIButton+XHBCommon.h"
#import <objc/runtime.h>
#import <CommonCrypto/CommonDigest.h>

//格式化字符串
#define XHBFormatString(...) [NSString stringWithFormat: __VA_ARGS__]
//UTF8编码过的文件路径
#define UTF8FILEPATH      [NSString stringWithUTF8String: __FILE__]
//UTF8编码过的文件名
#define UTF8FILE          [UTF8FILEPATH  lastPathComponent]

//在DEBUG模式下使用Log
#if DEBUG
//输出路径下的文件，第几行，所在函数，信息
#define XHBFilePathLog(...) NSLog(@"文件路径: %@\n 第%d行\n 所在函数: %s\n 消息: %@ \n", UTF8FILEPATH, __LINE__, __FUNC__, XHBFormatString(__VA_ARGS__))
//输出文件名，第几行，所在函数，信息
#define XHBFileLog(...) NSLog(@"文件名: %@\n 第%d行\n 所在函数: %s\n 消息: %@ \n", UTF8FILE, __LINE__, __FUNC__, XHBFormatString(__VA_ARGS__))
//输出文件名，第几行，信息
#define XHBFileLineMsgLog(...) NSLog(@"文件名: %@\n 第%d行, 消息: %@ \n", UTF8FILE, __LINE__, XHBFormatString(__VA_ARGS__))
//输出第几行，信息
#define XHBLineMsgLog(...) NSLog(@"第%d行, 消息:{\n %@ \n}\n", __LINE__, XHBFormatString(__VA_ARGS__))
//标记某路径，文件输出位置
#define XHBFilePathFlagLog NSLog(@"文件路径: %@\n 第%d行\n", UTF8FILEPATH, __LINE__)
//标记文件输出位置
#define XHBFileFlagLog NSLog(@"文件名: %@\n 第%d行\n", UTF8FILEPATH, __LINE__)
//行标记输出位置
#define XHBLineFlagLog NSLog(@"########## 这是第%d行 ##########", __LINE__)
//自定义输出格式
#define XHBCustomLog(msg, ...) NSLog(@"%@: %@, 第%d行", msg, XHBFormatString(__VA_ARGS__), __LINE__)
#define XHBLogObject(obj) NSLog(@"对象：%@, 行：%d", obj, __LINE__)
//输出常用结构体
#define XHBLogClass(cls) NSLog(@"第%d行, 类名: %@ \n", __LINE__, NSStringFromClass(cls))
#define XHBLogRect(rect) NSLog(@"第%d行, 框: %@ \n", __LINE__, NSStringFromCGRect(rect))
#define XHBLogPoint(point) NSLog(@"第%d行, 坐标: %@ \n", __LINE__, NSStringFromCGPoint(point))
#define XHBLogSize(size) NSLog(@"第%d行, 尺寸: %@ \n", __LINE__, NSStringFromCGSize(size))
#define XHBLogSEL(sel) NSLog(@"第%d行, 选择器: %@ \n", __LINE__, NSStringFromSelector(sel))

//在RELEASE模式下屏蔽Log
#else 

#define XHBFilePathLog(...) nil;
#define XHBFileLog(...) nil;
#define XHBFileLineMsgLog(...) nil;
#define XHBLineMsgLog(...) nil;
#define XHBFilePathFlagLog nil;
#define XHBFileFlagLog nil;
#define XHBCustomLog(msg,...) nil;
#define XHBLogObject(obj) nil;
#define XHBLineFlagLog nil;
#define XHBLogClass(cls) nil;
#define XHBLogRect(rect) nil;
#define XHBLogPoint(point) nil;
#define XHBLogSize(size) nil;

#endif

//对象弱引用
#define XHBWeakObject(obj) __weak typeof(obj) weak##obj = obj
//对象强引用
#define XHBStrongObject(obj) __strong typeof(obj) obj = weak##obj
//弧度转换
#define XHBRadius(degrees) (M_PI * (degrees) / 180.f)
#define XHBDegrees(radius) (radius * 180.f) / M_PI

//通知中心
#define XHBCenter             [NSNotificationCenter defaultCenter]
#define XHBPostNotification(name, params)    [XHBCenter postNotificationName:name object: params]

//系统字体设置
#define XHBSystemFont(size)  [UIFont systemtFontOfSize:size]


//沙盒操作
#define XHBTempPath NSTemporaryDirectory()
//获取沙盒 Document
#define XHBDocumentPath [NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define XHBCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
//Bundle文件操作
#define XHBBundle [NSBundle mainBundle]
#define XHBBundleFile(name, type) [XHBBundle pathForResource:name ofType:type]
#define XHBBunldeNibs(name) [XHBBundle loadNibNamed:name owner:nil options:nil]


#endif /* Macros_h */
