//
//  OGCollocationViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/15.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGCollocationViewController.h"
#import "OGCollocationOnlyViewController.h"
#import "OGCollocationMoreViewController.h"
#import "VPTribeSegmentedControl.h"
#import "OGSchemeDetailViewController.h"
#import "OGSchemeUnitViewController.h"

@interface OGCollocationViewController ()<UIScrollViewDelegate,OGCollocationOnlyViewControllerDelegate,OGCollocationMoreViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (strong , nonatomic)VPTribeSegmentedControl * segmentedControl;


@end

@implementation OGCollocationViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"搭配购";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"搭配购"
                                                        image:[UIImage imageNamed:@"搭配购00"]
                                                selectedImage:[UIImage imageNamed:@"搭配购01"]];
        self.navigationItem.titleView = self.segmentedControl;
    }
    return self;
    
}


- (VPTribeSegmentedControl *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [[VPTribeSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 200, 45) withItems:@[@"单品",@"搭配"]];
        _segmentedControl.tintColor = [UIColor orangeColor];
        [_segmentedControl addTarget:self action:@selector(exchangeContent:)];
        
    }
    return _segmentedControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OGCollocationOnlyViewController * onlyViewController = [[OGCollocationOnlyViewController alloc] init];
    [self addChildViewController:onlyViewController];
    CGRect rect = onlyViewController.view.frame;
    rect.size.height -= 64;
    onlyViewController.view.frame = rect;

    [self.contentScrollView addSubview:onlyViewController.view];
    onlyViewController.delegate = self;
    
    OGCollocationMoreViewController * moreViewController = [[OGCollocationMoreViewController alloc] init];
    moreViewController.delegate =self;
    [self addChildViewController:moreViewController];
    rect = moreViewController.view.frame;
    rect.origin.x = SCREEN_WIDTH;
    rect.size.height -= 64;
    moreViewController.view.frame = rect;
    [self.contentScrollView addSubview:moreViewController.view];
    
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*2.0f, 0);
    self.contentScrollView.pagingEnabled = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

#pragma mark - Action
//切换类型
- (void)exchangeContent:(VPTribeSegmentedControl *)sender {
    [self.contentScrollView setContentOffset:CGPointMake(sender.selectedIndex * SCREEN_WIDTH, self.contentScrollView.contentOffset.y) animated:YES];
    
}

- (IBAction)typeClassAction:(id)sender {
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/SCREEN_WIDTH;
    self.segmentedControl.selectedIndex = index;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - OGCollocationOnlyViewControllerDelegate
-(void)selectedWithInfo:(id)info viewController:(OGBaseViewController *)viewController{
    if (self.segmentedControl.selectedIndex == 0) {
        [self performSegueWithIdentifier:@"pushSchemeUnit" sender:info];

    }else{
        [self performSegueWithIdentifier:@"pushScheme" sender:info];

    }

}
#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController * viewController = [segue destinationViewController];
    if ([segue.identifier isEqualToString:@"pushScheme"]) {
        OGSchemeDetailViewController * v = (OGSchemeDetailViewController*)viewController;
        v.info =sender;
    }else if([segue.identifier isEqualToString:@"pushSchemeUnit"]){
        OGSchemeUnitViewController * v = (OGSchemeUnitViewController *)viewController;
        v.info =sender;
    }

}


@end
