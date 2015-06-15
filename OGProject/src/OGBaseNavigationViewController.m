//
//  OGBaseNavigationViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/15.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGBaseNavigationViewController.h"

@interface OGBaseNavigationViewController ()

@end

@implementation OGBaseNavigationViewController


- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //设置导航栏颜色
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:139.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f]];
        
        //设置字体属性
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
                                                               NSForegroundColorAttributeName: [UIColor whiteColor]}];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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

#pragma mark - 设置状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return  UIStatusBarStyleLightContent;
}

@end
