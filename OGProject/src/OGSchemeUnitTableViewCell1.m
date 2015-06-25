//
//  OGSchemeUnitTableViewCell1.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/24.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGSchemeUnitTableViewCell1.h"

@implementation OGSchemeUnitTableViewCell1

- (void)awakeFromNib {
    self.payBtn.layer.cornerRadius = 5.0f;
    self.payBtn.layer.masksToBounds = YES;
}


- (IBAction)payBtnAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(actionPayBtnActionWithCell:)]) {
        [self.delegate actionPayBtnActionWithCell:self];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
