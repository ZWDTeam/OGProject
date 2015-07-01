//
//  OGRegisterOneViewController.h
//  OGProject
//
//  Created by ww on 15/6/30.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OGBaseViewController.h"

@interface OGRegisterOneViewController : OGBaseViewController
@property (weak, nonatomic) IBOutlet UITextField *tfPhoneNum;
@property (weak, nonatomic) IBOutlet UIButton *btnCaptchas;
@property (weak, nonatomic) IBOutlet UITextField *tfCaptchas;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnCreditTerms;
@property (weak, nonatomic) IBOutlet UIButton *btnCheckBox;

@end
