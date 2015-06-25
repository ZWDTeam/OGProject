//
//  OGSchemeTableViewCell.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/23.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OGSchemeSecondView;

@interface OGSchemeTableViewCell : UITableViewCell


@end
////////////**************///////////////


@interface OGSchemeSecondTableViewCell : UITableViewCell


@end

//////*********************///////
@interface OGSchemeThreeTableViewCell : UITableViewCell

@property (strong , nonatomic)UILabel * titleLabel;

@property (strong , nonatomic)UILabel * detailTitleLabel;

@property (strong , nonatomic)NSArray * infos;

@end

////***********///////
@interface OGSchemeImagesTableViewCell : UITableViewCell


@end