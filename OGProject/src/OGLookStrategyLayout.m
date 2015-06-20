//
//  OGLookStrategyLayout.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGLookStrategyLayout.h"
#import "OGBaseViewController.h"

@implementation OGLookStrategyLayout

- (id)init{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake((SCREEN_WIDTH-30)/2.0f,(SCREEN_WIDTH-30)/2.0f+25);
        self.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
        
        self.minimumLineSpacing = 0;
    }
    return self;
}

@end
