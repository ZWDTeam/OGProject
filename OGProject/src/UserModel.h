//
//  UserModel.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/28.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (strong , nonatomic)UIImage * headerImage;

@property (strong , nonatomic)NSString *nickName;

@property (strong , nonatomic)NSString *sex;

@property (strong , nonatomic)NSString * city;

@property (strong , nonatomic)NSString * style;//装修风格

@property (strong , nonatomic)NSString * type;//户型

@property (strong , nonatomic)NSString *area;

@property (strong , nonatomic)NSString * address;

@property (strong , nonatomic)NSString * company;//公司

@property (strong , nonatomic)NSString *year;//从业年限

@property (strong , nonatomic)NSString *intro;//简介

@end
