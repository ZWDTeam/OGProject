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
    self.headerImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapheaderImageView:)];
    [self.headerImageView addGestureRecognizer:tap];
}

- (void)tapheaderImageView:(UITapGestureRecognizer *)tap{
    if ([self.delegate respondsToSelector:@selector(selectedHeaderView:)]) {
        [self.delegate selectedHeaderView:self];
    }
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGRect imageRect = _headerImageView.frame;
    CGFloat space = 6.0f;
    imageRect.origin.x -=space;
    imageRect.origin.y -=space;
    imageRect.size.height +=space*2;
    imageRect.size.width += space*2;

    CGContextAddEllipseInRect(context, imageRect);
    CGContextStrokePath(context);

}


@end
