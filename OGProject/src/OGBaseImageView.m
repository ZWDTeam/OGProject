//
//  OGBaseImageView.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/29.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGBaseImageView.h"

@implementation OGBaseImageView


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)awakeFromNib{
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
