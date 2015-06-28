//
//  OGDesignCircleView.h
//  OGProject
//
//  Created by ww on 15/6/28.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol CircleViewDelegate <NSObject>

@required
-(void)submitSearchWithContext:(NSString *)strContext;

-(void)shareWithIndex:(NSInteger)index;
-(void)browseWithIndex:(NSInteger)index;
-(void)commentWithIndex:(NSInteger)index;

@end

@interface OGDesignCircleView : UIView<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>



-(id)initDesignCircleView;

@property (nonatomic,assign) id<CircleViewDelegate> delegate;



/**
 *  刷新数据方法
 *
 *  @param array 数据源
 */
-(void)reloadTableViewWithArray:(NSArray *)array;

@end
