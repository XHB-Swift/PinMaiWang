//
//  NSString+AttributedString.h
//  富文本计算行高
//
//  Created by 嚼华先森 on 2017/7/10.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSString (AttributedString)


-(NSAttributedString *)stringWithLineSpeace:(CGFloat)lineSpeace WithTextColor:(UIColor *)textColor AndWithTextFont:(UIFont *)font;

-(CGFloat)HeightWithLineSpeace:(CGFloat)lineSpeace WithFont:(UIFont *)font AndWidth:(CGFloat)width;



@end
