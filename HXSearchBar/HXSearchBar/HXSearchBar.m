//
//  HXSearchBar.m
//  HXSearchBar
//
//  Created by Xiaoxiao_Mac on 2018/2/27.
//  Copyright © 2018年 LinYun. All rights reserved.
//

#import "HXSearchBar.h"
#import "Masonry.h"
#import "ColorTool.h"
#import "WordTypeTool.h"
#define SCALEIPHON6WIDTH [[UIScreen mainScreen]bounds].size.width/375
#define SCALEIPHON6HEIGHT [[UIScreen mainScreen]bounds].size.height/667
#define SCREEN_WIDTH  [[UIScreen mainScreen]bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height

@implementation HXSearchBar
-(instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        //        self.backgroundColor = [UIColor whiteColor];
        [self sizeToFit];

        [self setSearchTextPositionAdjustment:UIOffsetMake(30*SCALEIPHON6WIDTH, 0)];// 设置搜索框中文本框的文本偏移量

    }

    return self;

}

#pragma mark-- 设置搜索框占位符
-(void)addPlaceholderForSearchBar:(NSString *)placeholderText
{

    self.placehlder = [[UILabel alloc]init];
    [self addSubview:self.placehlder];
    [self.placehlder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(65*SCALEIPHON6WIDTH);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH,self.frame.size.height));
    }];

    self.placehlder.text = placeholderText;
    self.placehlder.font = [[WordTypeTool sharedWordTypeTool]setFontName:@"PingFangSC-Light" size:14];
   // [self.placehlder setAttributedText:[NsAttributedString  initWithtitle:placeholderText space:-1.16]];
    self.placehlder.textColor = [ColorTool colorWithHexString:@"#000000" colorWithHexString:0.4];
}

#pragma mark-- 搜索框的背景图
-(void)changeSearchBarBackgroundImage:(NSString *)backImageName
{

    //隐藏占位放大镜图片,及占位符的颜色
    UITextField *searchField = [self valueForKey:@"_searchField"];
    searchField.leftView.hidden = YES;
    searchField.clearButtonMode = UITextFieldViewModeNever;
    searchField.textAlignment = NSTextAlignmentLeft;
    searchField.font = [[WordTypeTool sharedWordTypeTool]setFontName:@"PingFangSC-Light" size:14];
    //取消searchbar原来的背景并且给searchbar添加背景图片
    [self setSearchFieldBackgroundImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
    for (UIView *subview in [[self.subviews firstObject] subviews]) {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            [subview removeFromSuperview];
            break;
        }
    }

}

#pragma mark--给搜索框添加清除按钮
-(void)addClearButton
{
    self.clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.clearButton];
    [self.clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30*SCALEIPHON6WIDTH);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(19*SCALEIPHON6WIDTH, 19*SCALEIPHON6HEIGHT));
    }];
    [self.clearButton setHidden:YES];
    self.clearButton.titleLabel.font = [UIFont fontWithName:@"iconfont" size:13];
    [self.clearButton setTitle:@"\U0000e604" forState:UIControlStateNormal];
    [self.clearButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.clearButton setTitleColor:[ColorTool colorWithHexString:@"#95afdf"colorWithHexString:1] forState:UIControlStateNormal];
    [self.clearButton addTarget:self action:@selector(ContactSClearBtClick:) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark--点击搜索框的清除按钮
-(void)ContactSClearBtClick:(UIButton*)sender
{

    UITextField *searchField = [self valueForKey:@"_searchField"];
    searchField.text= @"";
    [self.placehlder setHidden:NO];
    [sender setHidden:YES];
    NSLog(@"清楚按钮");


}

//设置占位符的位置
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{

    CGRect inset = CGRectMake(bounds.origin.x+100*SCALEIPHON6WIDTH, bounds.origin.y, bounds.size.width -10*SCALEIPHON6WIDTH, bounds.size.height);//更好理解些

    return inset;


}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
