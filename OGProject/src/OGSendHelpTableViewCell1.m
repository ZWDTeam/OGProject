//
//  OGSendHelpTableViewCell1.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/25.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGSendHelpTableViewCell1.h"

@implementation OGSendHelpTableViewCell1

- (void)awakeFromNib {
    self.contentTedtField.textColor = [UIColor grayColor];
    self.contentTedtField.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self.delegate textFieldDidEndEditing:textField withCell:self];
}

@end
