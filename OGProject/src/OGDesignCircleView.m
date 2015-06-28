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
    
    NSMutableArray * arrTableData;
}
@synthesize delegate = _delegate;
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
        [tfSearch setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
        [tfSearch setDelegate:self];
        [tfSearch setReturnKeyType:UIReturnKeySearch];
        [tfSearch setTag:10001];
        
        [imgSearch addSubview:tfSearch];
        
        viewMask = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imgSearch.frame), MainView_Width, MainView_Height)];
        [viewMask setBackgroundColor:[UIColor clearColor]];
        UITapGestureRecognizer * tapMissKeyboard = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(misskerboard)];
        [viewMask addGestureRecognizer:tapMissKeyboard];
        [viewMask setHidden:YES];
        
        [self addSubview:viewMask];
        
        
        //列表创建
        tableViewDesignerMsg = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imgSearch.frame), MainView_Width, MainView_Height-CGRectGetMaxY(imgSearch.frame))];
        [tableViewDesignerMsg setDelegate:self];
        [tableViewDesignerMsg setDataSource:self];
        //去掉分割线
        //tableViewDesignerMsg.separatorStyle = UITableViewCellSelectionStyleNone;
        
        //设置table只读
        [tableViewDesignerMsg setAllowsSelection:NO];

        
        [self addSubview:tableViewDesignerMsg];
        
    }
    return self;
}

-(void)misskerboard{
    tfSearch.text = @"";
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
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField.tag == 10001) {
        viewMask.hidden = NO;
    }
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return arrTableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"DesignCircleListCell";
    
    OGDesignCircleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[OGDesignCircleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    else
    {
        //删除cell的所有子视图
        while ([cell.viewPic.subviews lastObject] != nil)
        {
            [(UIView*)[cell.viewPic.subviews lastObject] removeFromSuperview];
        }
    }

    
    NSDictionary * dicTemp = arrTableData[indexPath.row];
    
    [cell.imguserPic setImage:[UIImage imageNamed:dicTemp[@"userPic"]]];
    [cell.labelUserName setText:dicTemp[@"userName"]];
    [cell.labelUserCompany setText:dicTemp[@"userCompany"]];
    [cell.labelTime setText:dicTemp[@"time"]];
    
    
    //计算姓名宽度
    CGRect nameRect = [self getTextFrameWithText:dicTemp[@"userName"] withSize:iphone_size_scale(100, 1000) withFont:Font_title_middle];
    
    [cell.labelUserName setFrame:CGRectMake(cell.labelUserName.frame.origin.x, cell.labelUserName.frame.origin.y, nameRect.size.width, nameRect.size.height)];
    
    UIImageView * userSex = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(cell.labelUserName.frame)+kPercenX_scale(4),CGRectGetMinY(cell.labelUserName.frame)+2, kPercenX_scale(9), kPercenX_scale(13)) ];
    
    //1是女 2是男
    if ([dicTemp[@"userSex"]isEqualToString:@"1"]) {
        [userSex setImage:[UIImage imageNamed:@"2-1性别.png"]];
    }
    else
    {
        [userSex setImage:[UIImage imageNamed:@"2-1性别.png"]];
    }
    
    [cell addSubview:userSex];
    
    
    //vip标记
    UIImageView * imgVipLevel = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(userSex.frame)+kPercenX_scale(4), CGRectGetMinY(userSex.frame), 17, 13)];
    [imgVipLevel setImage:[UIImage imageNamed:dicTemp[@"vipLevel"]]];
    [cell addSubview:imgVipLevel];
    
    
    //内容
    cell.labelContext.text = dicTemp[@"context"];
    CGRect contextRect = [self getTextFrameWithText:dicTemp[@"context"] withSize:iphone_size_scale(300, 1000) withFont:Font_middle];
    [cell.labelContext setFrame:CGRectMake(cell.labelContext.frame.origin.x, cell.labelContext.frame.origin.y, contextRect.size.width, contextRect.size.height)];
    
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
    UIButton * btnShare = [[UIButton alloc]initWithFrame:CGRectMake(kPercenX_scale(10), CGRectGetMaxY(cell.viewPic.frame), 55, 30)];
    [btnShare setImage:[UIImage imageNamed:@"9-分享.png"] forState:UIControlStateNormal];
    btnShare.layer.masksToBounds= YES;
    btnShare.layer.cornerRadius =  14;
    btnShare.layer.borderColor = Color_Grey_Text.CGColor;
    btnShare.layer.borderWidth = 1;
    btnShare.contentEdgeInsets = UIEdgeInsetsMake(8,15,8,27);
    
    [btnShare setTag:10000+indexPath.row];
    [btnShare addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell addSubview:btnShare];
    
    
#pragma comment
    UIButton * btnComment = [[UIButton alloc]initWithFrame:CGRectMake(kPercenX_scale(260), CGRectGetMaxY(cell.viewPic.frame), 55, 30)];
    [btnComment setTintColor:Color_Grey_Text];
    [btnComment setImage:[UIImage imageNamed:@"9-评论.png"] forState:UIControlStateNormal];
    btnComment.layer.masksToBounds= YES;
    btnComment.layer.cornerRadius =  14;
    btnComment.layer.borderColor = Color_Grey_Text.CGColor;
    btnComment.layer.borderWidth = 1;
    btnComment.contentEdgeInsets = UIEdgeInsetsMake(9,12,7,27);
    
    [btnComment setTag:30000+indexPath.row];
    [btnComment addTarget:self action:@selector(comment:) forControlEvents:UIControlEventTouchUpInside];

    
    [cell addSubview:btnComment];
    
    UILabel * labelComment = [[UILabel alloc]initWithFrame:CGRectMake(30, 9, 20, 10)];
    [labelComment setTextColor:Color_Grey_Text];
    [labelComment setFont:Font_small];
    [labelComment setText:dicTemp[@"comment"]];
    [btnComment addSubview:labelComment];

#pragma browse
    UIButton * btnBrowse = [[UIButton alloc]initWithFrame:CGRectMake(kPercenX_scale(205), CGRectGetMaxY(cell.viewPic.frame), 55, 30)];
    [btnBrowse setTintColor:Color_Grey_Text];
    [btnBrowse setImage:[UIImage imageNamed:@"9-查看.png"] forState:UIControlStateNormal];
    btnBrowse.layer.masksToBounds= YES;
    btnBrowse.layer.cornerRadius =  14;
    btnBrowse.layer.borderColor = Color_Grey_Text.CGColor;
    btnBrowse.layer.borderWidth = 1;
    btnBrowse.contentEdgeInsets = UIEdgeInsetsMake(9,10,9,27);
    
    [btnBrowse setTag:20000+indexPath.row];
    [btnBrowse addTarget:self action:@selector(browse:) forControlEvents:UIControlEventTouchUpInside];


    
    [cell addSubview:btnBrowse];
    
    UILabel * labelBrowse = [[UILabel alloc]initWithFrame:CGRectMake(30, 9, 20, 10)];
    [labelBrowse setTextColor:Color_Grey_Text];
    [labelBrowse setFont:Font_small];
    [labelBrowse setText:dicTemp[@"browse"]];
    [btnBrowse addSubview:labelBrowse];

    
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [self tableView:tableViewDesignerMsg cellForRowAtIndexPath:indexPath];
//    return cell.frame.size.height;
    
    return 300;
}


-(void)share:(UIButton *)btn{
    [self.delegate shareWithIndex:btn.tag-10000];
}

-(void)browse:(UIButton *)btn{
    [self.delegate browseWithIndex:btn.tag-20000];
}

-(void)comment:(UIButton *)btn{
    [self.delegate commentWithIndex:btn.tag-30000];
}

-(void)reloadTableViewWithArray:(NSArray *)array{
    arrTableData = [NSMutableArray arrayWithArray:array];
}

-(CGRect)getTextFrameWithText:(NSString *)strContext withSize:(CGSize)size withFont:(UIFont*)font{
       return [strContext boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
}

@end
