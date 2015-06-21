//
//  OGMapShowTypeView.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/21.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OGMapShowTypeView : UIView{

    id _target;
    SEL _action;

}

@property (nonatomic) NSInteger selectedIndex;

- (void)addTarget:(id)target action:(SEL)action;

@end
