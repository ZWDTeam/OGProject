//
//  OGDemandDetailsViewController.m
//  OGProject
//
//  Created by ww on 15/6/27.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGDemandDetailsViewController.h"

@interface OGDemandDetailsViewController ()

@end

@implementation OGDemandDetailsViewController{
    OGDemandDetailsView * demandDetailsView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"需求详情";
    
    demandDetailsView = [[OGDemandDetailsView alloc]initOGDemandDetailsView];
    
    [self.view addSubview:demandDetailsView];
    
    NSArray * array = [NSArray arrayWithObjects:@"3-1头像.png",@"3-1头像.png",@"3-1头像.png", nil];
    
    [demandDetailsView DemandDetailsViewSetTitle:@"想要找个软装设计方案" Time:@"2013-01-14 17:12" DesignerNum:@"8" DesignerPic:array];
    [demandDetailsView DemandDetailsViewSetArea:@"238M" HouseType:@"三室二厅" Style:@"现代 欧美" Address:@"长沙开福区北辰三角洲" Budget:@"20-30万" HouseTypeImg:@"8-户型图.png" DetailedMsg:@"希望是简约风格,适合年轻人居住"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
