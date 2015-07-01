//
//  OGRegisterTwoViewController.h
//  OGProject
//
//  Created by ww on 15/6/30.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OGRegisterThreeViewController.h"
@interface OGRegisterTwoViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tfUserName;
@property (weak, nonatomic) IBOutlet UITextField *tfUserCompany;
@property (weak, nonatomic) IBOutlet UITextField *tfStyle;
@property (weak, nonatomic) IBOutlet UITextField *tfSeniority;
@property (weak, nonatomic) IBOutlet UIButton *btnMan;
@property (weak, nonatomic) IBOutlet UIButton *btnWoman;
@property (weak, nonatomic) IBOutlet UILabel *labelCity;

@end
