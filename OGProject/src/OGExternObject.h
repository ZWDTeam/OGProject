//
//  OGExternObject.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/15.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

typedef NS_ENUM(NSInteger, OGIdentityType) {
    OGIdentityTypeUser,//用户
    OGIdentityTypeStylist//设计师
};

@interface OGExternObject : NSObject

//是否登录
extern BOOL ex_islogin;

//账号
extern NSString * ex_account;

//密码
extern NSString * ex_password;

//账户类型
extern OGIdentityType ex_identityType;

//定位地址
extern NSString * ex_locationCity;

//用户信息
extern UserModel * ex_userInfo;

@end
