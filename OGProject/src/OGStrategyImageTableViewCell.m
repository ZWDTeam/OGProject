//
//  OGStrategyImageTableViewCell.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/27.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGStrategyImageTableViewCell.h"
#import "OGBaseViewController.h"
@interface OGStrategyImageTableViewCell()

@property (weak, nonatomic) IBOutlet UIScrollView *contetnScrollView;

@property (weak, nonatomic) IBOutlet UIView *titleBackView;

@end

@implementation OGStrategyImageTableViewCell

- (void)awakeFromNib {

    self.titleBackView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    
    NSString * pathString = [[NSBundle mainBundle] pathForResource:@"homeHeaderModel" ofType:@"plist"];
    NSArray * array = [NSArray arrayWithContentsOfFile:pathString];
    _contents  = [[NSMutableArray alloc] initWithArray:array];
    [_contents addObject:array[0]];
    [_contents insertObject:array[array.count-1] atIndex:0];
    
    float x = 0;
    for (NSDictionary * dic in _contents) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, self.contetnScrollView.bounds.size.width, self.contetnScrollView.bounds.size.height)];
        imageView.image  = [UIImage imageNamed:dic[@"imageString"]];
        imageView.userInteractionEnabled = YES;
        
        int index = x/imageView.bounds.size.width;
        imageView.tag = index;
        [self.contetnScrollView addSubview:imageView];
        
        self.contetnScrollView.contentSize = CGSizeMake(x+imageView.bounds.size.width, 0);
        
        x += imageView.bounds.size.width;

    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
