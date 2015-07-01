//
//  OGForgetLastViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGForgetLastViewController.h"

@interface OGForgetLastViewController ()
@property (weak, nonatomic) IBOutlet UIView *passwordView;
@property (weak, nonatomic) IBOutlet UIView *passwordAgainView;
@property (weak, nonatomic) IBOutlet UIButton *changePasswordBtn;
@property (weak, nonatomic) IBOutlet UITextField *passwordLbl;
@property (weak, nonatomic) IBOutlet UITextField *passwordAgainTxt;

- (IBAction)finishChange:(id)sender;

@end

@implementation OGForgetLastViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"找回密码";
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.passwordView.layer.cornerRadius =6.0f;
    self.passwordView.layer.masksToBounds = YES;
    
    self.passwordAgainView.layer.cornerRadius =6.0f;
    self.passwordAgainView.layer.masksToBounds = YES;
    self.passwordAgainTxt.secureTextEntry = YES;
    
    self.changePasswordBtn.layer.cornerRadius =6.0f;
    self.changePasswordBtn.layer.masksToBounds = YES;
    
    
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

- (IBAction)finishChange:(id)sender {
//    if (([self.passwordAgainTxt.text isEqualToString:self.passwordLbl.text]) && (self.passwordLbl.text.length>0)) {
//          [self.navigationController popToRootViewControllerAnimated:YES];
//    }
    [self.navigationController popToRootViewControllerAnimated:YES];

}
@end
