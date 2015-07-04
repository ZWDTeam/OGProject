//
//  OGLoginViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGLoginViewController.h"
#import "OGRegisterOneViewController.h"
#import "ConfigFile.h"

@interface OGLoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *telephoneNumberView;
@property (weak, nonatomic) IBOutlet UIView *passwordView;
@property (weak, nonatomic) IBOutlet UIButton *loginButtn;
@property (weak, nonatomic) IBOutlet UIButton *stylistButton;
@property (weak, nonatomic) IBOutlet UITextField *telephoneLalbl;
@property (weak, nonatomic) IBOutlet UITextField *passwordLabll;


@end

@implementation OGLoginViewController
@synthesize registerButtn = _registerButtn;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary * dic = @{NSUnderlineStyleAttributeName :[NSNumber numberWithInteger:NSUnderlineStyleSingle],
                           NSForegroundColorAttributeName :[UIColor orangeColor]};
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"免费注册" attributes:dic];
    
    [_registerButtn setAttributedTitle:str forState:UIControlStateNormal];
    
    self.telephoneNumberView.layer.masksToBounds= YES;
    self.telephoneNumberView.layer.cornerRadius =  3;

    self.passwordView.layer.masksToBounds= YES;
    self.passwordView.layer.cornerRadius =  3;
    
    self.loginButtn.layer.masksToBounds= YES;
    self.loginButtn.layer.cornerRadius =  3;
    
    self.stylistButton.layer.masksToBounds= YES;
    self.stylistButton.layer.cornerRadius =  3;
    
    self.passwordLabll.secureTextEntry = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)publicLogin:(id)sender {
    if (![ConfigFile isMobileNumber:self.telephoneLalbl.text] )
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的电话号码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        alert.tag = 0;
        [alert show];
    }
    else
    {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    ex_identityType = OGIdentityTypeUser;
    [[NSNotificationCenter defaultCenter] postNotificationName:login_notification object:nil];
    }
    
    
}
- (IBAction)stylistLogin:(id)sender {
    
    if (![ConfigFile isMobileNumber:self.telephoneLalbl.text] )
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的电话号码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        alert.tag = 0;
        [alert show];
    }
    else
    {
       
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        ex_identityType = OGIdentityTypeStylist;
        [[NSNotificationCenter defaultCenter] postNotificationName:login_notification object:nil];

    }
    
   
}
- (IBAction)pushRegisterViewController:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择账号类型" delegate:self cancelButtonTitle:@"我是设计师" otherButtonTitles:@"我是用户", nil];
    alert.tag = 1;
    [alert show];
    return;


    
}
- (IBAction)pushForgetPassword:(id)sender {
     [self performSegueWithIdentifier:@"pushForgetView" sender:nil];
     ex_account = self.telephoneLalbl.text;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if (alertView.tag==1) {
        
    
    switch (buttonIndex) {
        case 0:
        {
            OGRegisterOneViewController * registerVC = [[OGRegisterOneViewController alloc]init];
            [self.navigationController pushViewController:registerVC animated:YES];

        }
            break;
        case 1:
            [self performSegueWithIdentifier:@"pushRegister" sender:nil];
            break;
            
        default:
            break;
    }
    }

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
