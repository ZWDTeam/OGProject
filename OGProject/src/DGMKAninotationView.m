//
//  DGMKAninotationView.m
//  AutoLayout
//
//  Created by 钟伟迪 on 15/6/12.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "DGMKAninotationView.h"

@implementation DGMKAninotationView{
    UIColor * _color;
}

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier withColor:(UIColor *)color{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    _color = color;
    
    CGRect rect = self.frame;
    
    rect.size = CGSizeMake(30, 38);
    
    self.frame = rect;
    
    self.backgroundColor = [UIColor clearColor];
    
    _headerImageView = [UIImageView new];
    CGFloat bounds = 2.0f;
    _headerImageView.frame = CGRectMake(bounds, bounds, rect.size.width-bounds*2, rect.size.width-bounds*2);
    [self addSubview:_headerImageView];
    _headerImageView.layer.masksToBounds = YES;
    _headerImageView.layer.cornerRadius = _headerImageView.frame.size.width/2.0f;
    
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    //外圆半径
    CGFloat excircleRadius = rect.size.width/2.0f;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, _color.CGColor);
    
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, excircleRadius*2, excircleRadius*2));
    CGContextFillPath(context);

    CGFloat errorRadius = 5.0f;
    CGContextMoveToPoint(context, 1, excircleRadius+errorRadius);
    CGContextAddLineToPoint(context, excircleRadius, rect.size.height);
    CGContextAddLineToPoint(context, rect.size.width-1, excircleRadius+errorRadius);
    CGContextClosePath(context);
    
    CGContextSetFillColorWithColor(context, _color.CGColor);

    CGContextFillPath(context);
    
}


@end

@implementation DGAnnotationContentView



@end
