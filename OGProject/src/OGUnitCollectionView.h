//
//  OGUnitCollectionView.h
//  OGProject
//
//  Created by 钟伟迪 on 15/6/24.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  OGUnitCollectionViewDelegate<NSObject>

- (void)selectedIndexPath:(NSIndexPath *)indexPath;

@end

@interface OGUnitCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>

- (id)initWithDelegate:(id)delegate withMembers:(NSArray *)members;

@property (strong , nonatomic ,readonly)NSArray * members;

@property (weak , nonatomic)id<OGUnitCollectionViewDelegate> selectedDelegate;

@end
