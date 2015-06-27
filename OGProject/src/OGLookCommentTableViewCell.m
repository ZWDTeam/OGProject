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
        //用户头像
        self.imgUserPic = [[UIImageView alloc]initWithFrame:iphone_rect_scale(5, 5, 100, 100)];
        
    }
    return self;
}

@end
