//
//  OGPriceLabel.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/23.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGPriceLabel.h"

@implementation OGPriceLabel{

}


- (void)drawRect:(CGRect)rect{
    
     CGRect textRect = [self.text boundingRectWithSize:CGSizeMake(320, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil];

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextSetLineWidth(context, 1);
    
    CGContextMoveToPoint(context, 0, rect.size.height/2.0f-3);
    CGContextAddLineToPoint(context, textRect.size.width,  rect.size.height/2.0f);
    
    CGContextStrokePath(context);
    
    [self.text drawAtPoint:CGPointMake(0, 0)
            withAttributes:@{NSFontAttributeName : self.font,
                  NSForegroundColorAttributeName : self.textColor}];

    

}

@end
