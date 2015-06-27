//
//  ScrollPageControl.h
//  iOSBCControll
//
//  Created by zhongweidi on 14-7-7.
//  Copyright (c) 2014年 hnqn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollPageControl : UIPageControl{
    UIImage*_activeImage;
    UIImage*_inactiveImage;
    NSArray *_usedToRetainOriginalSubview;
    
}

@end
