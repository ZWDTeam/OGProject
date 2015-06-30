//
//  OGRegisterLastViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGRegisterLastViewController.h"

@interface OGRegisterLastViewController ()
- (IBAction)finishRegister:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *passwordView;
@property (weak, nonatomic) IBOutlet UIView *passwordAgainView;
@property (weak, nonatomic) IBOutlet UIView *nameView;

@end

@implementation OGRegisterLastViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"注册(3/3)";
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.passwordAgainView.layer.masksToBounds= YES;
    self.passwordAgainView.layer.cornerRadius =  3;
    
    self.passwordView.layer.masksToBounds= YES;
    self.passwordView.layer.cornerRadius =  3;
    
    self.nameView.layer.masksToBounds= YES;
    self.nameView.layer.cornerRadius =  3;

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

- (IBAction)finishRegister:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
