//
//  OGHomeButton.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/16.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGHomeButton.h"

@implementation OGHomeButton


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5.0f;
    }
    return self;
}

- (void)awakeFromNib{
    self.layer.cornerRadius = 5.0f;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
