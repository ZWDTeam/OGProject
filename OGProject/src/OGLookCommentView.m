//
//  OGLookCommentView.m
//  OGProject
//
//  Created by ww on 15/6/27.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGLookCommentView.h"

@implementation OGLookCommentView
@synthesize delegate = _delegate;
@synthesize viewSubmitComment = viewSubmitComment;
-(id)initLookCommentView{
    self = [super initWithFrame:CGRectMake(0, 0, MainView_Width, MainView_Height)];
    
    if (self)
        
    {
     
        
        //评论列表创建
        tableViewComment  = [[UITableView alloc]init];
        [tableViewComment setFrame:CGRectMake(0, 0, MainView_Width, self.frame.size.height-55)];
        [tableViewComment setDelegate:self];
        [tableViewComment setDataSource:self];
        [tableViewComment setBackgroundColor:Color_Brey_BG];
        
        //去掉分割线
        tableViewComment.separatorStyle = UITableViewCellSelectionStyleNone;
        
        //设置table只读
        [tableViewComment setAllowsSelection:NO];
        [self addSubview:tableViewComment];

        
        //输入框创建
        
        viewSubmitComment = [[UIView alloc]init];
        [viewSubmitComment setBackgroundColor:Color_Brey_UIBG];
        [viewSubmitComment setFrame:CGRectMake(0, CGRectGetMaxY(tableViewComment.frame), MainView_Width, 55)];
        [viewSubmitComment setUserInteractionEnabled:YES];
        
        [self addSubview:viewSubmitComment];
        
        
        
        UIImageView * imgTfBg = [[UIImageView alloc]init];
        [imgTfBg setImage:[UIImage imageNamed:@"registerTextFieldBG.png"]];
        [imgTfBg setFrame:CGRectMake(kPercenX_scale(5), 11, kPercenX_scale(270), 33)];
        [imgTfBg setUserInteractionEnabled:YES];
        
        [viewSubmitComment addSubview:imgTfBg];
        
        
        tfComment = [[UITextField alloc]init];
        
        [tfComment setFrame:CGRectMake(4, 6, kPercenX_scale(265), 21)];
        [tfComment setPlaceholder:@"请输入评论"];
        [tfComment setBorderStyle:UITextBorderStyleNone];
        [tfComment setDelegate:self];
        tfComment.tag = 10001;
        
        [imgTfBg addSubview:tfComment];
        
        
        UIButton * btnSubmit = [[UIButton alloc]init];
        
        [btnSubmit setFrame:CGRectMake(kPercenX_scale(280),11 , 36, 33)];
        [btnSubmit setTitle:@"评论" forState:UIControlStateNormal];
        [btnSubmit setTitleColor:Color_Black_Text forState:UIControlStateNormal];
        [btnSubmit addTarget:self action:@selector(submitComment)forControlEvents:UIControlEventTouchUpInside];
        
        
        [viewSubmitComment addSubview:btnSubmit];
        
        
        
      
    }
    return self;
}

//刷新
-(void)reloadTableViewWithArray:(NSArray *)array
{
    arrTableData = [NSMutableArray arrayWithArray:array];
    [tableViewComment reloadData];

}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return arrTableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"commentListCell";
    
    OGLookCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[OGLookCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    NSDictionary * dicTemp = arrTableData[indexPath.row];
    [cell.imgUserPic setImage:[UIImage imageNamed:dicTemp[@"pic"]]];
    [cell.labelUserName setText:dicTemp[@"userName"]];
    [cell.labelCommentTime setText:dicTemp[@"time"]];
    [cell.labelCommentText setText:dicTemp[@"comment"]];
    
    
    
    CGSize size = CGSizeMake(cell.labelCommentText.frame.size.width, 1000);
    CGRect labelRect = [cell.labelCommentText.text boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:cell.labelCommentText.font forKey:NSFontAttributeName] context:nil];
    cell.labelCommentText.frame = CGRectMake(cell.labelCommentText.frame.origin.x, cell.labelCommentText.frame.origin.y, labelRect.size.width, labelRect.size.height);
    
    NSInteger height  = CGRectGetMaxY(cell.labelCommentText.frame)+10;
    
    if (height<90) height=90;
    

    [cell setFrame:CGRectMake(0, 0, MainView_Width, height)];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableViewComment cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}






- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self submitComment];
    return YES;
}

//提交
-(void)submitComment{
    [tfComment resignFirstResponder];
    
    [self.delegate submitCommentWithContext:tfComment.text];
    
    tfComment.text = @"";
    [self get:CGRectGetMaxY(tableViewComment.frame)];

    
}


//界面调整动画
-(void)get:(float)move{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:viewSubmitComment cache:YES];
    [UIView setAnimationDuration:0.3];
    CGRect frame = viewSubmitComment.frame;
    frame.origin.y =move;//view的y轴上移
    viewSubmitComment.frame = frame;
    [UIView commitAnimations];//设置调整界面的动画效果
}

@end
