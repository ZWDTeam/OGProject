//
//  OGCollocationFlowLayout.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/16.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGCollocationFlowLayout.h"
#import "OGBaseViewController.h"

@implementation OGCollocationFlowLayout

- (id)init{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake((SCREEN_WIDTH-30)/2.0f, 130.0f);
        self.minimumInteritemSpacing = 5;
        self.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
        self.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 155);
    }
    return self;
}

@end
