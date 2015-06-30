//
//  LocationHeaderView.h
//  AutoLayout
//
//  Created by 钟伟迪 on 15/6/11.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface LocationHeaderView : NSObject<MKAnnotation>


@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign)NSInteger tag;

@end
