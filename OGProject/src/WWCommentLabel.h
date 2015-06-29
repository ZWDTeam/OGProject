//
//  WWCommentLabel.h
//  OGProject
//
//  Created by ww on 15/6/29.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface WWCommentLabel : UILabel
{
    UIControl *_actionView;
    UIColor *_highlightedColor;
    BOOL _shouldUnderline;
}

@property (nonatomic, retain) UIColor *highlightedColor;
@property (nonatomic, assign) BOOL shouldUnderline;

- (void)setText:(NSString *)text andCenter:(CGPoint)center;
- (void)addTarget:(id)target action:(SEL)action withTag:(int)labelTag;
@end