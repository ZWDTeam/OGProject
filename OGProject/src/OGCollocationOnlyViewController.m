//
//  OGCollocationOnlyViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/16.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGCollocationOnlyViewController.h"
#import "SGFocusImageFrame.h"
#import "SGFocusImageItem.h"
#import "OGCollocationFlowLayout.h"
#import "OGCollocationCollectionViewCell.h"
#import "OGCollocationViewController.h"

NSString *const collectionViewCellIdentifier = @"OGCollocationCollectionViewCell";

@interface OGCollocationOnlyViewController ()<SGFocusImageFrameDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong , nonatomic) SGFocusImageFrame *bannerView;
@property (strong , nonatomic) NSMutableArray * headerDatas;
@property (strong , nonatomic) UICollectionView * collectionView;


@end

@implementation OGCollocationOnlyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * pathString = [[NSBundle mainBundle] pathForResource:@"homeHeaderModel" ofType:@"plist"];
    NSArray * array = [NSArray arrayWithContentsOfFile:pathString];
    _headerDatas  = [[NSMutableArray alloc] initWithArray:array];
    [_headerDatas addObject:array[0]];
    [_headerDatas insertObject:array[array.count-1] atIndex:0];
    
    OGCollocationFlowLayout * layout = [OGCollocationFlowLayout new];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
    _collectionView.alwaysBounceVertical = YES;
    
    UINib * nib = [UINib nibWithNibName:collectionViewCellIdentifier bundle:[NSBundle mainBundle]];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:collectionViewCellIdentifier];
    
    [self.view addSubview:_collectionView];
    
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
        [self.collectionView addSubview:self.bannerView];
        
    }
    return _bannerView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    OGCollocationCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifier forIndexPath:indexPath];
    NSString * imageName = [NSString stringWithFormat:@"home%ld.jpg",indexPath.row+1];
    cell.contentImageView.image = [UIImage imageNamed:imageName];
    
    return cell;
}

#pragma mark - SGFocusImageFrameDelegate
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame tapGesItem:(NSInteger)index{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.detailDelegate BaseViewIndexDetail:[NSString stringWithFormat:@"%@",indexPath]];
    //页面跳转 省
   // [self performSegueWithIdentifier:@"detailView" sender:indexPath];
//    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main.storyBoard" bundle:nil];
//    UIViewController *vc = [story instantiateViewControllerWithIdentifier:@"填写ViewController在故事板中设置的identifier"];
//    [self.navigationController pushViewController:vc animated:YES];

}

//- (void)returnDelegateDetail:(NSString*)delegateDetail;
//{
//
//}
#pragma mark - Navigation

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}


@end
