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
    NSArray * arrayPic = [[NSArray alloc]initWithObjects:@"11-图2.png",@"11-图1.png",@"11-图3.png", nil];
    
    NSDictionary * dicTemp = [[NSDictionary alloc]initWithObjectsAndKeys:@"8-大头像",@"userPic",
                              @"Cindy",@"userName",
                              @"欧工国际设计公司",@"userCompany",
                              @"3分钟前",@"time" ,
                              @"1",@"userSex",
                              @"2-2a.png",@"vipLevel",
                              @"最近心情不错，出了三套设计方案都没公司认可的，那么，召唤效果图!\r\n最近心情不错，出了三套设计方案都没公司认可的，那么，召唤效果图!",@"context",
                              arrayPic,@"CirclePic",
                              @"18",@"browse",
                              @"41",@"comment",nil];
    
    NSArray * arrTemp = [NSArray arrayWithObject:dicTemp];
    
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
-(void)commentWithIndex:(NSInteger)index{
    WWLog(@"%ld",(long)index);
}

@end
