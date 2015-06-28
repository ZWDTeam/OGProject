//
//  OGSendHelpModel.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/25.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OGSendHelpModel : NSObject

@property (strong , nonatomic)NSString * title;//标题

@property (strong , nonatomic)NSString * area;//面积

@property (strong , nonatomic)NSString * type;//户型

@property (strong , nonatomic)NSString * style;//装修风格

@property (strong , nonatomic)UIImage * typeImage;//户型图片

@property (strong , nonatomic)NSString * villgeName;//小区民称

@property (strong , nonatomic)NSString * money;//预算

@end
