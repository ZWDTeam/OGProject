//
//  OGMapViewController.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/15.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "OGBaseViewController.h"
#import "OGDesignerHomeViewController.h"

typedef NS_ENUM(NSInteger, MapShowType){

    MapShowTypePeople = 0, //显示设计师
    MapShowTypeHouse   //显示体验馆
    
};

@interface OGMapViewController : OGBaseViewController


@property (assign , nonatomic)MapShowType showType;

@end
