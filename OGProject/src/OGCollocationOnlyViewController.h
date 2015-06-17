//
//  OGCollocationOnlyViewController.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/16.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGBaseViewController.h"


@protocol OGBaseViewControllerDelegate
-(void)BaseViewIndexDetail:(NSString *)index;//1.1定义协议与方法
@end

@interface OGCollocationOnlyViewController : OGBaseViewController

@property (retain,nonatomic) id <OGBaseViewControllerDelegate> detailDelegate;
@end
