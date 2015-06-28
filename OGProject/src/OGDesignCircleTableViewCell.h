//
//  OGDesignCircleTableViewCell.h
//  OGProject
//
//  Created by ww on 15/6/28.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OGDesignCircleTableViewCell : UITableViewCell
@property (strong) UIImageView * imguserPic;
@property (strong) UIImageView * imgUserVipLevel;
@property (strong) UIImageView * imgUserSex;

@property (strong) UILabel * labelUserName;
@property (strong) UILabel * labelUserCompany;
@property (strong) UILabel * labelTime;
@property (strong) UILabel * labelContext;


@property (strong) UIButton * btnShare;
@property (strong) UIButton * btnBrowse;
@property (strong) UIButton * btnComment;

//图片底view
@property (strong) UIView * viewPic;

@end
