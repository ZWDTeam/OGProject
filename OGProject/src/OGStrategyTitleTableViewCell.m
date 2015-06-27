//
//  OGStrategyTitleTableViewCell.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/27.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGStrategyTitleTableViewCell.h"
#import "OGBaseViewController.h"

@implementation OGStrategyTitleTableViewCell

- (void)awakeFromNib {
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 83, SCREEN_WIDTH - 25, 30)];
    _contentLabel.textColor = [UIColor grayColor];
    _contentLabel.font =[UIFont systemFontOfSize:15];
    _contentLabel.numberOfLines = 0;
    [self addSubview:_contentLabel];
    
    [_contentLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];

}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    CGRect rect = [self.contentLabel.text boundingRectWithSize:CGSizeMake(_contentLabel.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : _contentLabel.font} context:nil];
    
    CGRect rect1 = _contentLabel.frame;
    rect1.size.height = rect.size.height;
    _contentLabel.frame =rect1;
    
    rect1 = self.frame;
    rect1.size.height = rect.size.height + 100;
    self.frame = rect1;
}

- (void)dealloc{
    [self.contentLabel removeObserver:self forKeyPath:@"text"];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
