//
//  OGUnitCollectionView.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/24.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGUnitCollectionView.h"
#import "OGBaseViewController.h"
#import "OGUnitCollectionViewCell.h"

@implementation OGUnitCollectionView{

UICollectionViewFlowLayout * _flowLayout;

}

NSString * const cellRowIdentifier = @"OGUnitCollectionViewCell";


- (id)initWithDelegate:(id)delegate withMembers:(NSArray *)members{
    _flowLayout =[UICollectionViewFlowLayout new];
    _flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH - kPercenX_scale(30))/2.0f,125);
    _flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 5, 10);
    _flowLayout.minimumInteritemSpacing = 5;
    _flowLayout.minimumLineSpacing = 0;
    
    NSInteger index = members.count/2;
    if (members.count%2)index +=1;
    float collectionViewHeight = (_flowLayout.itemSize.height + _flowLayout.minimumLineSpacing)*index + _flowLayout.sectionInset.top + _flowLayout.sectionInset.bottom;
    
    
    self = [[OGUnitCollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, collectionViewHeight) collectionViewLayout:_flowLayout];
    
    self.selectedDelegate = delegate;
    _members =members;
    
    UINib *nib = [UINib nibWithNibName:cellRowIdentifier bundle:[NSBundle mainBundle]];
    
    [self registerNib:nib forCellWithReuseIdentifier:cellRowIdentifier];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate =self;
        self.dataSource = self;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.members.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    OGUnitCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellRowIdentifier forIndexPath:indexPath];
    cell.headerImageView.image = [UIImage imageNamed:_members[indexPath.row]];
    cell.titleLabel.text = @"欧珀";
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [self.selectedDelegate selectedIndexPath:indexPath];
}
@end
