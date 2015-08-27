//
//  GCTabBarViewController.m
//  GoodChef
//
//  Created by Mac on 15-5-28.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCTabBarViewController.h"
//首页控制器
#import "GCRootViewController.h"
//厨师控制器
#import "GCChefViewController.h"
//订单控制器
#import "GCOrderViewController.h"
//我的控制器
#import "GCUserViewController.h"
//导入tabbar
#import "RDVTabBarItem.h"

@interface GCTabBarViewController ()

@end

@implementation GCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化对应的控制器
    [self setupViewControllers];
    
    // 设置对应的导航头部
    [self customizeInterface];

}

#pragma mark - Methods

- (void)setupViewControllers {
    
    // 第一部分的首页的控制器+tabbar导航+抽屉导航
    GCRootViewController *root = [[GCRootViewController alloc] init];
//    [root.view setBackgroundColor:[UIColor redColor]];
    UIViewController *firstNavigationController = [[UINavigationController alloc] initWithRootViewController:root];

    // 第二部分的控制器瀑布流使用
    GCChefViewController *secondViewController = [[GCChefViewController alloc] init];
//    [secondViewController.view setBackgroundColor:[UIColor blueColor]];
    
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    GCOrderViewController *thirdViewController = [[GCOrderViewController alloc] init];
    [thirdViewController.view setBackgroundColor:[UIColor greenColor]];
    
    UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    
    GCUserViewController *fourthViewController = [[GCUserViewController alloc] init];
    [fourthViewController.view setBackgroundColor:[UIColor purpleColor]];
    
    UIViewController *fourthNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:fourthViewController];
    // 直接用自己controller设置视图控制器
    [self setViewControllers:@[firstNavigationController, secondNavigationController,
                               thirdNavigationController,fourthNavigationController]];
    // 设置tabbar控制器下面的图片资源
    [self customizeTabBarForController];
}

- (void)customizeTabBarForController {
    // 设置按钮图片
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"Tabbar1", @"Tabbar2", @"Tabbar3", @"Tabbar4"];
    NSArray *namearr = @[@"首页",@"厨师",@"订单",@"我的"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_act",[tabBarItemImages objectAtIndex:index]]];
//        UILabel *namelabel = [[UILabel alloc] init];
//        namelabel.text = namearr[index];
    

        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        item.title = namearr[index];

 
        NSDictionary *selelcted = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
        item.selectedTitleAttributes = selelcted;

        
        index++;
    }
}

- (void)customizeInterface {
    
    
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    navigationBarAppearance.translucent = NO;
    
    
    
    UIImage *backgroundImage = nil; 
    NSDictionary *textAttributes = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];
        
        textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName: [UIColor blackColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor: [UIColor blackColor],
                           UITextAttributeTextShadowColor: [UIColor clearColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

#pragma mark - ================== 各协议触发区 ==============



@end
