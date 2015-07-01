//
//  OGMyAttentionViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/17.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

/*
 
 意见反馈
 
 */
#import "OGMyAttentionViewController.h"
#import "MRProgressOverlayView.h"

@interface OGMyAttentionViewController ()
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UITextField *telTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;

@end

@implementation OGMyAttentionViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"意见反馈";
    }
    return self;
}

//提交
- (IBAction)sendAcrion:(id)sender {
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


- (void)viewDidLoad {
    [super viewDidLoad];
    self.sendBtn.layer.cornerRadius = CGRectGetHeight(self.sendBtn.frame)/2.0f;
    self.sendBtn.layer.masksToBounds = YES;
    self.sendBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.sendBtn.layer.borderWidth = 1.0f;

    
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

@end
