//
//  OGRegisterFirstViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGRegisterFirstViewController.h"
#import "ConfigFile.h"


@interface OGRegisterFirstViewController ()
- (IBAction)pushRegisterSecondView:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextBarBtn;
- (IBAction)orReadProtocol:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnReadprotocol;

@property (assign,nonatomic) BOOL selectProtocol;
@property (weak, nonatomic) IBOutlet UITextField *telephoneNumberLalbl;

@end

@implementation OGRegisterFirstViewController
@synthesize selectProtocol;

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"注册(1/3)";
    }
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nextBarBtn.layer.cornerRadius = CGRectGetHeight(self.nextBarBtn.frame)/2.0f;
    self.nextBarBtn.layer.borderWidth = 1.0f;
    self.nextBarBtn.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pushRegisterSecondView:(id)sender {
    if (![ConfigFile isMobileNumber:self.telephoneNumberLalbl.text] )
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的电话号码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
   else
   {
        ex_account = self.telephoneNumberLalbl.text;
        [self performSegueWithIdentifier:@"pushSecondRegister" sender:nil];
   }
}
- (IBAction)orReadProtocol:(UIButton *)sender {
    
    
    
    if (sender.tag == 1) {
        sender.tag = 0;
        [sender setBackgroundColor:[UIColor orangeColor]];
        [sender setBackgroundImage:nil forState:UIControlStateNormal];
        selectProtocol = NO;
    }
    else
    {
        [sender setBackgroundColor:[UIColor clearColor]];
        [sender setBackgroundImage:[UIImage imageNamed:@"1-勾选.png"] forState:UIControlStateNormal];
        sender.tag = 1;
        selectProtocol = YES;
    }
}
@end
