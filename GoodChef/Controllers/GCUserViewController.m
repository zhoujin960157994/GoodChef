//
//  GCUserViewController.m
//  GoodChef
//
//  Created by Mac on 15-5-28.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCUserViewController.h"
//user 的view
#import "GCUserView.h"

// 友盟
#import "UMSocial.h"
//会员
#import "GCVipViewController.h"

//更多
#import "GCMoreViewController.h"
//活动中心
#import "GCActivityViewController.h"
//我的评论
#import "GCCommentViewController.h"
//我的订单
#import "GCOrderViewController.h"
//我的厨师
#import "GCMyChefViewController.h"
//我的优惠券
#import "GCCouponViewController.h"

@interface GCUserViewController ()<UITableViewDataSource,UITableViewDelegate,UMSocialUIDelegate>

@property  (nonatomic,strong) NSMutableArray *data;

@end

@implementation GCUserViewController
{
    //userView
    GCUserView *user;


}
#pragma mark ===========================各初始化方法=======================

- (void)viewWillAppear:(BOOL)animated
{
    [[AppDelegate shareapp].tab setTabBarHidden:NO];

}
- (NSMutableArray *)data
{

    if (_data == nil) {
        
        NSDictionary *img = @{@"成为会员": @"profile_vip",@"活动中心": @"profile_activity",@"我的评论": @"profile_comment"};
        NSDictionary *name = @{@"分享给朋友": @"profile_share",@"评分": @"profile_score",@"更多": @"profile_more"};
        _data = [[NSMutableArray alloc] initWithObjects:img,name, nil];
        
        
        
    }
    
    return _data;



}

#pragma mark  =========================各view 的实现===================================
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    //block 循环引用
    __weak GCUserViewController *temp = self;
    

    
    //创建top view
    [self createTop];
    
    
    user.sendBlock = ^(id sender){
        
        [temp TopButtonForClick:sender];
        
    };


}

#pragma  mark 创建tableview 的table-header
- (void)createTop
{
    
    //创建
    user = [[GCUserView alloc] initWithFrame:self.view.bounds];
    
    user.tabView.delegate = self;
    ;
    user.tabView.dataSource = self;
    
    [self.view addSubview:user];
    
    






}
#pragma mark  =========================回调的实现===================================
#pragma mark 点击按钮的回调方法
- (void)clickForButton:(UIView *)sender
{
    switch (sender.tag) {
    
//        case 51:
//        {
//            NSLog(@"微信");
//            
//        }
//            break;
//        case 52:
//        {
//            NSLog(@"新浪");
//            
//            
//        }
//            break;
        case 11:
        {
            [UIView animateWithDuration:0.5f animations:^{
                
                user.bottom.frame = CGRectMake(0, IPHONE_HEIGHT, IPHONE_WIDTH, 150);
                
            }];
            
            [[AppDelegate shareapp].tab setTabBarHidden:NO animated:YES];
            
        }
            break;
        default:
      
            break;
    }
    
}

- (void)TopButtonForClick:(UIButton *)sender
{
    switch (sender.tag) {
        case 120:
        {
            GCOrderViewController *order = [[GCOrderViewController alloc] init];
            
            [self.navigationController pushViewController:order animated:YES];
            
            
        }
            break;
        case 121:
        {
            
            GCMyChefViewController *myChef = [[GCMyChefViewController alloc] init];
            
            [self.navigationController pushViewController:myChef animated:YES];

        }
            break;
        case 122:
        {
            GCCouponViewController *coupon = [[GCCouponViewController alloc] init];
            
            [self.navigationController pushViewController:coupon animated:YES];
            
        }
            break;
        default:
            break;
    }
}



#pragma mark  =========================各请求数据的实现===================================


#pragma mark  ===========================各代理实现=============================
#pragma mark tableview 代理方法


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return self.data.count;


}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data[section] count];


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.data[indexPath.section] allKeys][indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:[self.data[indexPath.section] allValues][indexPath.row]];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    BOOL isOk =  [[self.data[indexPath.section] allValues][indexPath.row] isEqualToString:@"profile_share"];
    //block 循环引用
//    __weak GCUserViewController *temp = self;
    if (isOk) {
        //创建动画
//   
//        [UIView animateWithDuration:0.5f animations:^{
//
//            user.bottom.frame = CGRectMake(0, IPHONE_HEIGHT- 200, IPHONE_WIDTH, 150);
//        }];
//        
//        [[AppDelegate shareapp].tab setTabBarHidden:YES animated:YES];
//        
//        
//        
//        user.sendBlock = ^(id sender){
//        
//            [temp clickForButton:sender];
//        
//        };
        [self onUmengShare];
    }else if ([[self.data[indexPath.section] allValues][indexPath.row] isEqualToString:@"profile_vip"]){
        //成为会员
        GCVipViewController *vip = [[GCVipViewController alloc] init];
        
        [self.navigationController pushViewController:vip animated:YES];
  
    }else if ([[self.data[indexPath.section] allValues][indexPath.row] isEqualToString:@"profile_score"]){
        //评分
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/hao-chu-shi-yu-ding-chu-shi/id882132701?mt=8"]];
    }else if ([[self.data[indexPath.section] allValues][indexPath.row] isEqualToString:@"profile_more"]){
        //更多
        GCMoreViewController *more = [[GCMoreViewController alloc] init];
        
        [self.navigationController pushViewController:more animated:YES];
        
        
    }else if ([[self.data[indexPath.section] allValues][indexPath.row] isEqualToString:@"profile_activity"]){
        //活动中心
        GCActivityViewController *activity = [[GCActivityViewController alloc] init];
        
        [self.navigationController pushViewController:activity animated:YES];
        
    }else if ([[self.data[indexPath.section] allValues][indexPath.row] isEqualToString:@"profile_comment"]){
        //我的评论
        
        GCCommentViewController *comment = [[GCCommentViewController alloc] init];
        
        [self.navigationController pushViewController:comment animated:YES];
        
       
    }
    
    
    
    
    


}

#pragma mark =================================第三方功能区=================================

#pragma mark 友盟的授权
-(void)onUmengOauth
{
    //此处调用授权的方法,你可以把下面的platformName 替换成 UMShareToSina,UMShareToTencent等
    NSString *platformName = [UMSocialSnsPlatformManager getSnsPlatformString:UMSocialSnsTypeSina];
    
    [UMSocialControllerService defaultControllerService].socialUIDelegate = self;
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:platformName];
    // 授权及获取用户信息，
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        //          获取微博用户名、uid、token等
        if (response.responseCode == UMSResponseCodeSuccess) {
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:platformName];
            NSLog(@"username is %@, uid is %@, token is %@ iconUrl is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
        }
        //这里可以获取到腾讯微博openid,Qzone的token等
        /*
         if ([platformName isEqualToString:UMShareToTencent]) {
         [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToTencent completion:^(UMSocialResponseEntity *respose){
         NSLog(@"get openid  response is %@",respose);
         }];
         }
         */
    });
}

-(void)onUmengShare
{
    NSString *shareText = @"友盟社会化组件可以让移动应用快速具备社会化分享、登录、评论、喜欢等功能，并提供实时、全面的社会化数据统计分析服务。 http://www.umeng.com/social";             //分享内嵌文字
    UIImage *shareImage = [UIImage imageNamed:@"AppIcon60x60@3x"];          //分享内嵌图片（不能超过32kb）
    
    //调用快速分享接口
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:UmengAppkey
                                      shareText:shareText
                                     shareImage:shareImage
                                shareToSnsNames:nil
                                       delegate:self];
}







@end
