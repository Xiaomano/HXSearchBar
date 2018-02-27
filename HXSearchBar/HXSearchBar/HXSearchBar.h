//
//  HXSearchBar.h
//  HXSearchBar
//
//  Created by Xiaoxiao_Mac on 2018/2/27.
//  Copyright © 2018年 LinYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXSearchBar : UISearchBar
@property (nonatomic,strong)UIButton *clearButton;    //创建初始时clearButton是处于隐藏状态
@property (nonatomic,strong)UILabel *placehlder;


-(void)addPlaceholderForSearchBar:(NSString *)placeholderText;//搜索框添加占位符
-(void)changeSearchBarBackgroundImage:(NSString *)backImageName;//搜索框的背景图片
-(void)addClearButton;//搜索框添加清除按钮；


@end
