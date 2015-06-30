//
//  OGCollocationMoreViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/16.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGCollocationMoreViewController.h"
#import "SGFocusImageFrame.h"
#import "SGFocusImageItem.h"
#import "OGCollocationFlowLayout.h"
#import "OGCollocationCollectionViewCell.h"
#import "OGCollocationViewController.h"

#define title @"title"
#define headerImage @"headerImage"
#define lookCount @"lookCount"
#define commentCount @"commentCount"
#define type @"type"
#define style @"style"
#define imageName @"image"
#define price @"price"


NSString *const collectionViewMoreCellIdentifier = @"OGCollocationCollectionViewCell";


@interface OGCollocationMoreViewController ()<SGFocusImageFrameDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong , nonatomic) SGFocusImageFrame *bannerView;
@property (strong , nonatomic) NSMutableArray * headerDatas;
@property (strong , nonatomic) UICollectionView * collectionView;
@property (strong , nonatomic)NSArray *arr;

@end

@implementation OGCollocationMoreViewController

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
    
    UINib * nib = [UINib nibWithNibName:collectionViewMoreCellIdentifier bundle:[NSBundle mainBundle]];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:collectionViewMoreCellIdentifier];
    
    [self.view addSubview:_collectionView];
    
    [self bannerView];
    
    [self.view addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    
    
}


- (NSArray *)arr{
    if (!_arr) {
        NSString * stringPath = [[NSBundle mainBundle] pathForResource:@"OGSchemeModel1" ofType:@"plist"];
        _arr = [NSArray arrayWithContentsOfFile:stringPath];
    }
    return _arr;
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

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"frame"]) {
        self.collectionView.frame = self.view.bounds;
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    OGCollocationCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewMoreCellIdentifier forIndexPath:indexPath];
    NSDictionary * dic = self.arr[indexPath.row];
    cell.headerImageView.image =[UIImage imageNamed:dic[headerImage]];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@  %@",dic[style],dic[type]];
    cell.commentLabel.text = dic[commentCount];
    return cell;
}

#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.delegate respondsToSelector:@selector(selectedWithInfo:viewController:)]) {
        [self.delegate selectedWithInfo:self.arr[indexPath.row] viewController:self];
    }
}



#pragma mark - SGFocusImageFrameDelegate
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame tapGesItem:(NSInteger)index{
    
}

- (void)dealloc{
    [self.view removeObserver:self forKeyPath:@"frame"];
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
