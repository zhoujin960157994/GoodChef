//
//  GCChefTableViewCell.m
//  GoodChef
//
//  Created by Mac on 15-5-31.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCChefTableViewCell.h"
//导入厨师菜单模型
#import "ChefMenuEntityModel.h"
@interface GCChefTableViewCell ()
/**
 *  菜品代表图
 */
@property (weak, nonatomic) IBOutlet UIImageView *cImg;
/**
 *  厨师图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *chefImg;
/**
 *  厨师名称
 */
@property (weak, nonatomic) IBOutlet UILabel *chefName;
/**
 *  已经服务过多少家
 */
@property (weak, nonatomic) IBOutlet UILabel *ServiceNum;



@end

@implementation GCChefTableViewCell
#pragma mark ============================一系列页面加载方法========================
- (void)awakeFromNib {
    // Initialization code
    
    self.chefImg.layer.cornerRadius = 30;
    self.chefImg.clipsToBounds = YES;
    self.cImg.layer.cornerRadius = 6;
    self.cImg.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark ============================一系列UI创建方法========================

- (void)setChef:(ChefModel *)chef
{

    _chef = chef;
    
//    NSLog(@"%@",chef.ChefMenuEntity);
    
    ChefMenuEntityModel *chefMenu = [chef.ChefMenuEntity firstObject];
    
    NSURL *CimgDetail = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",GCHOST, chefMenu.foodPicUrl]];
    //数据方法等等
    self.cImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:CimgDetail]];

    self.chefName.text = chef.chefName;
    
    
    NSURL *ChefDetail = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",GCHOST, chef.chefUrl]];
    self.chefImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:ChefDetail]];
    





}
#pragma mark ============================一系列事件触发方法========================



#pragma mark ============================一系列其他方法========================
@end
