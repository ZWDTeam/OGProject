//
//  OGCollocationOnlyViewController.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/16.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGBaseViewController.h"


@protocol OGCollocationOnlyViewControllerDelegate <NSObject>
@optional
-(void)selectedWithInfo:(id)info viewController:(OGBaseViewController *)viewController;
@end

@interface OGCollocationOnlyViewController : OGBaseViewController

@property (retain,nonatomic) id <OGCollocationOnlyViewControllerDelegate> delegate;
@end
