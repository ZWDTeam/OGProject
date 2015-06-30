//
//  OGSchemeTableViewCell.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/23.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGSchemeTableViewCell.h"
#import "OGBaseViewController.h"

@implementation OGSchemeTableViewCell

@end

///////////////////////
///////////////////////
@implementation OGSchemeSecondTableViewCell

@end


////////////////////
///////////////////
@implementation OGSchemeThreeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
        _titleLabel.text = @"用户点评";
        [self.contentView addSubview:_titleLabel];
        
        _detailTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 100, 10, 80, 20)];
        _detailTitleLabel.text = @"12人已评论";
        _detailTitleLabel.font = [UIFont systemFontOfSize:12];
        _detailTitleLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_detailTitleLabel];
    }
    return self;
}

- (void)setInfos:(NSArray *)infos{
    _infos = infos;
    
}

@end

////////////////////
///////////////////
@implementation OGSchemeImagesTableViewCell



@end

