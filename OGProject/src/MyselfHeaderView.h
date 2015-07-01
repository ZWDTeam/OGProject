//
//  MyselfHeaderView.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/17.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyselfHeaderView;

@protocol MyselfHeaderViewDelegate <NSObject>

@optional
- (void)selectedHeaderView:(MyselfHeaderView *)headerView;

@end

@interface MyselfHeaderView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *sexImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak , nonatomic) id <MyselfHeaderViewDelegate>delegate;

@end
