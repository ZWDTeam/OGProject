//
//  OGSchemeUnitTableViewCell1.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/24.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OGSchemeUnitTableViewCell1;

@protocol  OGSchemeUnitTableViewCell1Delegate<NSObject>

- (void)actionPayBtnActionWithCell:(OGSchemeUnitTableViewCell1 *)cell;

@end

@interface OGSchemeUnitTableViewCell1 : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *payBtn;

@property (weak, nonatomic) IBOutlet UILabel *newsPriceLabel;

@property (weak , nonatomic)id<OGSchemeUnitTableViewCell1Delegate>delegate;

@end
