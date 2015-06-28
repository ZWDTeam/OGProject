//
//  OGSendHelpTableViewCell1.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/25.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OGSendHelpTableViewCell1;

@protocol OGSendHelpTableViewCell1Delegate <NSObject>

- (void)textFieldDidEndEditing:(UITextField *)textField withCell:(OGSendHelpTableViewCell1 *)cell;

@end

@interface OGSendHelpTableViewCell1 : UITableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *contentTedtField;

@property (weak , nonatomic)id <OGSendHelpTableViewCell1Delegate>delegate;

@end
