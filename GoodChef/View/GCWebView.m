//
//  GCWebView.m
//  GoodChef
//
//  Created by Mac on 15-5-27.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCWebView.h"

@implementation GCWebView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//init方法重写
- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self createWebView];
        
    }
    
    return self;

}


- (void)createWebView
{
    
    
    _web = [[UIWebView alloc] initWithFrame:self.bounds];
    
    
    
    [self addSubview:_web];



}
@end
