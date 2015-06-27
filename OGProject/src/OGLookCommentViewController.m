//
//  OGLookCommentViewController.m
//  OGProject
//
//  Created by ww on 15/6/27.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGLookCommentViewController.h"

@interface OGLookCommentViewController ()

@end

@implementation OGLookCommentViewController{
    OGLookCommentView * commentView;
    
    NSMutableArray * arrayTableViewData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"查看评论";
    
    
    commentView = [[OGLookCommentView alloc]initLookCommentView];
    commentView.delegate = self;
    [self.view addSubview:commentView];
    
    
    
    //模拟数据刷新界面
    
    NSDictionary * dicTemp1 = [NSDictionary dictionaryWithObjectsAndKeys:@"3-1头像.png",@"pic",@"追求完美的男人",@"userName",@"2013-08-01 12:11",@"time",@"今天天气真好，我又要去追求我的完美了。要知道，我是一个追求完美的男人，凡人啊，颤抖吧",@"comment", nil];
    NSDictionary * dicTemp2 = [NSDictionary dictionaryWithObjectsAndKeys:@"3-1头像.png",@"pic",@"勇敢的少年",@"userName",@"2013-08-01 12:11",@"time",@"勇敢的少年啊，快去创造奇迹吧，我可是一个有首领之傲的召唤师",@"comment", nil];

    arrayTableViewData = [NSMutableArray arrayWithObjects:dicTemp1,dicTemp2, nil];
    
    //刷新界面
    [commentView reloadTableViewWithArray:arrayTableViewData];
}

-(void)submitCommentWithContext:(NSString *)strContext{
    //获得时间戳
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *currentTime = [formatter stringFromDate:[NSDate date]];
    
    
    NSDictionary * dicTemp = [NSDictionary dictionaryWithObjectsAndKeys:@"3-1头像.png",@"pic",@"勇敢的少年",@"userName",currentTime,@"time",strContext,@"comment", nil];
    
    [arrayTableViewData addObject:dicTemp];
    
    //刷新界面
    [commentView reloadTableViewWithArray:arrayTableViewData];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    
    UITextField * tfTemp = (UITextField *)[commentView.viewSubmitComment viewWithTag:10001];
    
    if ([tfTemp isFirstResponder]) {
        [self get:MainView_Height-kbSize.height-60];
        
    }
    
}

//界面调整动画
-(void)get:(float)move{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:commentView.viewSubmitComment cache:YES];
    [UIView setAnimationDuration:0.3];
    CGRect frame = commentView.viewSubmitComment.frame;
    frame.origin.y =move;//view的y轴上移
    commentView.viewSubmitComment.frame = frame;
    [UIView commitAnimations];//设置调整界面的动画效果
}


@end
