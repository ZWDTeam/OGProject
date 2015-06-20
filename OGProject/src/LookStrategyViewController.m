//
//  LookStrategyViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "LookStrategyViewController.h"
#import "OGLookStrategyCollectionViewCell.h"
#import "OGLookStrategyLayout.h"

NSString * const collectionCellIdentifier = @"OGLookStrategyCollectionViewCell";

@interface LookStrategyViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong , nonatomic)NSArray * array;

@end

@implementation LookStrategyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _array = @[@{@"title":@"中式复古风",
                 @"image":@"home1.jpg"},
               @{@"title":@"欧式格局",
                 @"image":@"home2.jpg"},
               @{@"title":@"美式瑞丽风",
                 @"image":@"home3.jpg"},
               @{@"title":@"法式风情",
                 @"image":@"home4.jpg"},
               @{@"title":@"泰式风情",
                 @"image":@"home5.jpg"},
                @{@"title":@"日式格调",
                   @"image":@"home6.jpg"},];
    
    OGLookStrategyLayout * layout =[OGLookStrategyLayout new];
    [_collectionView setCollectionViewLayout:layout];
    
    UINib *nib = [UINib nibWithNibName:collectionCellIdentifier bundle:[NSBundle mainBundle]];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:collectionCellIdentifier];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    OGLookStrategyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellIdentifier forIndexPath:indexPath];
    
    cell.headImageView.image = [UIImage imageNamed:_array[indexPath.row][@"image"]];
    cell.titleLabel.text = _array[indexPath.row][@"title"];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
