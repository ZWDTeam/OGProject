//
//  OGRegisterOneViewController.m
//  OGProject
//
//  Created by ww on 15/6/30.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGRegisterOneViewController.h"
#import "OGRegisterTwoViewController.h"
@interface OGRegisterOneViewController (){
    BOOL isCheck;
}

@end

@implementation OGRegisterOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isCheck = NO;
    
    self.title = @"设计师注册";
    
    UIButton * btnNext = [[UIButton alloc]init];
    [btnNext setFrame:CGRectMake(0, 0, 60, 25)];
    [btnNext setTitle:@"下一步" forState:UIControlStateNormal];
    [btnNext.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    btnNext.layer.masksToBounds= YES;
    btnNext.layer.cornerRadius =  12;
    btnNext.layer.borderColor = [UIColor whiteColor].CGColor;
    btnNext.layer.borderWidth = 1.5;
    [btnNext addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btnNext];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)submit{
    /* -- 获得参数
    NSString * strPhone = self.tfPhoneNum.text;
    NSString * strCaptchas = self.tfCaptchas.text;
    NSString * strPsw = self.tfPassword.text;
    isCheck;
    -- */
    OGRegisterTwoViewController * registerVC = [[OGRegisterTwoViewController alloc]init];
    
    [self.navigationController pushViewController:registerVC animated:YES];
    
}

- (IBAction)checkCreditTerms:(UIButton *)sender {
    if (isCheck) {
        [sender setImage:nil forState:UIControlStateNormal];
        isCheck = NO;
    }
    else
    {
        [sender setImage:[UIImage imageNamed:@"g.png"] forState:UIControlStateNormal];
        isCheck = YES;
    }
}

- (IBAction)getCaptchas:(id)sender {
}

- (IBAction)readCreditTerms:(id)sender {
}
@end
