//
//  OGHomeLayout.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGHomeLayout.h"

@implementation OGHomeLayout



-(void)prepareLayout
{
    [super prepareLayout];
    
    self.sectionInset=UIEdgeInsetsMake(5,7, 5,7);
    
    self.delegate = (id <OGHomeLayoutDelegate> )self.collectionView.delegate;
    
    CGSize size = self.collectionView.frame.size;
    _cellCount = [[self collectionView] numberOfItemsInSection:0];
    _center = CGPointMake(size.width /2.0, size.height / 2.0);
    
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath  withIndex:(int)index
{
    CGSize itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    
    
    CGFloat itemHeight = itemSize.height;
    CGFloat itemWidth = itemSize.width;
    
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    
    
    if (_isRight) {
        x=self.sectionInset.left;
        rightY+=self.sectionInset.top;
        attributes.frame = CGRectMake(x, rightY, itemWidth, itemHeight);
        rightY+=itemHeight;
        if (rightY > leftY) {
            _isRight = false;
        }
    }else{
        x =(itemWidth+self.sectionInset.left*2);
        leftY+=self.sectionInset.top;
        attributes.frame = CGRectMake(x, leftY, itemWidth, itemHeight);
        leftY+=itemHeight;
        if (leftY >=rightY) {
            _isRight = true;
        }
        
    }
    
    return attributes;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    x=0;
    leftY=0;
    rightY=0;
    _isRight = true;
    
    UICollectionViewLayoutAttributes * headerAttribute = [[super layoutAttributesForElementsInRect:rect] lastObject];
    
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForHeaderInSection:)]) {
        CGSize size = [self.delegate collectionView:self.collectionView layout:self.collectionView.collectionViewLayout referenceSizeForHeaderInSection:headerAttribute.indexPath.section];
        
        leftY =self.sectionInset.top + size.height;
        rightY =self.sectionInset.top + size.height;
    }
    
    NSMutableArray* attributes = [NSMutableArray array];
    
    for (int i=0 ; i <self.cellCount; i++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:headerAttribute.indexPath.section];
        
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath withIndex:i]];
    }
    
    if ([[headerAttribute representedElementKind] isEqualToString:UICollectionElementKindSectionHeader]) {
        [attributes addObject:headerAttribute];
    }
    
    return attributes;
}


- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForInsertedItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
    attributes.center = CGPointMake(_center.x,_center.y);
    return attributes;
}

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDeletedItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
    attributes.center = CGPointMake(_center.x,_center.y);
    attributes.transform3D = CATransform3DMakeScale(0.1, 0.1,1.0);
    return attributes;
}


@end
