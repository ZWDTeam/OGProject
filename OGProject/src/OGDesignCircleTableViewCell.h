//
//  OGDesignCircleTableViewCell.h
//  OGProject
//
//  Created by ww on 15/6/28.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OGDesignCircleTableViewCell : UITableViewCell
@property (strong) OGBaseImageView * imguserPic;
@property (strong) OGBaseImageView * imgUserVipLevel;
@property (strong) OGBaseImageView * imgUserSex;

@property (strong) UILabel * labelUserName;
@property (strong) UILabel * labelUserCompany;
@property (strong) UILabel * labelTime;
@property (strong) UILabel * labelContext;


@property (strong) UIButton * btnShare;
@property (strong) UIButton * btnBrowse;
@property (strong) UIButton * btnComment;

@property (strong) UILabel * labelBorwse;
@property (strong) UILabel * labelComment;


//图片底view
@property (strong) UIView * viewPic;


//评论view
@property (strong) UIView * viewComment;

@property (strong) UIImageView * imgGrey;
@end
