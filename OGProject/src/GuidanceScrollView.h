//
//  GuidanceScrollView.h
//  TemperatureControl
//
//  Created by zhongweidi on 14-4-24.
//  Copyright (c) 2014年 zhangzhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuidanceScrollView : UIScrollView<UIScrollViewDelegate>

//判断是否为第一次启动
+ (id)showGuidanceScrooll;

@end
