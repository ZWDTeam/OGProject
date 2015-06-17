//
//  OGMyselfViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/15.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGMyselfViewController.h"
#import "MyselfHeaderView.h"
#import "OGMyselfTableViewCell.h"

@interface OGMyselfViewController ()

@property (strong , nonatomic)MyselfHeaderView * headerView;

@end

@implementation OGMyselfViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"我的";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的"
                                                        image:[UIImage imageNamed:@"我的00"]
                                                selectedImage:[UIImage imageNamed:@"我的01"]];
    }
    return self;
    
}

- (MyselfHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[[NSBundle mainBundle] loadNibNamed:@"MyselfHeaderView" owner:self options:nil] lastObject];
    }
    return _headerView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
