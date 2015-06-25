//
//  OGTableSectionView.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/24.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGTableSectionView.h"

@implementation OGTableSectionView

- (void)awakeFromNib{
    self.heightLightLabel.layer.cornerRadius = 2.0f;
    self.heightLightLabel.layer.masksToBounds = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
