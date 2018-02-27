//
//  ColorTool.m
//  DXLoChat
//
//  Created by 韩晓 on 16/3/14.
//  Copyright © 2016年 Dianxin. All rights reserved.
//

#import "ColorTool.h"

@implementation ColorTool

+(UIColor *)colorWithHexString:(NSString *)hexString colorWithHexString:(CGFloat)alpha
{
    NSString *colString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // 字符串必须为6位或8位的才能识别，要写全，如果颜色代码不对默认为黑色
    
    if ([colString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([colString hasPrefix:@"0X"]) colString = [colString substringFromIndex:2];
    if ([colString hasPrefix:@"#"]) colString = [colString substringFromIndex:1];
    if ([colString length] != 6) return [UIColor blackColor];
    
    //将字符串转换成我们需要的RGB颜色
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    // 获取0~2位字符串
    NSString *rString = [colString substringWithRange:range];
    range.location = 2;
    // 获取2~4位字符串
    NSString *gString = [colString substringWithRange:range];
    range.location = 4;
    // 获取4~6位字符串
    NSString *bString = [colString substringWithRange:range];
    
    // 转换成RGB的值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}


@end
