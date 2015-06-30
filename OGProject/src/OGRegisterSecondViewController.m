//
//  OGRegisterSecondViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGRegisterSecondViewController.h"

@interface OGRegisterSecondViewController ()
- (IBAction)pushLastRegisterView:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextBarBtn;

@property (strong,nonatomic) NSTimer *countDownTimer;
@property (assign,nonatomic) int secondsCountDown;
@property (weak, nonatomic) IBOutlet UIButton *btnYZM;

@end

@implementation OGRegisterSecondViewController
@synthesize countDownTimer,secondsCountDown;
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"注册(2/3)";
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nextBarBtn.layer.cornerRadius = CGRectGetHeight(self.nextBarBtn.frame)/2.0f;
    self.nextBarBtn.layer.borderWidth = 1.0f;
    self.nextBarBtn.layer.borderColor = [UIColor whiteColor].CGColor;}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)haveYZM:(id)sender {
   secondsCountDown = 60;//60秒倒计时
   countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
}
-(void)timeFireMethod{
    secondsCountDown--;
    if(secondsCountDown==0){
        [countDownTimer invalidate];
        countDownTimer = nil;
    [self.btnYZM setTitle:[NSString stringWithFormat:@"重新获得验证码"]  forState:UIControlStateNormal];
    }
    [self.btnYZM setTitle:[NSString stringWithFormat:@"还剩%d秒",secondsCountDown]  forState:UIControlStateNormal];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pushLastRegisterView:(id)sender {
    [self performSegueWithIdentifier:@"pushLastView" sender:nil];
}
@end
