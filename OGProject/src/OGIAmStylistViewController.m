//
//  OGIAmStylistViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGIAmStylistViewController.h"
#import "OGDemandDetailsViewController.h"
@interface OGIAmStylistViewController ()

@end

@implementation OGIAmStylistViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
     self.title= @"我是设计师";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#warning 测试按钮
    UIButton * btnTest = [[UIButton alloc]initWithFrame:CGRectMake(100, 400, 100, 100)];
    [btnTest setBackgroundColor:[UIColor redColor]];
    [btnTest setTitle:@"进入需求详情" forState:UIControlStateNormal];
    [btnTest addTarget:self action:@selector(goDtial) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnTest];
}

-(void)goDtial{
    OGDemandDetailsViewController * DetailVC = [[OGDemandDetailsViewController alloc]init];
    [self.navigationController pushViewController:DetailVC animated:YES];
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
