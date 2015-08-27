//
//  GCParentView.h
//  GoodChef
//
//  Created by Mac on 15-5-26.
//  Copyright (c) 2015年 Mac. All rights reserved.
//
typedef void(^TapBlock)(id tap);

typedef void (^SendViewBlock)(id sender);
#import "Macros.h"
#import "Interface.h"
#import <UIKit/UIKit.h>

@interface GCParentView : UIView

@property (nonatomic,copy) TapBlock tapGesture; //点击图片的block

@property (nonatomic, copy)SendViewBlock sendBlock; // 用于点击回调的block

//拼接字符创方法
- (NSString *)GetStart:(NSString *)start andMiddle:(NSString *)middle andEnd:(NSString *)end;
@end
