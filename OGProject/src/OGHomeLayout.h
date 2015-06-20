//
//  OGHomeLayout.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol OGHomeLayoutDelegate <UICollectionViewDelegateFlowLayout>
@required

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
@optional

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section;


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section;


@end

@interface OGHomeLayout : UICollectionViewFlowLayout
{
    float x;
    
    float leftY;
    
    float rightY;
    
    bool _isRight;
}

@property (nonatomic,assign) CGPoint center;

@property (nonatomic,assign) CGFloat radius;

@property (nonatomic,assign) NSInteger cellCount;


@property (nonatomic,weak) id <OGHomeLayoutDelegate> delegate;


@end
