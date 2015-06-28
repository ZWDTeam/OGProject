//
//  OGSendHelpViewController.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/25.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGBaseViewController.h"

@interface OGSendHelpViewController : OGBaseViewController

@property (strong , nonatomic)NSIndexPath * selectedIndexPath;

- (void)updataSelectdIndexPathWithText:(NSString *)text;

@end
