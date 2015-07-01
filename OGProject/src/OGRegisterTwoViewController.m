//
//  OGRegisterTwoViewController.m
//  OGProject
//
//  Created by ww on 15/6/30.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGRegisterTwoViewController.h"

@interface OGRegisterTwoViewController (){
    NSString * strUserSex;
}

@end

@implementation OGRegisterTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    
    UITapGestureRecognizer * tapToMissKeyboard = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(misskerboard)];
    [self.view addGestureRecognizer:tapToMissKeyboard];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//选择用户所在城市
- (IBAction)selectUserLocation:(id)sender {
    self.labelCity.text = @"xxx";//选择城市完成后，给label赋值
}


-(void)submit{
    /* -- 数据收集
    NSString * strUserName = self.tfUserName.text;
    strUserSex; //性别  男= 1 女 = 2；
    NSString * strSeniority = self.tfSeniority.text;
    NSString * strUserCompany = self.tfUserCompany.text;
    NSString * strStyle = self.tfStyle.text;
    NSString * strCity = self.labelCity.text;
    -- */
    
    OGRegisterThreeViewController * registerVC = [[OGRegisterThreeViewController alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];
}


- (IBAction)selectMan:(id)sender {
    [self.btnMan setImage:[UIImage imageNamed:@"checkIn.png"] forState:UIControlStateNormal];
    
    [self.btnWoman setImage:[UIImage imageNamed:@"checkOut.png"] forState:UIControlStateNormal];
    strUserSex = @"1";
}
- (IBAction)selectWoman:(id)sender {
    [self.btnMan setImage:[UIImage imageNamed:@"checkOut.png"] forState:UIControlStateNormal];
    
    [self.btnWoman setImage:[UIImage imageNamed:@"checkIn.png"] forState:UIControlStateNormal];
    strUserSex = @"2";
}

-(void)misskerboard{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark - textField Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag==10001||textField.tag==10002) {
        [self get:-50];
    }

}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag==10001||textField.tag==10002) {
        [self get:0];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self misskerboard];
    
    return YES;
}
//界面调整动画
-(void)get:(float)move{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
    [UIView setAnimationDuration:0.3];
    CGRect frame = self.view.frame;
    frame.origin.y =move;//view的y轴上移
    self.view.frame = frame;
    [UIView commitAnimations];//设置调整界面的动画效果
}

@end
