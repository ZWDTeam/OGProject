//
//  OGSchemeUnitTableViewCell2.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/24.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGSchemeUnitTableViewCell2.h"

@implementation OGSchemeUnitTableViewCell2

- (void)awakeFromNib {

    self.zanCountLabel.layer.cornerRadius = 6.0f;
    self.zanCountLabel.layer.masksToBounds = YES;
    self.zanCountLabel.backgroundColor = [UIColor grayColor];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
