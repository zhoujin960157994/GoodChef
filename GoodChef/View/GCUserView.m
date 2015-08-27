//
//  GCUserView.m
//  GoodChef
//
//  Created by Mac on 15-5-28.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCUserView.h"
//类扩展
@interface GCUserView ()
//最基的view
@property (nonatomic,strong) UIView *baseView;

@property (nonatomic,strong) UIButton *quickLogin;

//背景图
@property (nonatomic,strong) UIImageView *img;
//用户头像
@property (nonatomic,strong) UIImageView *headicon;
//用户姓名
@property (nonatomic,strong) UILabel *infolabel;


@end

@implementation GCUserView
#pragma mark =================================各初始化方法---------

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
 
        
        
        [self createHeader];
        
        
        [self createTableView];
        
        //创建
        [self createBottomUI];
    }
    
    return self;
}
#pragma mark =================================各创建UI方法---------
#pragma mark 创建头部
- (void)createHeader
{

    //baseview
    self.baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 160)];

    [self addSubview:self.baseView];
    //
    self.img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 80)];
    self.img.image= [UIImage imageNamed:@"profile_picBg"];
    [self.baseView addSubview:self.img];
    //快捷登陆
    self.quickLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.quickLogin setTitle:@"快速登录" forState:UIControlStateNormal];
    
    self.quickLogin.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.quickLogin.layer.borderWidth = 0.5f;
    self.quickLogin.frame = CGRectMake(100, 30, 120, 30);
    
    [self.img addSubview:self.quickLogin];
    //设置btn 的baseview
    UIView *btnVIew = [[UIView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(self.img.frame), IPHONE_WIDTH, 80)];
    btnVIew.backgroundColor = [UIColor whiteColor];
    [self.baseView addSubview:btnVIew];
    //设置-- frame

    CGFloat imgW = 60;
    CGFloat imgH = 60;
    //按钮的图片数组 20 60 20 20 60 20
    NSArray *btnImgArr = @[@"profile_order",@"profile_chef",@"profile_cash_coupon"];
    //蚊子数组
    NSArray *namelabel = @[@"我的订单",@"我的厨师",@"我的现金券"];
    //controll 100 10 100 10 100 = 320
    for (NSInteger i=0; i< 3; i++) {

        //按钮
        UIButton *navBtn = [UIButton buttonWithType:UIButtonTypeCustom];

        navBtn.tag = 120 + i;
        [navBtn addTarget:self action:@selector(TopClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [navBtn setImage:[UIImage imageNamed:btnImgArr[i]] forState:UIControlStateNormal];
        navBtn.frame = CGRectMake( (i * 110), 0, 100, 80);
        
        [btnVIew addSubview:navBtn];
        //label
        [navBtn setTitle:namelabel[i] forState:UIControlStateNormal];
        navBtn.imageEdgeInsets = UIEdgeInsetsMake(5,13,20,navBtn.titleLabel.bounds.size.width);//设置

        navBtn.titleLabel.font = [UIFont systemFontOfSize:13];//title字体大小
        navBtn.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
        [navBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
        [navBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
        navBtn.titleEdgeInsets = UIEdgeInsetsMake(60, -navBtn.titleLabel.bounds.size.width-50, 0, 0);//设置title

        
    }
    

    
    //在self。img上加
    //iconimg
    _headicon = [[UIImageView alloc] initWithFrame:CGRectMake(50, 20, 60, 60)];
    
    _headicon.image = [UIImage imageNamed:@"nologin"];
    
    [self.img addSubview:_headicon];
    
    
    
    //uilabel
    _infolabel = [[UILabel alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(self.img.frame)- 15, 220,15)];
    _infolabel.text = @"快速登录无需注册,方便快捷，快来试一试！";
    _infolabel.font = [UIFont systemFontOfSize:11];
    _infolabel.textAlignment = NSTextAlignmentCenter;
    
    _infolabel.textColor = [UIColor whiteColor];
    
    [self.img addSubview:_infolabel];       //baseview
   
   

}
#pragma mark 创建tableView
- (void)createTableView
{
    

    _tabView = [[UITableView alloc] initWithFrame:self.bounds];

    _tabView.tableHeaderView = self.baseView;
    
    [_tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self addSubview:_tabView];


}

#pragma mark 创建 底部分享的uiview
-(void)createBottomUI
{

    self.bottom = [[UIView alloc] initWithFrame:CGRectMake(0, IPHONE_HEIGHT, IPHONE_WIDTH, 150)];

    self.bottom.backgroundColor = [UIColor whiteColor];
    //创建两个按钮
    NSArray *btnImgArr = [NSArray arrayWithObjects:@"share_friends",@"share_friend",@"share_sina", nil];
    //设置-- frame
    
    CGFloat imgW = 60;
    CGFloat imgH = 60;

    //蚊子数组
    NSArray *namelabel = @[@"朋友圈",@"微信好友",@"新浪微博"];
    
    for (NSInteger i=0; i< 3; i++) {
     
        
     
        //按钮
        UIButton *navBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [navBtn setImage:[UIImage imageNamed:btnImgArr[i]] forState:UIControlStateNormal];
        navBtn.frame = CGRectMake(i * (imgW + 40) + 30, 10, imgW, imgH);
        
        navBtn.tag = 50 +i;
        //label
        UILabel *navName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(navBtn.frame)- 10 , CGRectGetMaxY(navBtn.frame), 80, 15)];
        
        navName.text = namelabel[i];
        navName.font = [UIFont systemFontOfSize:12];
        navName.textAlignment = NSTextAlignmentCenter;
        
        
       

        //添加事件
        [navBtn addTarget:self action:@selector(cancelBtn:) forControlEvents:UIControlEventTouchUpInside];
         [self.bottom addSubview:navBtn];

//         [ClickControl addSubview:navName];
        [self.bottom addSubview:navName];
        
        
    }
    //按钮
    
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel.tag = 11;
    [cancel setTitle:@"取  消" forState:UIControlStateNormal];
    cancel.frame = CGRectMake(60,100,200,30);
    [cancel addTarget:self action:@selector(cancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cancel setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    [self.bottom addSubview:cancel];
    
    [self addSubview:self.bottom];
    
    


}

#pragma mark =================================各点击触发方法---------
- (void)cancelBtn:(UIButton *)sender
{
    
    if (self.sendBlock) {
        self.sendBlock(sender);
    }

}

- (void)TopClick:(UIButton *)sender
{
    NSLog(@"%d",sender.tag);
    if (self.sendBlock) {
        self.sendBlock(sender);
    }


}



#pragma mark =================================其他执行方法方法---------
#pragma mark 刷新UI
-(void)refreshUI
{
    NSNumber *login =  [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"];
    
//    if ([login boolValue]) {
//        self.isLogin = YES;
//
//        _infolabel.text = @"wlw_13507920648";
//        self.userid = _infolabel.text;
//        _headicon.image = [UIImage imageNamed:@"logined"];
//        
//        
//    }else{
//        
//        
//        _infolabel.text = @"你还没有登陆";
//        _headicon.image = [UIImage imageNamed:@"nologin"];
//    }
    
    
}




@end
