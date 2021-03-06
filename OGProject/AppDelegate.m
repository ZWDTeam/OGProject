//
//  AppDelegate.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/15.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ex_userInfo = [UserModel new];
    ex_userInfo.headerImage = [UIImage imageNamed:@"gg4.jpg"];
    ex_userInfo.nickName = @"HD";
    ex_userInfo.sex = @"男";
    ex_userInfo.city = @"湖南 - 长沙";
    ex_userInfo.style = @"清晰";
    ex_userInfo.type = @"三十两厅";
    ex_userInfo.area = @"152 mm";
    ex_userInfo.address = @"岳麓区涉外花园";
    ex_userInfo.company = @"欧工软装";
    ex_userInfo.year = @"4年";
    ex_userInfo.intro = @"我的简介";
    
    ex_identityType = OGIdentityTypeUser;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
