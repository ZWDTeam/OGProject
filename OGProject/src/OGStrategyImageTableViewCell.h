//
//  OGStrategyImageTableViewCell.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/27.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OGStrategyImageTableViewCell : UITableViewCell

@property (strong , nonatomic) NSMutableArray * contents;
@property (weak, nonatomic) IBOutlet UILabel *commentCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *lookCountLabel;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControll;

@end
