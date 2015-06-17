//
//  CommodityViewController.m
//  OGProject
//
//  Created by qihuan on 15/6/17.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "CommodityViewController.h"
#import "OGCommodityModel.h"

@interface CommodityViewController ()

@end

@implementation CommodityViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"方案详情";
    }
    return self;
    
}


- (OGCommodityModel *)commodityInfo{
    if (!_commodityInfo) {
        _commodityInfo.title = @"乃哦提";
        _commodityInfo.headImages = @[@"mm4.jpg"];
    }
    return _commodityInfo;
}

- (void)viewDidLoad {
    self.title = self.commodityInfo.title;
    
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
