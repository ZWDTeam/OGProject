//
//  OGCollectionReusableView.m
//  demo111
//
//  Created by 钟伟迪 on 15/6/17.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGCollectionReusableView.h"
#import "SGFocusImageFrame.h"
#import "OGBaseViewController.h"
#import "SGFocusImageItem.h"

@interface OGCollectionReusableView ()<SGFocusImageFrameDelegate>

@property (strong , nonatomic) SGFocusImageFrame *bannerView;

@property (strong , nonatomic) NSMutableArray * headerDatas;

@end

@implementation OGCollectionReusableView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    NSString * pathString = [[NSBundle mainBundle] pathForResource:@"homeHeaderModel" ofType:@"plist"];
    NSArray * array = [NSArray arrayWithContentsOfFile:pathString];
    _headerDatas  = [[NSMutableArray alloc] initWithArray:array];
    [_headerDatas addObject:array[0]];
    [_headerDatas insertObject:array[array.count-1] atIndex:0];
    [self bannerView];

    
    return self;
}

- (SGFocusImageFrame *)bannerView{
    if (!_bannerView) {
        NSMutableArray *arrItemp=[NSMutableArray new];
        for (int i = 0 ; i < _headerDatas.count; i++)
        {
            SGFocusImageItem *item = [[SGFocusImageItem alloc] initWithTitle:_headerDatas[i][@"title"]
                                                                       image:_headerDatas[i][@"imageString"]
                                                                         tag:i-1];
            [arrItemp addObject:item];
        }
        CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, 311.0f/2.0f);
        self.bannerView = [[SGFocusImageFrame alloc] initWithFrame:rect
                                                          delegate:self
                                                        imageItems:arrItemp
                                                            isAuto:YES
                                                               num:3.0];
        [self addSubview:self.bannerView];
        
    }
    return _bannerView;
}

#pragma mark - SGFocusImageFrameDelegate
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame tapGesItem:(NSInteger)index{
}

@end
