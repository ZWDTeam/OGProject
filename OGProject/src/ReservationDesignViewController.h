//
//  ReservationDesignViewController.h
//  OGProject
//
//  Created by ww on 15/7/1.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReservationDesignViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnCheckBox01;
@property (weak, nonatomic) IBOutlet UIButton *btnCheckBox02;

@property (weak, nonatomic) IBOutlet UIButton *btnBeforeTime01;
@property (weak, nonatomic) IBOutlet UIButton *btnAfterTime01;
@property (weak, nonatomic) IBOutlet UIButton *btnBeforeTime02;
@property (weak, nonatomic) IBOutlet UIButton *btnAfterTime02;

@property (weak, nonatomic) IBOutlet UITextView *textViewContext;

@property (weak, nonatomic) IBOutlet UIImageView *imgUserFace;


@property (weak, nonatomic) IBOutlet UILabel *labelUserName;

@property (weak, nonatomic) IBOutlet UIButton *btnMan;
@property (weak, nonatomic) IBOutlet UIButton *btnWoman;
@property (weak, nonatomic) IBOutlet UILabel *labelUserPhone;



@property (weak, nonatomic) IBOutlet UIView *maskView;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


@end
