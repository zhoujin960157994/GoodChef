//
//  GCWebViewController.m
//  GoodChef
//
//  Created by Mac on 15-5-27.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCWebViewController.h"
#import "GCWebView.h"

@interface GCWebViewController ()

@end

@implementation GCWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     设置头
     */
    self.navigationItem.title = self.title;
    
    //创建web
    GCWebView *GCweb = [[GCWebView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT)];
    
     [self.view addSubview:GCweb];
    
    NSURL *url = [NSURL URLWithString:self.urlStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    [GCweb.web loadRequest:request];
   
    

}




@end
