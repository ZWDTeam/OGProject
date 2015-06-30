//
//  VPStretchBaseView.m
//  VillagePlay
//
//  Created by 钟伟迪 on 15/6/19.
//  Copyright (c) 2015年 zjh. All rights reserved.
//

#import "VPStretchBaseView.h"
#import "OGSchemeHeaderView.h"
#import "Masonry.h"

@implementation VPStretchBaseView{

    CGFloat _height;
}


- (id)initWithFrame:(CGRect)frame{
    self = [[[NSBundle mainBundle] loadNibNamed:@"VPStretchBaseView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = frame;
        [self updateUI];
    }
    return self;
}


- (void)awakeFromNib{
    [self updateUI];
}


- (void)updateUI{
    OGSchemeHeaderView * view = [[[NSBundle mainBundle] loadNibNamed:@"OGSchemeHeaderView" owner:self options:nil] lastObject];
    
    CGRect rect = view.frame;
    rect.origin.y = 70;
    view.frame = rect;
    
    [self addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(@(0));
        make.left.mas_equalTo(@0);
        make.height.mas_equalTo(@70);
        make.right.mas_equalTo(@0);
    }];

    
    return;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
