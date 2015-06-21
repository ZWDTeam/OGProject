//
//  LocationHeaderView.m
//  AutoLayout
//
//  Created by 钟伟迪 on 15/6/11.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "LocationHeaderView.h"

@implementation LocationHeaderView

-(id) initWithCoordinate:(CLLocationCoordinate2D) coords
{
    if (self = [super init]) {
        _coordinate = coords;
    }
    return self;
}


@end
