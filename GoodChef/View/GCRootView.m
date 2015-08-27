//
//  GCRootView.m
//  GoodChef
//
//  Created by Mac on 15-5-27.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCRootView.h"
@interface GCRootView ()





@end

@implementation GCRootView
#pragma mark ===================================各初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        //创建滚动视图
        [self createSrcoll];
        //创建pagecontrol
        [self createPageControll];
        //创建表格
        
        [self createGrid];
        
        [self cityView];
        
    }
    
    return self;

}

#pragma mark ===================================创建各UI方法

#pragma maek 创建滚动视图
- (void)createSrcoll
{
    
    _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,320,150)];
    CGFloat imgX = 0;
    CGFloat imgY = 0;
    CGFloat imgH = 150;
    CGFloat imgW = 320;
    for (NSInteger i=1; i<5; i++) {
        imgX = i * imgW;
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(imgX, imgY, imgW, imgH)];
        img.userInteractionEnabled  = YES;
        img.tag = 10 + i;
        NSString *str = [NSString stringWithFormat:@"banner%ld.jpg",(long)i];
        img.image = [UIImage imageNamed:str];
        [_scroll addSubview:img];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [img addGestureRecognizer:tap];
    }
    //循环滚动
    UIImageView *first = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    first.userInteractionEnabled  = YES;
    first.tag = 10;
    first.image = [UIImage imageNamed:@"banner4.jpg"];
    [_scroll addSubview:first];
    UITapGestureRecognizer *firsttap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [first addGestureRecognizer:firsttap];
    
    UIImageView *last = [[UIImageView alloc] initWithFrame:CGRectMake(320 * 5, 0, 320, 150)];
    last.image = [UIImage imageNamed:@"banner1.jpg"];
    last.userInteractionEnabled = YES;
    last.tag = 15;
    UITapGestureRecognizer *lasttap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [last addGestureRecognizer:lasttap];
    [_scroll addSubview:last];
    _scroll.contentSize = CGSizeMake(6 * 320, 0);
    _scroll.contentOffset = CGPointMake(320, 0);
    _scroll.pagingEnabled = YES;
    _scroll.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scroll];
    
}

- (void)tap:(UITapGestureRecognizer *)t
{
   UIImageView *img = (UIImageView *)t.view;
    if (self.tapGesture) {
        self.tapGesture(img);
    }


}
#pragma mark 创建pagecontrol
- (void)createPageControll
{
    _page =[[UIPageControl alloc] initWithFrame:CGRectMake(110, 90 + 44, 100, 10)];
    _page.currentPage = 0;
    _page.numberOfPages = 4;
    _page.enabled = YES;
    _page.currentPageIndicatorTintColor = [UIColor redColor];
    
    _page.pageIndicatorTintColor = [UIColor blueColor];
    //增加到scroll
    [self addSubview:_page];
}
#pragma mark 创建城市选择
- (void)cityView
{
    self.city = [UIButton buttonWithType:UIButtonTypeCustom];
    self.city.tag = 888;
//    city.titleLabel.text = @"深圳";
    [self.city setTitle:@"深圳" forState:UIControlStateNormal];
    self.city.backgroundColor = [UIColor whiteColor];
    
    [self.city setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
    self.city.titleLabel.textAlignment = UITextAlignmentLeft;
    self.city.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.city setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.city setImage:[UIImage imageNamed:@"citySelectedImg"] forState:UIControlStateNormal];
    [self.city setImageEdgeInsets:UIEdgeInsetsMake(0, 45, 0, 0)];
    self.city.frame= CGRectMake(0, 30, 60, 40);
    [self.city addTarget:self action:@selector(cityChange:) forControlEvents:UIControlEventTouchUpInside];
    self.cityName = [[UIBarButtonItem alloc] initWithCustomView:self.city];
    

    
    
}

#pragma mark 创建表格
- (void)createGrid
{
    UIView *BaseView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, 320, self.frame.size.height - 150-64-49)]; //305

    BaseView.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:0.8];
    [self addSubview:BaseView];
    
    //划线 横
    UIView *horizontal = [[UIView alloc] initWithFrame:CGRectMake(0, 203, 320, 2)];
    
    horizontal.backgroundColor = [UIColor grayColor];
    
    [BaseView addSubview:horizontal];
    
    //添加两张图
    //预约厨师
    UIControl *orderChef = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
       orderChef.tag = 1000;
    [orderChef addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *orderchefImg = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 160, 160)];
    orderchefImg.image = [UIImage imageNamed:@"appointmentBtn"];
    
    [orderChef addSubview:orderchefImg];
    [BaseView addSubview:orderChef];
    UILabel *orderChefLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 180, 80, 15)];
    orderChefLabel.text= @"预约厨师";
    orderChefLabel.textAlignment = NSTextAlignmentCenter;
    orderChefLabel.font = [UIFont systemFontOfSize:15];
    [orderChef addSubview:orderChefLabel];
    
    //会员服务
    UIControl *vip = [[UIControl alloc] initWithFrame:CGRectMake(0, 205, 200, 100)];
    vip.tag = 1001;
    [vip addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *vipImg = [[UIImageView alloc] initWithFrame:CGRectMake(40, 5, 120, 60)];
    vipImg.image = [UIImage imageNamed:@"vipBtn"];

    [vip addSubview:vipImg];
    
    UILabel *vipLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 70, 80, 15)];
    vipLabel.text= @"会员服务";
    vipLabel.textAlignment = NSTextAlignmentCenter;
    vipLabel.font = [UIFont systemFontOfSize:15];
    [vip addSubview:vipLabel];
    [BaseView addSubview:vip];
    //
    UILabel *vipintro = [[UILabel alloc] initWithFrame:CGRectMake(20, 88, 160, 10)];
    vipintro.text= @"成为最高会员返现2000元";
    vipintro.textColor = [UIColor orangeColor];
    
    vipintro.textAlignment = NSTextAlignmentCenter;
    vipintro.font = [UIFont systemFontOfSize:12];
    
    [vip addSubview:vipintro];
   
    
    


    
    //竖线
    UIView *vertical = [[UIView alloc] initWithFrame:CGRectMake(200, 0, 2, 305)];
    
    vertical.backgroundColor = [UIColor grayColor];
    
    [BaseView addSubview:vertical];
    //小方格分割下
    UIView *grid = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 120, 2)];
    
    grid.backgroundColor = [UIColor grayColor];
    
    [BaseView addSubview:grid];
    
    //后面执行添加三个
    
    //会员服务
    NSMutableArray *namearr = [NSMutableArray arrayWithObjects:@"套餐",@"尝鲜",@"服务保障", nil];
    NSMutableArray *btnArr = [NSMutableArray arrayWithObjects:@"comboBtn",@"freshBtn",@"guaranteeBtn",nil];
    CGFloat imgX = 100;
    CGFloat imgY = 200;
    CGFloat imgW = 118;
    CGFloat imgH = 100;
    for (NSInteger i =0; i<3; i++) {
        
        UIControl *vip = [[UIControl alloc] initWithFrame:CGRectMake(202, imgX * i, 118, 100)];
        [vip addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
        vip.tag = 100 +i;
        UIImageView *vipImg = [[UIImageView alloc] initWithFrame:CGRectMake(30, 10, 60, 60)];
        vipImg.image = [UIImage imageNamed:btnArr[i]];

        [vip addSubview:vipImg];
        
        UILabel *vipLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 80, 15)];
        vipLabel.text= namearr[i];
        vipLabel.textAlignment = NSTextAlignmentCenter;
      
        if (i ==1) {
            vipLabel.frame = CGRectMake(20, 75, 80, 10);
           
            UILabel *tasteintro = [[UILabel alloc] initWithFrame:CGRectMake(10, 88, 100, 10)];
            tasteintro.text= @"吃你吃不到的美食";
            tasteintro.textColor = [UIColor orangeColor];
            
            tasteintro.textAlignment = NSTextAlignmentCenter;
            tasteintro.font = [UIFont systemFontOfSize:10];
            
            [vip addSubview:tasteintro];
        }
        
        if (i != 2) {
            vipLabel.font = [UIFont systemFontOfSize:15];
        }else{
            vipLabel.font = [UIFont systemFontOfSize:17];
        }
      
        [vip addSubview:vipLabel];
        [BaseView addSubview:vip];
    }
 

}
#pragma mark ===================================各点击触发方法
- (void)rightClick:(UIControl *)sender
{

    if (self.sendBlock) {
        self.sendBlock(sender);
    }
}

#pragma mark 城市修改
- (void)cityChange:(UIButton *)sender
{
    if (self.sendBlock) {
        self.sendBlock(sender);
    }
    

}

@end
