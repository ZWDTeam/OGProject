//
//  OGHomeViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/15.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGHomeViewController.h"

@interface OGHomeViewController ()

@end

@implementation OGHomeViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"迪哥微博";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页"
                                                        image:[UIImage imageNamed:@"zan"]
                                                selectedImage:[UIImage imageNamed:@"zan"]];
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)callUpAction:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"pushMapViewController" sender:nil];
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
