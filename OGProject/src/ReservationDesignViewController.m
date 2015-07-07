//
//  ReservationDesignViewController.m
//  OGProject
//
//  Created by ww on 15/7/1.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "ReservationDesignViewController.h"
#import "MRProgressOverlayView.h"

@interface ReservationDesignViewController (){
    BOOL timeSelect;
    int _showDateType;
}

@end

@implementation ReservationDesignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"预约设计";
    
    UIButton * btnNext = [[UIButton alloc]init];
    [btnNext setFrame:CGRectMake(0, 0, 50, 25)];
    [btnNext setTitle:@"提交" forState:UIControlStateNormal];
    [btnNext.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    btnNext.layer.masksToBounds= YES;
    btnNext.layer.cornerRadius =  12;
    btnNext.layer.borderColor = [UIColor whiteColor].CGColor;
    btnNext.layer.borderWidth = 1.5;
    [btnNext addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btnNext];

    UITapGestureRecognizer * tapToMissKeyboard = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(missKerboard)];
    [self.view addGestureRecognizer:tapToMissKeyboard];


    //赋值
    
    //userName
    self.labelUserName.text = @"最求完美的男人";
    
    //userFace
    self.imgUserFace.image = [UIImage imageNamed:@"2-3头像.png"];
    
    //userSex
    [self setUserSex:YES]; //Y：男  N：女
    
    //userPhonw
    self.labelUserPhone.text = @"18874123455";
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//提交
-(void)submit{
    //获得用户提交数据
    
    NSString * strBeforeTime;
    NSString * strAfterTime;
    
    if (timeSelect) {
        strBeforeTime = self.btnBeforeTime01.titleLabel.text;
        strAfterTime = self.btnAfterTime01.titleLabel.text;
    }
    else
    {
        strBeforeTime = self.btnBeforeTime02.titleLabel.text;
        strAfterTime = self.btnAfterTime02.titleLabel.text;
    }
    
    WWLog(@"开始时间-- %@ , 结束时间-- %@",strBeforeTime,strAfterTime);
    
    
    //用户需求
    NSString * strContext = self.textViewContext.text;
    
    WWLog(@"用户需求内容 --%@",strContext);
    
    MRProgressOverlayView *progressView = [MRProgressOverlayView new];
    progressView.titleLabelText = @"提交中...";
    [self.navigationController.view addSubview:progressView];
    [progressView show:YES];
    
    [self performBlock:^{
        progressView.mode = MRProgressOverlayViewModeCheckmark;
        progressView.titleLabelText = @"提交成功";
        
        [self performBlock:^{
            [progressView dismiss:YES];
            [self.navigationController popViewControllerAnimated:YES];
        } afterDelay:0.5];
        
    } afterDelay:2.0];

}

- (void)performBlock:(void(^)())block afterDelay:(NSTimeInterval)delay {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}





#pragma mark - TimeSelect
//选择时间
- (IBAction)selectTime:(UIButton * )sender {
    _showDateType = 0;
    self.datePicker.datePickerMode =UIDatePickerModeTime;
    self.maskView.hidden = NO;
    self.datePicker.tag = sender.tag+10000;
}

//选择日期
- (IBAction)optionDate:(UIButton *)sender {
    _showDateType = 1;
    self.maskView.hidden = NO;
    self.datePicker.datePickerMode =UIDatePickerModeDate;

}

- (IBAction)cancle:(id)sender {
    self.maskView.hidden = YES;
}
- (IBAction)enter:(id)sender {
    self.maskView.hidden = YES;
    
    if (_showDateType) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *selected = [self.datePicker date];
        NSString *currentDateStr = [dateFormatter stringFromDate:selected];
        self.dateTextField.text = currentDateStr;
        
    }else{
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH:mm"];
        NSDate *selected = [self.datePicker date];
        NSString *currentDateStr = [dateFormatter stringFromDate:selected];
        
        UIButton * btnTemp = (UIButton *)[self.view viewWithTag:self.datePicker.tag-10000];
        [btnTemp setTitle:currentDateStr forState:UIControlStateNormal];

    }
    
}

#pragma mark - setAction
-(void)setUserSex:(BOOL)isMan{
    if (isMan) {
        [self.btnMan setImage:[UIImage imageNamed:@"checkIn.png"] forState:UIControlStateNormal];
        [self.btnWoman setImage:[UIImage imageNamed:@"checkOut.png"] forState:UIControlStateNormal];

    }
    else
    {
        [self.btnWoman setImage:[UIImage imageNamed:@"checkIn.png"] forState:UIControlStateNormal];
        [self.btnMan setImage:[UIImage imageNamed:@"checkOut.png"] forState:UIControlStateNormal];

    }
}



#pragma mark - someSteup
- (IBAction)checkBoxMorning:(id)sender {
    timeSelect = YES;
    [sender setBackgroundColor:RGBCOLOR(255, 99, 0)];
    [sender setImage:[UIImage imageNamed:@"g.png"] forState:UIControlStateNormal];
    
    [self.btnCheckBox02 setBackgroundColor:RGBCOLOR(202, 207, 210)];
    [self.btnCheckBox02 setImage:nil forState:UIControlStateNormal];
    
    
    [self.btnBeforeTime01 setBackgroundColor:RGBCOLOR(247, 203, 62)];
    [self.btnAfterTime01 setBackgroundColor:RGBCOLOR(247, 203, 62)];

    [self.btnBeforeTime02 setBackgroundColor:RGBCOLOR(190, 196, 199)];
    [self.btnAfterTime02 setBackgroundColor:RGBCOLOR(190, 196, 199)];

}
- (IBAction)checkBoxAfternoon:(id)sender {
    timeSelect = NO;
    
    [sender setBackgroundColor:RGBCOLOR(255, 99, 0)];
    [sender setImage:[UIImage imageNamed:@"g.png"] forState:UIControlStateNormal];
    
    [self.btnCheckBox01 setBackgroundColor:RGBCOLOR(202, 207, 210)];
    [self.btnCheckBox01 setImage:nil forState:UIControlStateNormal];

    
    [self.btnBeforeTime01 setBackgroundColor:RGBCOLOR(190, 196, 199)];
    [self.btnAfterTime01 setBackgroundColor:RGBCOLOR(190, 196, 199)];

    
    [self.btnBeforeTime02 setBackgroundColor:RGBCOLOR(247, 203, 62)];
    [self.btnAfterTime02 setBackgroundColor:RGBCOLOR(247, 203, 62)];
    
    
}

-(void)missKerboard{
    [self.textViewContext resignFirstResponder];
}

#pragma mark - textView Delegate
//通过判断表层TextView的内容来实现底层TextView的显示于隐藏
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if(![text isEqualToString:@""])
    {
        [self.textViewContext setBackgroundColor:[UIColor whiteColor]];
    }
    
    if([text isEqualToString:@""]&(range.length==1)&range.location==0){
        [self.textViewContext setBackgroundColor:[UIColor clearColor]];
    }

    return YES;
}

@end
