//
//  OGSchemeTableViewCell.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/23.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OGPriceLabel.h"

@class OGSchemeSecondView;

@interface OGSchemeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;
@property (weak, nonatomic) IBOutlet UILabel *styleLabel;
@property (weak, nonatomic) IBOutlet OGPriceLabel *oldPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *newsPriceLabel;

@end
////////////**************///////////////


@interface OGSchemeSecondTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


@end

//////*********************///////
@interface OGSchemeThreeTableViewCell : UITableViewCell

@property (strong , nonatomic)UILabel * titleLabel;

@property (strong , nonatomic)UILabel * detailTitleLabel;

@property (strong , nonatomic)NSArray * infos;

@end

////***********///////
@interface OGSchemeImagesTableViewCell : UITableViewCell

@property (weak , nonatomic)IBOutlet UIImageView * headerImageView;

@end