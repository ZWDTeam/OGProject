//
//  OGLookCommentView.h
//  OGProject
//
//  Created by ww on 15/6/27.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OGLookCommentTableViewCell.h"

@protocol submitCommentDelegate <NSObject>

@required
-(void)submitCommentWithContext:(NSString *)strContext;

@end

@interface OGLookCommentView : UIView<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>{
    UITableView * tableViewComment;
    
    UIView * viewSubmitComment;
    
    UITextField * tfComment;
    
    
    NSMutableArray * arrTableData;
}


@property (nonatomic,assign) id<submitCommentDelegate> delegate;

@property (strong)UIView * viewSubmitComment;
/**
 *  初始化视图
 *
 *  @return self
 */
-(id)initLookCommentView;


/**
 *  刷新数据方法
 *
 *  @param array 数据源
 */
-(void)reloadTableViewWithArray:(NSArray *)array;


@end
