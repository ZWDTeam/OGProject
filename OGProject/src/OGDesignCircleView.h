//
//  OGDesignCircleView.h
//  OGProject
//
//  Created by ww on 15/6/28.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "WWCommentLabel.h"
@protocol CircleViewDelegate <NSObject>

@required
-(void)submitSearchWithContext:(NSString *)strContext;

-(void)shareWithIndex:(NSInteger)index;
-(void)browseWithIndex:(NSInteger)index;
-(void)commentWithIndex:(NSInteger)index context:(NSString *)strContext;


-(void)commentSelectWithCommentId:(NSInteger)index;
@end

@interface OGDesignCircleView : UIView<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>



-(id)initDesignCircleView;

/**
 *  刷新列表单行--主要用于评论
 *
 *  @param index   rows
 *  @param dicTemp data
 */
-(void)reloadTableRows:(NSInteger)index withNewData:(NSDictionary *)dicTemp;

@property (nonatomic,assign) id<CircleViewDelegate> delegate;
@property (strong) NSMutableArray * arrTableData;


/**
 *  刷新数据方法
 *
 *  @param array 数据源
 */
-(void)reloadTableViewWithArray:(NSArray *)array;


@property (strong)UIView * viewSubmitComment;

@end
