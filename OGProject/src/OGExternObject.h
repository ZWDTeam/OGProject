//
//  OGExternObject.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/15.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OGExternObject : NSObject

//是否登录
extern BOOL ex_islogin;

//账号
extern NSString * ex_account;

//密码
extern NSString * ex_password;

@end
