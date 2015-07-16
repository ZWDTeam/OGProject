//
//  OGAlertView.h
//  OGProject
//
//  Created by 钟伟迪 on 15/7/12.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OGAlertView : UIView
@property (weak, nonatomic) IBOutlet UIButton *checkBtn;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

- (void)show;

@end
