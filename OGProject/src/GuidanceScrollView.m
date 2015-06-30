//
//  GuidanceScrollView.m
//  TemperatureControl
//
//  Created by zhongweidi on 14-4-24.
//  Copyright (c) 2014年 zhangzhao. All rights reserved.
//

#import "GuidanceScrollView.h"

@implementation GuidanceScrollView{
    UIPageControl * pageControll;
}


+ (id)showGuidanceScrooll {
    GuidanceScrollView *view = nil;
    if ([GuidanceScrollView isFirstLogin]) {
        UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
        view = [[GuidanceScrollView alloc] initWithFrame:window.frame];
        view.layer.zPosition = 1;
        [window addSubview:view];
    }
    return view;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.contentSize =CGSizeMake(MainView_Width*5, 0);
        self.pagingEnabled=YES;
        self.delegate=self;
        self.autoresizesSubviews = YES;
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.indicatorStyle = UIScrollViewIndicatorStyleWhite;
        self.clipsToBounds = YES;
        self.scrollEnabled = YES;
        [self initUI];
    }
    return self;
}

- (void)initUI{
    NSArray *images;
//    if (iPhone5) {
//         images=@[@"guidance1_5.jpg",@"guidance2_5.jpg",@"guidance3_5.jpg",@"guidance4_5.jpg",@""];
//    }else{
         images=@[@"first1",@"first2",@"first3",@"first4"];
//    }
 
    for (int i=0; i<images.count; i++) {
        UIImageView * imageView =[[UIImageView alloc] init];
        imageView.frame=CGRectMake(i*MainView_Width, 0, MainView_Width, MainView_Height);
        imageView.image=[UIImage imageNamed:images[i]];
        [self addSubview:imageView];
    }
    
    UIButton *btnBegin =[UIButton buttonWithType:UIButtonTypeCustom];
    btnBegin.frame =CGRectMake(0, MainView_Height-110, 150, 45);
    btnBegin.center =CGPointMake(MainView_Width*3+MainView_Width/2, btnBegin.center.y);
    [btnBegin setBackgroundColor:[UIColor clearColor]];
    [btnBegin addTarget:self action:@selector(btnBegin_action:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnBegin];
    
    pageControll = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    pageControll.center = CGPointMake(MainView_Width/2.0f, MainView_Height -60);
    pageControll.numberOfPages = images.count;
    pageControll.currentPage = 0;
    pageControll.layer.zPosition = 2;
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    [window insertSubview:pageControll aboveSubview:self];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    float border =scrollView.contentOffset.x;
    if (border>=MainView_Width*3) {
        
        
        [UIView animateKeyframesWithDuration:1.0 delay:1.0 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
            self.alpha = 0.0;
            pageControll.alpha = 0.0;

        } completion:^(BOOL finished) {
            [self saveFirstLoginInfo];
            [self removeFromSuperview];
            [pageControll removeFromSuperview];
            pageControll = nil;

        }];
    
    }else{
        pageControll.currentPage = border/MainView_Width;
    }
}

- (void)btnBegin_action:(UIButton *)sender{
        self.alpha=1.0;
    [UIView animateWithDuration:1.0 animations:^{
        self.alpha=0.0;
    } completion:^(BOOL finished) {
        [self saveFirstLoginInfo];
        [self removeFromSuperview];
    }];
}

#pragma  mark - 保存操作
- (void)saveFirstLoginInfo{
    NSDictionary *dic =@{@"isFirstLogin":@"guidance"};
    [dic writeToFile:[GuidanceScrollView getFilePath] atomically:NO];
}

+ (NSString *)getFilePath{
    NSString *path =[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath =[path stringByAppendingPathComponent:@"isFirstLogin.plist"];
    return filePath;
}

//判断是否为第一次启动
+ (BOOL)isFirstLogin{
//  #warning 发布时记得打开
    NSDictionary * dic =[NSDictionary dictionaryWithContentsOfFile:[self getFilePath]];
    if (dic) return NO;
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
