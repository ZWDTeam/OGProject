//
//  OGUserInfoViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGUserInfoViewController.h"

@interface OGUserInfoViewController ()

@end

@implementation OGUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tuichuAction:(id)sender {
    UIStoryboard * stroyboard =[UIStoryboard storyboardWithName:@"OGLogin" bundle:[NSBundle mainBundle]];
    
    UINavigationController * navigationController = [stroyboard instantiateViewControllerWithIdentifier:@"OGLoginNavigationController"];
    
    [self presentViewController:navigationController animated:YES completion:nil];
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
