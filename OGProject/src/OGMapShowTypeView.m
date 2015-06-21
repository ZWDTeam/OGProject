//
//  OGMapShowTypeView.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/21.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


#import "OGMapShowTypeView.h"

@implementation OGMapShowTypeView


- (IBAction)selectedShowType:(UIButton *)sender {
    if (_target && _action) {
        _selectedIndex = sender.tag;
        SuppressPerformSelectorLeakWarning(
                                           [_target performSelector:_action withObject:self]);

    }
}


- (void)addTarget:(id)target action:(SEL)action{
    _target = target;
    _action = action;
}
@end
