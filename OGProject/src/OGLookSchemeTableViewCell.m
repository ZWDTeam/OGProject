//
//  OGLookSchemeTableViewCell.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGLookSchemeTableViewCell.h"

@implementation OGLookSchemeTableViewCell

- (void)awakeFromNib {

    self.userImageView.layer.cornerRadius = CGRectGetHeight(self.userImageView.frame)/2.0f;
    self.userImageView.layer.masksToBounds = YES;
    
    _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    _headerImageView.clipsToBounds = YES;
    
    CGRect rect = _headerImageView.frame;
    rect.origin.y = rect.size.height -25;
    rect.size.height = 25;
    
    UIView * view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    [self.contentView insertSubview:view aboveSubview:_headerImageView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
