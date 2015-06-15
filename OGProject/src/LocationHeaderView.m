//
//  LocationHeaderView.m
//  AutoLayout
//
//  Created by 钟伟迪 on 15/6/11.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "LocationHeaderView.h"

@implementation LocationHeaderView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mm4.jpg"]];
        imageView.frame = CGRectMake(0, 0, 60, 60);
        [self addSubview:imageView];
    }
    return self;
}

@end
