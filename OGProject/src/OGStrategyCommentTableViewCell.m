//
//  OGStrategyCommentTableViewCell.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/26.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGStrategyCommentTableViewCell.h"
#import "OGBaseViewController.h"

@implementation OGStrategyCommentTableViewCell

- (void)awakeFromNib {
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 35, SCREEN_WIDTH - 90, 30)];
    _contentLabel.textColor = [UIColor grayColor];
    _contentLabel.font =[UIFont systemFontOfSize:detail_text_font];
    _contentLabel.numberOfLines = 0;
    [self addSubview:_contentLabel];
    
    
    _headerImageView.layer.cornerRadius = CGRectGetHeight(_headerImageView.frame)/2.0f;
    _headerImageView.layer.masksToBounds = YES;
    
    [_contentLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    CGRect rect = [self.contentLabel.text boundingRectWithSize:CGSizeMake(_contentLabel.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : _contentLabel.font} context:nil];
    
    CGRect rect1 = _contentLabel.frame;
    rect1.size.height = rect.size.height;
    _contentLabel.frame =rect1;
    
    rect1 = self.frame;
    rect1.size.height = rect.size.height + 50;
    self.frame = rect1;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)dealloc{
    [self.contentLabel removeObserver:self forKeyPath:@"text"];
}


@end
