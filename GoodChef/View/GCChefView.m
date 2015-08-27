//
//  GCChefView.m
//  GoodChef
//
//  Created by Mac on 15-5-31.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCChefView.h"

@implementation GCChefView
#pragma mark ==============================一系列初始化方法==================

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createMainUI];
        
    }
    return self;
}

#pragma mark ==============================一系列UI创建方法==================


- (void)createMainUI
{
    
    self.tabView  = [[UITableView alloc] initWithFrame:CGRectMake(0,100,IPHONE_WIDTH, IPHONE_HEIGHT - 110)];
    //注册
    [self.tabView registerNib:[UINib nibWithNibName:@"GCChefTableViewCell" bundle:nil] forCellReuseIdentifier:@"identifier"];
    
    self.tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self addSubview:self.tabView];
    
    //创建UI
    UIView *top = [[UIView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, 110)];
    [top setBackgroundColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.6]];
    
    
    self.search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, IPHONE_WIDTH, 50)];
    
    self.search.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.search.placeholder = @"请搜索你想要的厨师名称";
    
    self.search.barStyle = UISearchBarStyleDefault;
    [self.search setBackgroundImage:[UIImage imageNamed:@"searchbg"]];

    
    [top addSubview:self.search];

    NSArray *filterNameArr = @[@"地区",@"用餐时间",@"菜系"];
    for (NSInteger i=0; i<3; i++) {
    
         //创建 1-> 100 2-> 120 3-> 100
        UIControl *select = [[UIControl alloc] initWithFrame:CGRectMake(i * 100, 70, 100, 40)];
        if (i == 1) {
            select.frame = CGRectMake(100, 70, 120, 40);
        }else if (i == 2){
            select.frame = CGRectMake(220, 70, 100, 40);
        }
        select.backgroundColor = [UIColor orangeColor];
        
        [top addSubview:select];
        
        UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        selectBtn.frame = CGRectMake(80, 10, 20, 20);
        
        [selectBtn setImage:[UIImage imageNamed:@"chef_filter_normal"] forState:UIControlStateNormal];
        [selectBtn setImage:[UIImage imageNamed:@"chef_filter_selected"] forState:UIControlStateDisabled];
        [selectBtn addTarget:self action:@selector(filterBtn:) forControlEvents:UIControlEventTouchUpInside];
        [select addSubview:selectBtn];
        UILabel *filterTYpeName = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 60, 30)];
        filterTYpeName.textAlignment = NSTextAlignmentCenter;

        filterTYpeName.font = [UIFont systemFontOfSize:15];
        filterTYpeName.text = filterNameArr[i];
        
        [select addSubview:filterTYpeName];
        
        UIView *vLine = [[UIView alloc] initWithFrame:CGRectMake(99, 5, 1, 30)];
        vLine.backgroundColor = [UIColor lightGrayColor];
        if (i == 1) {
            vLine.frame = CGRectMake(119,  5, 1, 30);
        }
        else if (i == 2){
            vLine.frame = CGRectZero;
        }
        [select addSubview:vLine];
        
        
    }

    [self addSubview:top];



}
#pragma mark ==============================一系列事件响应方法==================

#pragma mark 触发删选数据事件
- (void)filterBtn:(UIButton *)sender
{

    if (self.sendBlock) {
        self.sendBlock(sender);
    }

}


@end
