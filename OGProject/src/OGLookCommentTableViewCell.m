//
//  OGLookCommentTableViewCell.m
//  OGProject
//
//  Created by ww on 15/6/27.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGLookCommentTableViewCell.h"

@implementation OGLookCommentTableViewCell
@synthesize imgUserPic = _imgUserPic;

@synthesize labelUserName = _labelUserName;
@synthesize labelCommentTime = _labelCommentTime;
@synthesize labelCommentText = _labelCommentText;

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
        //灰色的破条子创建
        UIImageView * imgTemp = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, MainView_Width, 8)];
        [imgTemp setBackgroundColor:Color_Brey_BG];
        [self addSubview:imgTemp];
        
        //用户头像
        self.imgUserPic = [[UIImageView alloc]initWithFrame:iphone_rect_scale(5, 20, 46, 46)];
        
        [self addSubview:self.imgUserPic];
        
        //用户名字
        self.labelUserName = [[UILabel alloc]initWithFrame:iphone_rect_scale(60, 5, 200, 40)];
        [self.labelUserName setFont:Font_title];
        [self.labelUserName setTextColor:Color_Black_Text];
        [self.labelUserName setTextAlignment:NSTextAlignmentLeft];
        
        [self addSubview:self.labelUserName];
        
        //时间
        self.labelCommentTime = [[UILabel alloc]initWithFrame:iphone_rect_scale(200, 5, 110,40)];
        [self.labelCommentTime setFont:Font_small];
        [self.labelCommentTime setTextColor:Color_Grey_Text];
        [self.labelCommentTime setTextAlignment:NSTextAlignmentRight];
        
        [self addSubview:self.labelCommentTime];
        
        //评论内容
        self.labelCommentText = [[UILabel alloc]initWithFrame:iphone_rect_scale(60,40,250,40)];
        [self.labelCommentText setFont:Font_middle];
        [self.labelCommentText setTextColor:Color_Grey_Text];
        [self.labelCommentText setTextAlignment:NSTextAlignmentLeft];
        [self.labelCommentText setNumberOfLines:0];
        
        [self addSubview:self.labelCommentText];
    
    
    }
    return self;
}

@end
