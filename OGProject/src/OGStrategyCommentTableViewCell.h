//
//  OGStrategyCommentTableViewCell.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/26.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OGStrategyCommentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;

@property (strong , nonatomic) UILabel * contentLabel;

@end
