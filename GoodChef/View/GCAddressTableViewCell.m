//
//  GCAddressTableViewCell.m
//  GoodChef
//
//  Created by Mac on 15-6-2.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "GCAddressTableViewCell.h"
//地址Model
#import "GCAddressEntityModel.h"
@interface GCAddressTableViewCell ()
/**
 *  内容view
 */
@property (weak, nonatomic) IBOutlet UIView *ContentView;
/**
 *  名字
 */
@property (weak, nonatomic) IBOutlet UILabel *name;
/**
 *  电话
 */
@property (weak, nonatomic) IBOutlet UILabel *PhoneNum;
/**
 *  用户地址
 */
@property (weak, nonatomic) IBOutlet UILabel *Useraddress;
/**
 *  编辑按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *editAdd;
/**
 *  删除
 */
@property (weak, nonatomic) IBOutlet UIButton *Delete;
/**
 * 编辑按钮
 */
- (IBAction)editAddBtn:(UIButton *)sender;
/**
 * 删除按钮
 */
- (IBAction)deleteBtn:(UIButton *)sender;

@end
@implementation GCAddressTableViewCell
{



}
/**
 *  <#Description#>
 */
- (void)awakeFromNib {
    
    self.editAdd.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.editAdd.layer.cornerRadius = 10;
    self.editAdd.layer.borderWidth = 0.3f;
    self.Delete.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.Delete.layer.cornerRadius = 10;
    self.Delete.layer.borderWidth = 0.3f;
    
    self.ContentView.layer.borderColor = [[UIColor orangeColor] CGColor];
    self.ContentView.layer.borderWidth = 0.5;

}


- (IBAction)editAddBtn:(UIButton *)sender {
    
    
}

- (IBAction)deleteBtn:(UIButton *)sender {
    
    
}

/**
 *  重写modeL的set方法
 */

- (void)setAddressModel:(GCAddressEntityModel *)addressModel
{
    
    
    self.name.text = addressModel.name;
    
    self.PhoneNum.text = addressModel.phone;
    
    self.Useraddress.text = addressModel.address;
    

    
    



}
@end
