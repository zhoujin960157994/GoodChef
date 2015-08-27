//
//  GCGoodChefView.m
//  GoodChef
//
//  Created by Mac on 15-6-2.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCGoodChefView.h"

@implementation GCGoodChefView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
#pragma mark ======================创建UI ===============
- (void)createUI
{
    
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(130, 100, 60, 60)];
    
    img.image = [UIImage imageNamed:@"AppIcon60x60@3x"];
    
    [self addSubview:img];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(110, CGRectGetMaxY(img.frame)+5, 100, 20)];
    name.text = @"好厨师";
    name.textAlignment = NSTextAlignmentCenter;
    name.font = [UIFont systemFontOfSize:16];
    
    [self addSubview:name];
 
     UILabel *version = [[UILabel alloc] initWithFrame:CGRectMake(110, CGRectGetMaxY(name.frame)+5, 100, 15)];
    version.text = @"版本号v3.0.0";
    version.textAlignment = NSTextAlignmentCenter;
    version.font = [UIFont systemFontOfSize:14];
    
    [self addSubview:version];
//
     UILabel *InfoAddress = [[UILabel alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(version.frame)+30, 80, 20)];
    
    InfoAddress.textAlignment = NSTextAlignmentCenter;
    InfoAddress.font = [UIFont systemFontOfSize:14];
    InfoAddress.text = @"官方地址:";
    [self addSubview:InfoAddress];
    
    UIButton *urlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [urlBtn setTitle:@"www.chushi007.com" forState:UIControlStateNormal];
    urlBtn.frame = CGRectMake(CGRectGetMaxX(InfoAddress.frame), InfoAddress.frame.origin.y, 120, 15);
    urlBtn.titleLabel.font = [UIFont systemFontOfSize:12];
     urlBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [urlBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [urlBtn addTarget:self action:@selector(openToURL:) forControlEvents:UIControlEventTouchUpInside];
    
    urlBtn.tag = 99;
    [self addSubview:urlBtn];

     UILabel *sina = [[UILabel alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(InfoAddress.frame)+5, 80, 20)];
    sina.text = @"新浪微博";
    sina.textAlignment = NSTextAlignmentCenter;
    sina.font = [UIFont systemFontOfSize:14];
    
    [self addSubview:sina];
    UIButton *sinaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [sinaBtn setTitle:@"@好厨师" forState:UIControlStateNormal];
    sinaBtn.frame = CGRectMake(CGRectGetMaxX(sina.frame), sina.frame.origin.y, 120, 15);
    sinaBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    sinaBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [sinaBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [sinaBtn addTarget:self action:@selector(openToURL:) forControlEvents:UIControlEventTouchUpInside];
    sinaBtn.tag = 999;
    [self addSubview:sinaBtn];
    
   
//
     UILabel *wechat = [[UILabel alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(sina.frame)+5, 80, 20)];
    
    wechat.textAlignment = NSTextAlignmentCenter;
    wechat.font = [UIFont systemFontOfSize:14];
    wechat.text = @"官方微信";
    [self addSubview:wechat];
    
    UIButton *wechatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [wechatBtn setTitle:@"好厨师" forState:UIControlStateNormal];
    wechatBtn.frame = CGRectMake(CGRectGetMaxX(wechat.frame), wechat.frame.origin.y, 120, 15);
    wechatBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    wechatBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [wechatBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self addSubview:wechatBtn];
    
    UILabel *companyInfo = [[UILabel alloc] initWithFrame:CGRectMake(70, IPHONE_HEIGHT- 40-64, 180, 30)];
    companyInfo.text = @"上海乐快信息技术有限公司版权所有 Copyright@2015 Lekuai";
    companyInfo.numberOfLines = 0;
    companyInfo.textColor = [UIColor lightGrayColor];
    companyInfo.textAlignment = NSTextAlignmentCenter;
    companyInfo.font = [UIFont systemFontOfSize:12];
    
    [self addSubview:companyInfo];
    


}

- (void)openToURL:(UIButton *)sender
{
    
    if (self.sendBlock) {
        self.sendBlock(sender);
    }

}

@end
