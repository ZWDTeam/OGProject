//
//  OGBaseTabBarController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/15.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGBaseTabBarController.h"
#import "OGBaseViewController.h"
#import "OGExternObject.h"

@interface OGBaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation OGBaseTabBarController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //设置标题栏内容颜色
        [[UITabBar appearance] setTintColor:OG_BASE_COLOR];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if(!ex_islogin&&self.selectedIndex == 3){
        UIStoryboard * stroyboard =[UIStoryboard storyboardWithName:@"OGLogin" bundle:[NSBundle mainBundle]];
        
        UINavigationController * navigationController = [stroyboard instantiateViewControllerWithIdentifier:@"OGLoginNavigationController"];
        
        [self presentViewController:navigationController animated:YES completion:nil];
    }
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
