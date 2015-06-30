//
//  OGDesignCircleTableViewCell.m
//  OGProject
//
//  Created by ww on 15/6/28.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGDesignCircleTableViewCell.h"

@implementation OGDesignCircleTableViewCell
@synthesize labelContext     = _labelContext;
@synthesize labelTime        = _labelTime;
@synthesize labelUserCompany = _labelUserCompany;
@synthesize labelUserName    = _labelUserName;

@synthesize imguserPic      = _imguserPic;
@synthesize imgUserVipLevel = _imgUserVipLevel;
@synthesize imgUserSex      = _imgUserSex;

@synthesize btnBrowse   = _btnBrowse;
@synthesize btnComment  = _btnComment;
@synthesize btnShare    = _btnShare;
@synthesize viewPic     = _viewPic;


@synthesize labelBorwse = _labelBorwse;
@synthesize labelComment = _labelComment;
@synthesize imgGrey = _imgGrey;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
     //用户头像
        self.imguserPic = [[UIImageView alloc]initWithFrame:iphone_rect_scale(10, 10, 35, 35)];
        [self addSubview:self.imguserPic];
        
        //用户名字
        self.labelUserName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imguserPic.frame)+5, CGRectGetMinY(self.imguserPic.frame)+5, 150, 15)];
        
        self.labelUserName.textAlignment = NSTextAlignmentLeft;
        [self.labelUserName setFont:Font_title_middle];
        [self addSubview:self.labelUserName];
        
        
        self.imgUserSex = [[UIImageView alloc]init];
        [self addSubview:self.imgUserSex];
        
        
        self.imgUserVipLevel = [[UIImageView alloc]init];
        [self addSubview:self.imgUserVipLevel];
        
        self.labelUserCompany = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.labelUserName.frame), CGRectGetMaxY(self.labelUserName.frame)+7, 200, 10)];
        [self.labelUserCompany setFont:Font_small];
        [self.labelUserCompany setTextColor:Color_Grey_Text];
        [self addSubview:self.labelUserCompany];
        
        self.labelTime = [[UILabel alloc]initWithFrame:iphone_rect_scale(200, 20, 100, 10)];
        [self.labelTime setFont:Font_small];
        [self.labelTime setTextAlignment:NSTextAlignmentRight];
        [self.labelTime setTextColor:Color_Orange_UIBG];
        
        [self addSubview:self.labelTime];
        
        UIImageView * imgGrayTemp = [[UIImageView alloc]initWithFrame:iphone_rect_scale(10, 50, 300, 1)];
        [imgGrayTemp setBackgroundColor:Color_Brey_UIBG];
        
        [self addSubview:imgGrayTemp];
        
        
        self.labelContext = [[UILabel alloc]initWithFrame:CGRectMake(kPercenX_scale(10), CGRectGetMaxY(imgGrayTemp.frame)+kPercenX_scale(5), kPercenX_scale(300), 40)];
        [self.labelContext setFont:Font_middle];
        [self.labelContext setTextColor:Color_L_Black_Text];
        [self.labelContext setNumberOfLines:0];
        
        [self addSubview:self.labelContext];
        
        
        self.viewPic = [[UIView alloc]init];
        [self.viewPic setBackgroundColor:[UIColor clearColor]];
        [self.viewPic setUserInteractionEnabled:YES];
        
        [self addSubview:self.viewPic];
        
        
        self.viewComment = [[UIView alloc]init];
        self.viewComment.layer.masksToBounds= YES;
        self.viewComment.layer.cornerRadius =  10;
        [self.viewComment setBackgroundColor:Color_Brey_UIBG];
        
        [self addSubview:self.viewComment];
        
        
        self.btnShare = [[UIButton alloc]init];
        [self.btnShare setImage:[UIImage imageNamed:@"9-share.png"] forState:UIControlStateNormal];
        self.btnShare.layer.masksToBounds= YES;
        self.btnShare.layer.cornerRadius =  14;
        self.btnShare.layer.borderColor = Color_Grey_Text.CGColor;
        self.btnShare.layer.borderWidth = 1;
        self.btnShare.contentEdgeInsets = UIEdgeInsetsMake(8,15,8,27);
        [self addSubview:self.btnShare];
        
        self.btnComment = [[UIButton alloc]init];
        [self.btnComment setTintColor:Color_Grey_Text];
        [self.btnComment setImage:[UIImage imageNamed:@"9-评论.png"] forState:UIControlStateNormal];
        self.btnComment.layer.masksToBounds= YES;
        self.btnComment.layer.cornerRadius =  14;
        self.btnComment.layer.borderColor = Color_Grey_Text.CGColor;
        self.btnComment.layer.borderWidth = 1;
        self.btnComment.contentEdgeInsets = UIEdgeInsetsMake(9,12,7,27);
        [self addSubview:self.btnComment];
        
        self.labelComment = [[UILabel alloc]initWithFrame:CGRectMake(30, 9, 20, 10)];
        [self.labelComment setTextColor:Color_Grey_Text];
        [self.labelComment setFont:Font_small];
        [self.btnComment addSubview:self.labelComment];
        
        
        self.btnBrowse = [[UIButton alloc]init];
        [self.btnBrowse setTintColor:Color_Grey_Text];
        [self.btnBrowse setImage:[UIImage imageNamed:@"9-查看.png"] forState:UIControlStateNormal];
        self.btnBrowse.layer.masksToBounds= YES;
        self.btnBrowse.layer.cornerRadius =  14;
        self.btnBrowse.layer.borderColor = Color_Grey_Text.CGColor;
        self.btnBrowse.layer.borderWidth = 1;
        self.btnBrowse.contentEdgeInsets = UIEdgeInsetsMake(9,10,9,27);
        
        [self addSubview:self.btnBrowse];
        
        
        self.labelBorwse = [[UILabel alloc]initWithFrame:CGRectMake(30, 9, 20, 10)];
        [self.labelBorwse setTextColor:Color_Grey_Text];
        [self.labelBorwse setFont:Font_small];
        [self.btnBrowse addSubview:self.labelBorwse];
        
        self.imgGrey = [[UIImageView alloc]init];
        [self.imgGrey setBackgroundColor:Color_Brey_BG];
        
        [self addSubview:self.imgGrey];
        
    }
    return self;
}

@end
