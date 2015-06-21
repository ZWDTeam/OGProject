//
//  DGMKAninotationView.h
//  AutoLayout
//
//  Created by 钟伟迪 on 15/6/12.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <MapKit/MapKit.h>

@class DGAnnotationContentView;
@interface DGMKAninotationView : MKAnnotationView

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier withColor:(UIColor *)color;

@property (strong , nonatomic)DGAnnotationContentView * contentView;

@property (strong , nonatomic)UIImageView * headerImageView;

@property (strong , nonatomic)UILabel * titleLabel;

@end

@interface DGAnnotationContentView : UIView;


@end