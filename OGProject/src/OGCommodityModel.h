//
//  OGCommodityModel.h
//  OGProject
//
//  Created by qihuan on 15/6/18.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OGCommodityModel : NSObject
@property (strong,nonatomic) NSArray *headImages;//单品图片展示

@property (strong , nonatomic) NSString *title;//标题

@property (strong,nonatomic) NSString * newsPrice;//优惠价
@property (strong,nonatomic) NSString * oldPrice;//原价
@property (strong,nonatomic) NSString * commentCount; //评论数
@property (strong,nonatomic) NSString * zanCount;//赞数


@property (strong,nonatomic) NSArray * matchs; //搭配商品，存放类型为OGCommodityModel


@end
