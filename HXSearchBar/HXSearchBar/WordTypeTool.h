//
//  WordTypeTool.h
//  LYBlublu
//
//  Created by apple on 16/9/1.
//  Copyright © 2016年 刘Lingzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import <UIKit/UIKit.h>
@interface WordTypeTool : NSObject
singleton_interface(WordTypeTool)

-(UIFont *)setFontName:(NSString *)name size:(CGFloat)size;


@end
