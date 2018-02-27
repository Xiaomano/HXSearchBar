//
//  WordTypeTool.m
//  LYBlublu
//
//  Created by apple on 16/9/1.
//  Copyright © 2016年 刘Lingzi. All rights reserved.
//  设置字体的工具类

#import "WordTypeTool.h"

@implementation WordTypeTool
singleton_implementation(WordTypeTool)
-(UIFont *)setFontName:(NSString *)name size:(CGFloat)size
{
   
    UIFont *font ;
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>9.0) {
        font = [UIFont fontWithName:name size:size];
    }else{
        NSArray *typeArray = @[@"STHeitiSC-Medium",@"Helvetica",@"Helvetica-Light",@"Helvetica-Oblique",@"Helvetica-LightOblique",@"Helvetica-Bold",@"STHeitiSC-Light"];
        NSInteger wordIndex = 0;
        if ([name isEqualToString:@"PingFangSC-Medium"]) {
            wordIndex = 0;
        }else if ([name isEqualToString:@"PingFangSC-Light"]){
            wordIndex = 6;
        }else if ([name isEqualToString:@"PingFangSC-Semibold"]){
            wordIndex = 5;
        }else if ([name isEqualToString:@"PingFangSC-Regular"]){
            wordIndex = 1;
        }else if ([name isEqualToString:@"PingFangSC-Thin"]){
            wordIndex =4;
        }
        font = [UIFont fontWithName:typeArray[wordIndex] size:size];
    }
    
    return font;
    
}
@end
