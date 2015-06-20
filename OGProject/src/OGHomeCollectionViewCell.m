//
//  OGHomeCollectionViewCell.m
//  demo111
//
//  Created by 钟伟迪 on 15/6/17.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGHomeCollectionViewCell.h"

@implementation OGHomeCollectionViewCell

- (void)awakeFromNib{
    self.contentView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0];
    self.contentBkView.layer.cornerRadius = 8.0f;
    self.contentBkView.layer.masksToBounds = YES;
}

@end
