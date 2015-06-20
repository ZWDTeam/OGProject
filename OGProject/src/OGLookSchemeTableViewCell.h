//
//  OGLookSchemeTableViewCell.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OGLookSchemeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *lookCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *styleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailContentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

@end
