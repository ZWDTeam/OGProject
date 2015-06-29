//
//  WWCommentLabel.m
//  OGProject
//
//  Created by ww on 15/6/29.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "WWCommentLabel.h"

@implementation WWCommentLabel
@synthesize highlightedColor = _highlightedColor;
@synthesize shouldUnderline = _shouldUnderline;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (id)init
{
    if (self = [super init]) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}

- (void)setShouldUnderline:(BOOL)shouldUnderline
{
    _shouldUnderline = shouldUnderline;
    if (_shouldUnderline) {
        [self setup];
    }
}

- (void)drawRect:(CGRect)rect
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [super drawRect:rect];
    if (self.shouldUnderline) {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGSize fontSize =[self.text sizeWithFont:self.font
                                        forWidth:self.frame.size.width
                                   lineBreakMode:NSLineBreakByTruncatingTail];
        
        CGContextSetStrokeColorWithColor(ctx, self.textColor.CGColor);  // set as the text's color
        CGContextSetLineWidth(ctx, 2.0f);
        
        CGPoint leftPoint = CGPointMake(0,
                                        self.frame.size.height);
        CGPoint rightPoint = CGPointMake(fontSize.width,
                                         self.frame.size.height);
        CGContextMoveToPoint(ctx, leftPoint.x, leftPoint.y);
        CGContextStrokePath(ctx);
    }
}



- (void)setText:(NSString *)text andCenter:(CGPoint)center
{
    [super setText:text];
    CGSize fontSize =[self.text sizeWithFont:self.font
                                    forWidth:200
                               lineBreakMode:NSLineBreakByTruncatingTail];
    NSLog(@"%f   %f", fontSize.width, fontSize.height);
    [self setNumberOfLines:0];
    [self setFrame:CGRectMake(0, 0, fontSize.width, fontSize.height)];
    [self setCenter:center];
}



- (void)setup
{
    [self setUserInteractionEnabled:TRUE];
    _actionView = [[UIControl alloc] initWithFrame:self.bounds];
    [_actionView setBackgroundColor:[UIColor clearColor]];
    [_actionView addTarget:self action:@selector(appendHighlightedColor) forControlEvents:UIControlEventTouchDown];
    [_actionView addTarget:self
                    action:@selector(removeHighlightedColor)
          forControlEvents:UIControlEventTouchCancel |
     UIControlEventTouchUpInside |
     UIControlEventTouchDragOutside |
     UIControlEventTouchUpOutside];
    [self addSubview:_actionView];
    [self sendSubviewToBack:_actionView];
}

- (void)addTarget:(id)target action:(SEL)action withTag:(int)labelTag
{
    [_actionView addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [_actionView setTag:labelTag];
    
}

- (void)appendHighlightedColor
{
    self.backgroundColor = self.highlightedColor;
}

- (void)removeHighlightedColor
{
    self.backgroundColor = [UIColor clearColor];
}
@end







