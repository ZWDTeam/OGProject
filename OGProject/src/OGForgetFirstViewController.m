//
//  OGForgetFirstViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGForgetFirstViewController.h"

@interface OGForgetFirstViewController ()
- (IBAction)pushForgetLast:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *havetYzmBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBarBtn;

@end

@implementation OGForgetFirstViewController
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"找回密码";
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.havetYzmBtn.layer.cornerRadius =6.0f;
    self.havetYzmBtn.layer.masksToBounds = YES;
    

    self.rightBarBtn.layer.cornerRadius = CGRectGetHeight(self.rightBarBtn.frame)/2.0f;
    self.rightBarBtn.layer.borderWidth = 1.0f;
    self.rightBarBtn.layer.borderColor = [UIColor whiteColor].CGColor;

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

- (IBAction)pushForgetLast:(id)sender {

    [self performSegueWithIdentifier:@"pushForgetLast" sender:nil];
}
@end
