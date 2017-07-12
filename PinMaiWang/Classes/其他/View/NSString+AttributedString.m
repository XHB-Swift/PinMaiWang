//
//  NSString+AttributedString.m
//  富文本计算行高
//
//  Created by 嚼华先森 on 2017/7/10.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "NSString+AttributedString.h"

@implementation NSString (AttributedString)

-(NSAttributedString *)stringWithLineSpeace:(CGFloat)lineSpeace WithTextColor:(UIColor *)textColor AndWithTextFont:(UIFont *)font {
    
//    设置段落
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.lineSpacing = lineSpeace;
    
//    字体间距
    NSDictionary *dict = @{NSParagraphStyleAttributeName:style,NSKernAttributeName:@1.5f};
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc]initWithString:self attributes:dict];
    
//    文字属性
    NSDictionary *dictionary = @{NSForegroundColorAttributeName:textColor,NSFontAttributeName:font};
    [attriString addAttributes:dictionary range:NSMakeRange(0, self.length)];
    return attriString;
}

-(CGFloat)HeightWithLineSpeace:(CGFloat)lineSpeace WithFont:(UIFont *)font AndWidth:(CGFloat)width{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
//    行高
    style.lineSpacing = lineSpeace;
//    字体间距
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:style, NSKernAttributeName:@1.5f };
    CGSize size = [self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}

@end
