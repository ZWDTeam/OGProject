//
//  MyselfHeaderView.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/17.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "MyselfHeaderView.h"

@implementation MyselfHeaderView

- (void)awakeFromNib{
    self.headerImageView.layer.cornerRadius = CGRectGetHeight(self.headerImageView.frame)/2.0f;
    self.headerImageView.layer.masksToBounds = YES;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGRect imageRect = _headerImageView.frame;
    imageRect.origin.x -=4;
    imageRect.origin.y -=4;
    imageRect.size.height +=8;
    imageRect.size.width +=8;

    CGContextAddEllipseInRect(context, imageRect);
    CGContextStrokePath(context);

}


@end
