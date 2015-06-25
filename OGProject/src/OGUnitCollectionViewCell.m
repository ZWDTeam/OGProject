//
//  OGUnitCollectionViewCell.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/24.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGUnitCollectionViewCell.h"

@implementation OGUnitCollectionViewCell

- (void)awakeFromNib {
    self.countLabel.layer.cornerRadius = CGRectGetHeight(self.countLabel.frame)/2.0f;
    self.countLabel.layer.masksToBounds = YES;
    
    self.headerImageView.layer.cornerRadius = 3.0f;
    self.headerImageView.layer.masksToBounds = YES;
}

@end
