//
//  OGStrategyImageTableViewCell.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/27.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGStrategyImageTableViewCell.h"
#import "OGBaseViewController.h"
@interface OGStrategyImageTableViewCell()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contetnScrollView;

@property (weak, nonatomic) IBOutlet UIView *titleBackView;

@end

@implementation OGStrategyImageTableViewCell

- (void)awakeFromNib {

    self.titleBackView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    self.contetnScrollView.delegate = self;
    
}

- (void)layoutSubviews{
    float x = 0;
    int imageNum = arc4random()%17+1;
    for (int i = 0; i <3; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, self.contetnScrollView.bounds.size.width, self.contetnScrollView.bounds.size.height)];
        imageView.image  = [UIImage imageNamed:[NSString stringWithFormat:@"home%d.jpg",imageNum+i]];
        imageView.userInteractionEnabled = YES;
        
        int index = x/imageView.bounds.size.width;
        imageView.tag = index;
        [self.contetnScrollView addSubview:imageView];
        
        self.contetnScrollView.contentSize = CGSizeMake(x+imageView.bounds.size.width, 0);
        
        x += imageView.bounds.size.width;
    }

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.pageControll.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
