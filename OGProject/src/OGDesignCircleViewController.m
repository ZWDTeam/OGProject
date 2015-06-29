//
//  OGDesignCircleViewController.m
//  OGProject
//
//  Created by ww on 15/6/28.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGDesignCircleViewController.h"
#import "OGDesignCircleView.h"

@interface OGDesignCircleViewController ()<CircleViewDelegate>

@end

@implementation OGDesignCircleViewController{
    OGDesignCircleView * DesignCircleView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"设计圈";
    UIBarButtonItem * RBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"分享.png"] style:UIBarButtonItemStyleDone target:self action:@selector(shareDesigner)];
    
    self.navigationItem.rightBarButtonItem = RBtn;
    
    DesignCircleView = [[OGDesignCircleView alloc]initDesignCircleView];
    [DesignCircleView setDelegate:self];
    [self.view addSubview:DesignCircleView];
    
    
    //模拟数据
    NSArray * arrayPic = [[NSArray alloc]initWithObjects:@"11-图2.png",@"11-图1.png",@"11-图1.png", nil];
    
    //评论模拟
    NSDictionary * dicTemp01 = [NSDictionary dictionaryWithObjectsAndKeys: @"勇敢的少年",@"commentUserName",
                                @"今天的天气真是好，我又要踏上我的冒险，去村民家里找装备啦，要知道，我的征途是星辰大海哟！~",@"commentContext",@"123",@"commentId",nil];
    
    NSDictionary * dicTemp02 = [NSDictionary dictionaryWithObjectsAndKeys: @"追求完美的男人",@"commentUserName",
                                @"完美是谁？你是完美么？",@"commentContext",@"234",@"commentId",nil];
    
    NSDictionary * dicTemp03 = [NSDictionary dictionaryWithObjectsAndKeys: @"Lily",@"commentUserName",
                                @"人穷尽一生追寻另一个人类,\r\n共度一生的事,\r\n我一直无法理解,\r\n或许我自己太有意思，无需他人陪伴,\r\n所以 我祝你们在对方身上得到的快乐,\r\n与我给自己的一样多",@"commentContext",@"345",@"commentId",nil];

    NSArray * arrayComment = [[NSArray alloc]initWithObjects:dicTemp01,dicTemp02, dicTemp03,nil];

    
    
    //人物信息模拟
    NSDictionary * dicTemp = [[NSDictionary alloc]initWithObjectsAndKeys:@"8-大头像",@"userPic",
                              @"Cindy",@"userName",
                              @"欧工国际设计公司",@"userCompany",
                              @"3分钟前",@"time" ,
                              @"1",@"userSex",
                              @"2-2a.png",@"vipLevel",
                              @"最近心情不错，出了三套设计方案都没公司认可的，那么，召唤效果图!\r\n最近心情不错，出了三套设计方案都没公司认可的，那么，召唤效果图!",@"context",
                              arrayPic,@"CirclePic",
                              @"18",@"browse",
                              @"41",@"comment",
                              arrayComment,@"commentList",nil];
    
    
    
    NSDictionary * dicTemp05 = [[NSDictionary alloc]initWithObjectsAndKeys:@"8-大头像",@"userPic",
                              @"啥都没有的少年",@"userName",
                              @"世界贸易组织-wto",@"userCompany",
                              @"10分钟前",@"time" ,
                              @"2",@"userSex",
                              @"2-2a.png",@"vipLevel",
                              @"今天我又卖出10块钱的货啦，我马上就要升职加薪，走上人生巅峰啦",@"context",
                              @"18",@"browse",
                              @"41",@"comment",
                              nil];
    
    NSDictionary * dicTemp06 = [[NSDictionary alloc]initWithObjectsAndKeys:@"8-大头像",@"userPic",
                                @"没有评论的少年 名字就是这么长 任性",@"userName",
                                @"世界贸易组织-wto 超级大公司  你敢信？",@"userCompany",
                                @"10分钟前",@"time" ,
                                @"2",@"userSex",
                                @"2-2a.png",@"vipLevel",
                                @"今天我又卖出10块钱的货啦，我马上就要升职加薪，走上人生巅峰啦",@"context",
                                arrayPic,@"CirclePic",
                                @"18",@"browse",
                                @"41",@"comment",
                                nil];
    
    
    NSDictionary * dicTemp07 = [[NSDictionary alloc]initWithObjectsAndKeys:@"8-大头像",@"userPic",
                                @"没有图片的少年",@"userName",
                                @"世界贸易组织-wto",@"userCompany",
                                @"10分钟前",@"time" ,
                                @"2",@"userSex",
                                @"2-2a.png",@"vipLevel",
                                @"今天我又卖出10块钱的货啦，我马上就要升职加薪，走上人生巅峰啦",@"context",
                                @"18",@"browse",
                                @"41",@"comment",
                                arrayComment,@"commentList",
                                nil];

    
    //总数据拼接
    
    NSArray * arrTemp = [NSArray arrayWithObjects:dicTemp,dicTemp05,dicTemp06,dicTemp07, nil];
    
    
    [DesignCircleView reloadTableViewWithArray:arrTemp];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  搜索提交
 *
 *  @param strContext 内容
 */
-(void)submitSearchWithContext:(NSString *)strContext{
    WWLog(@"%@",strContext);
}


#pragma mark - 分享 - 浏览 - 评论 按钮方法
-(void)shareWithIndex:(NSInteger)index
{
    WWLog(@"%ld",(long)index);
}
-(void)browseWithIndex:(NSInteger)index{
    WWLog(@"%ld",(long)index);
}
-(void)commentWithIndex:(NSInteger)index context:(NSString *)strContext{
    WWLog(@"index -- %ld  内容 -- %@",(long)index,strContext);
    
    
    if (strContext.length>0) {
        
        //我把所有的数据拼接等放在了vc
        NSMutableDictionary * dicTemp = [NSMutableDictionary dictionaryWithDictionary:DesignCircleView.arrTableData[index]];
        
        NSMutableArray * arrayTemp = [NSMutableArray arrayWithArray:dicTemp[@"commentList"]];
        NSDictionary * newComment = [NSDictionary dictionaryWithObjectsAndKeys:@"钟伟迪",@"commentUserName",
                                     strContext,@"commentContext",@"456",@"commentId", nil];
        [arrayTemp addObject:newComment];
        [dicTemp setObject:arrayTemp forKey:@"commentList"];
        
        //新数据刷新cell
        [DesignCircleView reloadTableRows:index withNewData:dicTemp];
    }
    
}

//评论点击方法
-(void)commentSelectWithCommentId:(NSInteger)index{
    WWLog(@"点击的评论id --%ld",(long)index);
}




#pragma mark - otherFunction

-(void)viewWillDisappear:(BOOL)animated {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidChangeFrameNotification object:nil];
}

-(void)viewDidAppear:(BOOL)animated{
    //键盘监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
}


//键盘事件
- (void)keyboardWasChange:(NSNotification *)aNotification {
    
    WWLog(@"Keyboard change");
    
    NSDictionary *info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    UITextField * tfTemp = (UITextField *)[DesignCircleView.viewSubmitComment viewWithTag:90001];
    
    if ([tfTemp isFirstResponder]) {
        [self get:MainView_Height-kbSize.height-54];
        
    }
    
}

//界面调整动画
-(void)get:(float)move{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:DesignCircleView.viewSubmitComment cache:YES];
    [UIView setAnimationDuration:0.3];
    CGRect frame = DesignCircleView.viewSubmitComment.frame;
    frame.origin.y =move;//view的y轴上移
    DesignCircleView.viewSubmitComment.frame = frame;
    [UIView commitAnimations];//设置调整界面的动画效果
}
@end
