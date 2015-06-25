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

@interface OGCollocationViewController ()<UIScrollViewDelegate,OGCollocationOnlyViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegmentedControl;

@end

@implementation OGCollocationViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"搭配购";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"搭配购"
                                                        image:[UIImage imageNamed:@"搭配购00"]
                                                selectedImage:[UIImage imageNamed:@"搭配购01"]];
    }
    return self;
    
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
    [self addChildViewController:moreViewController];
    rect = moreViewController.view.frame;
    rect.origin.x = SCREEN_WIDTH;
    rect.size.height -= 64;
    moreViewController.view.frame = rect;
    [self.contentScrollView addSubview:moreViewController.view];
    
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*2.0f, 0);
    self.contentScrollView.pagingEnabled = YES;
}

#pragma mark - Action
//切换类型
- (IBAction)selectedStyleAction:(UISegmentedControl *)sender {
    [self.contentScrollView setContentOffset:CGPointMake(sender.selectedSegmentIndex * SCREEN_WIDTH, self.contentScrollView.contentOffset.y) animated:YES];
}

- (IBAction)typeClassAction:(id)sender {
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/SCREEN_WIDTH;
    self.mySegmentedControl.selectedSegmentIndex = index;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - OGCollocationOnlyViewControllerDelegate
-(void)selectedWithInfo:(id)info viewController:(OGBaseViewController *)viewController{
    [self performSegueWithIdentifier:@"pushDetailView" sender:nil];

}
#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}


@end
