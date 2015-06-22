//
//  OGSchemeMenuView.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/22.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OGSchemeMenuView;

@protocol  OGSchemeMenuViewDelegate<NSObject>

- (void)selectedMenuView:(OGSchemeMenuView *)menuView withIndexPath:(NSIndexPath *)indexPath;

@end

@interface OGSchemeMenuView : UIView

@property (strong , nonatomic )NSArray * items;

@property (strong , nonatomic)UIColor * titleColor;

@property (assign , nonatomic)CGPoint origin;

@property (weak , nonatomic)id delegate;


- (id)initWithDelegate:(id)delegate withItems:(NSArray *)items;


- (void)showInView:(UIView *)view;

- (void)dismiss;


@end
