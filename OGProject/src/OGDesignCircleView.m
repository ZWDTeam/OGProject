//
//  OGDesignCircleView.m
//  OGProject
//
//  Created by ww on 15/6/28.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGDesignCircleView.h"
#import "OGDesignCircleTableViewCell.h"

@implementation OGDesignCircleView
{
    UITextField * tfSearch;
    UIView * viewMask;
    UITableView * tableViewDesignerMsg;
    CGFloat postionY;
    UITextField * tfComment;
    NSInteger commentId;
}
@synthesize delegate = _delegate;
@synthesize viewSubmitComment = _viewSubmitComment;
@synthesize arrTableData = _arrTableData;
-(id)initDesignCircleView{
    self = [super initWithFrame:CGRectMake(0, 0, MainView_Width, MainView_Height)];
    
    if (self){
        [self setBackgroundColor:[UIColor whiteColor]];
        //搜索
        UIImageView * imgSearch = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, MainView_Width, kPercenX_scale(45))];
        [imgSearch setImage:[UIImage imageNamed:@"search.png"]];
        [imgSearch setUserInteractionEnabled:YES];
        
        [self addSubview:imgSearch];
        
        tfSearch = [[UITextField alloc]init];
        [tfSearch setBorderStyle:UITextBorderStyleNone];
        [tfSearch setPlaceholder:@"搜索感兴趣的话题"];
        [tfSearch setFrame:iphone_rect_scale(60, 12, 220, 25)];
        [tfSearch setValue:[UIFont boldSystemFontOfSize:detail_text_font] forKeyPath:@"_placeholderLabel.font"];
        [tfSearch setDelegate:self];
        [tfSearch setReturnKeyType:UIReturnKeySearch];
        [tfSearch setTag:10001];
        
        [imgSearch addSubview:tfSearch];
        
        //列表创建
        tableViewDesignerMsg = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imgSearch.frame), MainView_Width, MainView_Height-CGRectGetMaxY(imgSearch.frame))];
        [tableViewDesignerMsg setDelegate:self];
        [tableViewDesignerMsg setDataSource:self];
        tableViewDesignerMsg.separatorStyle = UITableViewCellSelectionStyleNone;
        [tableViewDesignerMsg setAllowsSelection:NO];
        
        [self addSubview:tableViewDesignerMsg];
        
        
        //遮罩
        viewMask = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imgSearch.frame), MainView_Width, MainView_Height)];
        [viewMask setBackgroundColor:[UIColor clearColor]];
        UITapGestureRecognizer * tapMissKeyboard = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(misskerboard)];
        [viewMask addGestureRecognizer:tapMissKeyboard];
        [viewMask setHidden:YES];
        [viewMask setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]];
        
        [self addSubview:viewMask];
        
        //输入框创建
        
        self.viewSubmitComment = [[UIView alloc]init];
        [self.viewSubmitComment setBackgroundColor:Color_Brey_UIBG];
        [self.viewSubmitComment setFrame:CGRectMake(0, MainView_Height-55, MainView_Width, 55)];
        [self.viewSubmitComment setUserInteractionEnabled:YES];
        [self.viewSubmitComment setHidden:YES];
        [self addSubview:self.viewSubmitComment];
        
        
        
        UIImageView * imgTfBg = [[UIImageView alloc]init];
        [imgTfBg setImage:[UIImage imageNamed:@"registerTextFieldBG.png"]];
        [imgTfBg setFrame:CGRectMake(kPercenX_scale(5), 11, kPercenX_scale(270), 33)];
        [imgTfBg setUserInteractionEnabled:YES];
        
        [self.viewSubmitComment addSubview:imgTfBg];
        
        
        tfComment = [[UITextField alloc]init];
        
        [tfComment setFrame:CGRectMake(4, 6, kPercenX_scale(265), 21)];
        [tfComment setPlaceholder:@"请输入评论"];
        [tfComment setBorderStyle:UITextBorderStyleNone];
        [tfComment setDelegate:self];
        tfComment.tag = 90001;
        
        [imgTfBg addSubview:tfComment];
        
        
        UIButton * btnSubmit = [[UIButton alloc]init];
        
        [btnSubmit setFrame:CGRectMake(kPercenX_scale(280),11 , 36, 33)];
        [btnSubmit setTitle:@"评论" forState:UIControlStateNormal];
        [btnSubmit setTitleColor:Color_Black_Text forState:UIControlStateNormal];
        [btnSubmit addTarget:self action:@selector(submitComment)forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.viewSubmitComment addSubview:btnSubmit];
        

        
    }
    return self;
}


#pragma mark - 评论提交
-(void)submitComment{
    [self.delegate commentWithIndex:commentId context:tfComment.text];
    self.viewSubmitComment.hidden = YES;
    [self misskerboard];
}

-(void)misskerboard{
    tfSearch.text = @"";
    tfComment.text = @"";
    viewMask.hidden = YES;
    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}



#pragma mark - textField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self misskerboard];
    
    //搜索框
    if (textField.tag == 10001) {
        viewMask.hidden = YES;
        [self.delegate submitSearchWithContext:textField.text];
        textField.text = @"";
    }
    
    if (textField.tag == 90001) {
        [self submitComment];
        
    }
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField.tag == 10001||textField.tag == 90001) {
        viewMask.hidden = NO;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    viewMask.hidden = YES;
    self.viewSubmitComment.hidden = YES;

}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _arrTableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"DesignCircleListCell";
    
    OGDesignCircleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell) {
        cell = [[OGDesignCircleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    else
    {
        //避免重用机制的干扰
        while ([cell.viewComment.subviews lastObject] != nil) {
            [(UIView *)[cell.viewComment.subviews lastObject] removeFromSuperview];
        }
        
        while ([cell.viewPic.subviews lastObject] != nil) {
            [(UIView *)[cell.viewPic.subviews lastObject] removeFromSuperview];
        }
       
    }

    
    NSDictionary * dicTemp = _arrTableData[indexPath.row];
    
    [cell.imguserPic setImage:[UIImage imageNamed:dicTemp[@"userPic"]]];
    [cell.labelUserName setText:dicTemp[@"userName"]];
    [cell.labelUserCompany setText:dicTemp[@"userCompany"]];
    [cell.labelTime setText:dicTemp[@"time"]];
    
    
    //计算姓名宽度
    CGRect nameRect = [self getTextFrameWithText:dicTemp[@"userName"] withSize:iphone_size_scale(150, 1000) withFont:Font_title_middle];
    [cell.labelUserName setFrame:CGRectMake(cell.labelUserName.frame.origin.x, cell.labelUserName.frame.origin.y, nameRect.size.width, 15)];
    [cell.imgUserSex setFrame:CGRectMake(CGRectGetMaxX(cell.labelUserName.frame)+kPercenX_scale(4),CGRectGetMinY(cell.labelUserName.frame), kPercenX_scale(9), kPercenX_scale(13)) ];
    
    
    //性别
    //1是女 2是男
    if ([dicTemp[@"userSex"]isEqualToString:@"1"]) {
        [cell.imgUserSex setImage:[UIImage imageNamed:@"2-1性别.png"]];
    }
    else
    {
        [cell.imgUserSex setImage:[UIImage imageNamed:@"2-1性别.png"]];
    }
    
    
    //vip标记
    [cell.imgUserVipLevel setFrame:CGRectMake(CGRectGetMaxX(cell.imgUserSex.frame)+kPercenX_scale(4), CGRectGetMinY(cell.imgUserSex.frame), 17, 13)];
    [cell.imgUserVipLevel setImage:[UIImage imageNamed:dicTemp[@"vipLevel"]]];
    [cell addSubview:cell.imgUserVipLevel];
    
    
    //内容
    cell.labelContext.text = dicTemp[@"context"];
    CGRect contextRect = [self getTextFrameWithText:dicTemp[@"context"] withSize:iphone_size_scale(300, 1000) withFont:Font_middle];
    [cell.labelContext setFrame:CGRectMake(cell.labelContext.frame.origin.x, cell.labelContext.frame.origin.y, contextRect.size.width, contextRect.size.height)];
    
    
#pragma matk - 图片创建
    //图片
    NSArray * arrayTemp = dicTemp[@"CirclePic"];
    
    for (int i = 0; i<arrayTemp.count; i++) {
        UIImageView * imgTemp = [[UIImageView alloc]initWithFrame:iphone_rect_scale(10+101*(i%3), 0, 98, 55)];
        [imgTemp setImage:[UIImage imageNamed:arrayTemp[i]]];
        [cell.viewPic addSubview:imgTemp];
    }
    
    if (arrayTemp.count>0) {
        [cell.viewPic setFrame:CGRectMake(0, CGRectGetMaxY(cell.labelContext.frame)+5, MainView_Width, kPercenX_scale(60))];
    }
    else
    {
        [cell.viewPic setFrame:CGRectMake(0, CGRectGetMaxY(cell.labelContext.frame)+5, 0, 0)];

    }
    
    
#pragma share
    [cell.btnShare setFrame:CGRectMake(kPercenX_scale(10), CGRectGetMaxY(cell.viewPic.frame), 55, 30)];
    [cell.btnShare setTag:10000+indexPath.row];
    [cell.btnShare addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    
#pragma comment
    [cell.btnComment setFrame:CGRectMake(kPercenX_scale(260), CGRectGetMaxY(cell.viewPic.frame), 55, 30)];
    [cell.btnComment setTag:30000+indexPath.row];
    [cell.btnComment addTarget:self action:@selector(comment:) forControlEvents:UIControlEventTouchUpInside];
    [cell.labelComment setText:dicTemp[@"comment"]];

#pragma browse
    [cell.btnBrowse setFrame:CGRectMake(kPercenX_scale(205), CGRectGetMaxY(cell.viewPic.frame), 55, 30)];
    [cell.btnBrowse setTag:20000+indexPath.row];
    [cell.btnBrowse addTarget:self action:@selector(browse:) forControlEvents:UIControlEventTouchUpInside];
    [cell.labelBorwse setText:dicTemp[@"browse"]];

#pragma mark - 评论创建
    postionY = 10;
    
    NSArray * arrayCommentList = dicTemp[@"commentList"];
    
    for (int i = 0; i<arrayCommentList.count; i++) {
        NSDictionary * dicComment = arrayCommentList[i];
        
        [cell.viewComment addSubview: [self createrCommentViewWithUserName:dicComment[@"commentUserName"] commentContext:dicComment[@"commentContext"] WithCommentId:[dicComment[@"commentId"] intValue]]];
    }
    
    if (postionY==10) {
        postionY = 0;
    }
    [cell.viewComment setFrame:CGRectMake(kPercenX_scale(10), CGRectGetMaxY(cell.btnBrowse.frame)+15, kPercenX_scale(300), postionY)];
    
    
    //灰色条子
    [cell.imgGrey setFrame:CGRectMake(0, CGRectGetMaxY(cell.viewComment.frame)+10, MainView_Width, 8)];
    
#pragma mark - 重设cell的高度
    [cell setFrame:CGRectMake(0, 0, MainView_Width, CGRectGetMaxY(cell.imgGrey.frame))];
    
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableViewDesignerMsg cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
    
}


-(void)share:(UIButton *)btn{
    [self.delegate shareWithIndex:btn.tag-10000];
}

-(void)browse:(UIButton *)btn{
    [self.delegate browseWithIndex:btn.tag-20000];
}

-(void)comment:(UIButton *)btn{
    [tfComment becomeFirstResponder];
    
    commentId = btn.tag-30000;
    self.viewSubmitComment.hidden = NO;
}

-(void)reloadTableViewWithArray:(NSArray *)array{
    _arrTableData = [NSMutableArray arrayWithArray:array];
}

-(CGRect)getTextFrameWithText:(NSString *)strContext withSize:(CGSize)size withFont:(UIFont*)font{
       return [strContext boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
}

//function  用于制作评论label
-(WWCommentLabel *)createrCommentViewWithUserName:(NSString *)strUserName commentContext:(NSString *)strCommentContext WithCommentId:(int)index{
    NSString * strTemp = [NSString stringWithFormat:@"%@：%@",strUserName,strCommentContext];
    
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:strTemp];
    [str addAttribute:NSForegroundColorAttributeName value:Color_Blue_Text range:NSMakeRange(0,strUserName.length+1)];
    
    
    WWCommentLabel * label = [[WWCommentLabel alloc]initWithFrame:CGRectMake(kPercenX_scale(10), postionY, kPercenX_scale(280), 20)];
    [label setFont:Font_middle];
    [label setTextColor:Color_Grey_Text];
    [label setNumberOfLines:0];
    [label setAttributedText:str];
    
    CGRect contextRect = [self getTextFrameWithText:strTemp withSize:iphone_size_scale(280, 1000) withFont:Font_middle];
    [label setFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y, contextRect.size.width, contextRect.size.height)];
    
    postionY = CGRectGetMaxY(label.frame)+6;
    
    label.highlightedColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    label.shouldUnderline = YES;
    [label addTarget:self action:@selector(labelClicked:)withTag:index];
    [label setTag:index];
    
    return label;
}
-(void)labelClicked:(UIControl*)sender{
    [self.delegate commentSelectWithCommentId:sender.tag];
}

//刷新单行cell
-(void)reloadTableRows:(NSInteger)index withNewData:(NSDictionary *)dicTemp{
    [self.arrTableData removeObjectAtIndex:index];
    [self.arrTableData insertObject:dicTemp atIndex:index];
    
    NSIndexPath *indexPath_1=[NSIndexPath indexPathForRow:index inSection:0];
    NSArray *indexArray=[NSArray arrayWithObject:indexPath_1];
    
    [tableViewDesignerMsg reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];

}

@end
