//
//  OGTiYanGuanTableViewCell.h
//  OGProject
//
//  Created by 钟伟迪 on 15/7/7.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OGTiYanGuanTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lookLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityDetailLabel;

@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@end
