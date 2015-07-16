//
//  OGAlertView.m
//  OGProject
//
//  Created by 钟伟迪 on 15/7/12.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGAlertView.h"

@implementation OGAlertView

- (id)init{
    self = [[[NSBundle mainBundle] loadNibNamed:@"OGAlertView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = CGRectMake(0, 0, MainView_Width-40, 190);
        self.center = CGPointMake(MainView_Width/2.0f, MainView_Height/2.0f);
    }
    
    return self;
}

- (void)awakeFromNib{
    self.checkBtn.layer.cornerRadius =self.checkBtn.frame.size.height/2.0f;
    self.checkBtn.layer.masksToBounds = YES;
    
    self.closeBtn.layer.cornerRadius =self.closeBtn.frame.size.height/2.0f;
    self.closeBtn.layer.masksToBounds = YES;

}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.checkBtn.layer.cornerRadius =self.checkBtn.frame.size.height/2.0f;
    self.checkBtn.layer.masksToBounds = YES;
    
    self.closeBtn.layer.cornerRadius =self.closeBtn.frame.size.height/2.0f;
    self.closeBtn.layer.masksToBounds = YES;
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)checkAction:(id)sender {
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView * view = [window viewWithTag:1000];
    [view removeFromSuperview];
    [self removeFromSuperview];
}
- (IBAction)closeAction:(id)sender {
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView * view = [window viewWithTag:1000];
    [view removeFromSuperview];
    [self removeFromSuperview];
}

- (void)show{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainView_Width, MainView_Height)];
    view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    view.tag =1000;
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:view];
    [window addSubview:self];
}



@end
