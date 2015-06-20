//
//  OGHomeViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/15.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGHomeViewController.h"
#import "SGFocusImageFrame.h"
#import "SGFocusImageItem.h"

@interface OGHomeViewController ()<SGFocusImageFrameDelegate>

@property (strong , nonatomic) SGFocusImageFrame *bannerView;
@property (strong , nonatomic) NSMutableArray * headerDatas;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@end

@implementation OGHomeViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"迪哥微博";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页"
                                                        image:[UIImage imageNamed:@"首页00"]
                                                selectedImage:[UIImage imageNamed:@"首页01"]];
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * pathString = [[NSBundle mainBundle] pathForResource:@"homeHeaderModel" ofType:@"plist"];
    NSArray * array = [NSArray arrayWithContentsOfFile:pathString];
    _headerDatas  = [[NSMutableArray alloc] initWithArray:array];
    [_headerDatas addObject:array[0]];
    [_headerDatas insertObject:array[array.count-1] atIndex:0];
    
    //加载轮播试图
    [self bannerView];
}


- (SGFocusImageFrame *)bannerView{
    if (!_bannerView) {
        NSMutableArray *arrItemp=[NSMutableArray new];
        for (int i = 0 ; i < _headerDatas.count; i++)
        {
            SGFocusImageItem *item = [[SGFocusImageItem alloc] initWithTitle:_headerDatas[i][@"title"]
                                                                       image:_headerDatas[i][@"imageString"]
                                                                         tag:i-1];
            [arrItemp addObject:item];
        }
        CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, 311.0f/2.0f);
        self.bannerView = [[SGFocusImageFrame alloc] initWithFrame:rect
                                                          delegate:self
                                                        imageItems:arrItemp
                                                            isAuto:YES
                                                               num:3.0];
        [self.contentScrollView addSubview:self.bannerView];
        
    }
    return _bannerView;
}

#pragma mark - Action

//找设计师
- (IBAction)seekProjectorAction:(id)sender {
    [self performSegueWithIdentifier:@"pushMapViewController" sender:nil];
}

//看攻略
- (IBAction)lookStrategyAction:(id)sender {
    [self performSegueWithIdentifier:@"pushLookStrategy" sender:nil];

}

//找方案
- (IBAction)seekSchemesAction:(id)sender {
    [self performSegueWithIdentifier:@"pushSchemeView" sender:nil];
}

//亲体验
- (IBAction)experienceAction:(id)sender {
    [self performSegueWithIdentifier:@"pushExperience" sender:nil];
    
}

//我是设计师
- (IBAction)myProjectorAction:(id)sender {
    [self performSegueWithIdentifier:@"pushStylistView" sender:nil];
    
}
#pragma mark - SGFocusImageFrameDelegate
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame tapGesItem:(NSInteger)index{
    NSLog(@"%ld",index);
}

- (IBAction)callUpAction:(UIBarButtonItem *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
