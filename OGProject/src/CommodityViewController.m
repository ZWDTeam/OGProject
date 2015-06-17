//
//  CommodityViewController.m
//  OGProject
//
//  Created by qihuan on 15/6/17.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "CommodityViewController.h"

@interface CommodityViewController ()

@end

@implementation CommodityViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"搭配购";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"方案详情"
                                                        image:[UIImage imageNamed:@"搭配购00"]
                                                selectedImage:[UIImage imageNamed:@"搭配购01"]];
    }
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
