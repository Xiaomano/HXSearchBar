//
//  ViewController.m
//  HXSearchBar
//
//  Created by Xiaoxiao_Mac on 2018/2/27.
//  Copyright © 2018年 LinYun. All rights reserved.
//

#import "ViewController.h"
#import "HXSearchBar.h"
#import "ColorTool.h"
#import "WordTypeTool.h"
#define SCALEIPHON6WIDTH [[UIScreen mainScreen]bounds].size.width/375
#define SCALEIPHON6HEIGHT [[UIScreen mainScreen]bounds].size.height/667
#define SCREEN_WIDTH  [[UIScreen mainScreen]bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height

@interface ViewController ()<UISearchBarDelegate>
@property(nonatomic,strong)HXSearchBar *searchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    _searchBar = [[HXSearchBar alloc]initWithFrame:CGRectMake(00*SCALEIPHON6WIDTH, 100*SCALEIPHON6HEIGHT, SCREEN_WIDTH,53*SCALEIPHON6HEIGHT)];
    [self.view addSubview:_searchBar];
    _searchBar.delegate = self;
    [_searchBar addPlaceholderForSearchBar:@"输入好友名字/id/手机号"];
    _searchBar.placehlder.textColor = [ColorTool colorWithHexString:@"#000000" colorWithHexString:1];
    _searchBar.placehlder.font = [[WordTypeTool sharedWordTypeTool] setFontName:@"PingFangSC-Light" size:14];
    [_searchBar changeSearchBarBackgroundImage:@"search2"];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    _searchBar.text = @"";
    [_searchBar.clearButton setHidden:YES];
    [_searchBar.placehlder setHidden:NO];
    [_searchBar changeSearchBarBackgroundImage:@"search2"];
}
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [_searchBar.clearButton setHidden:NO];
    [_searchBar.placehlder setHidden:YES];
    [_searchBar changeSearchBarBackgroundImage:@"search"];


    return YES;
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{

    [_searchBar.clearButton setHidden:YES];
    [_searchBar.placehlder setHidden:NO];
    [_searchBar changeSearchBarBackgroundImage:@"search2"];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
