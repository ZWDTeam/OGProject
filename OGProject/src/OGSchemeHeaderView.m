//
//  OGSchemeHeaderView.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/23.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGSchemeHeaderView.h"

@implementation OGSchemeHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.headerImageView.layer.cornerRadius = CGRectGetHeight(self.headerImageView.frame)/2.0f;
    self.headerImageView.layer.masksToBounds = YES;
    
    self.zanLabel.layer.cornerRadius = 4.0f;
    self.zanLabel.layer.masksToBounds = YES;
    
    self.nameLabel.textColor = [UIColor whiteColor];
    self.timeLabel.textColor = [UIColor whiteColor];
    self.zanLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5f];
    
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGRect imageRect = _headerImageView.frame;
    CGFloat space = 4.0f;
    imageRect.origin.x -=space;
    imageRect.origin.y -=space;
    imageRect.size.height +=space*2;
    imageRect.size.width += space*2;
    
    CGContextAddEllipseInRect(context, imageRect);
    CGContextStrokePath(context);
    
}
@end
