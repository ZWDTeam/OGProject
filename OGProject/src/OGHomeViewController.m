//
//  OGHomeViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/15.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGHomeViewController.h"
#import "OGHomeCollectionViewCell.h"
#import "OGHomeLayout.h"
#import "OGCollectionReusableView.h"

NSString * const cellIdentifer = @"OGHomeCollectionViewCell";

#define iPhone_scale(value) (value /(320.0f/[UIScreen mainScreen].bounds.size.width))


@interface OGHomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@property (strong , nonatomic)NSMutableArray * array;

@property (strong , nonatomic)NSArray * items;

@end

@implementation OGHomeViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"迪哥微博";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页"
                                                        image:[UIImage imageNamed:@"首页00"]
                                                selectedImage:[UIImage imageNamed:@"首页01"]];
        
        _array = [@[[NSValue valueWithCGSize:CGSizeMake(iPhone_scale(150), iPhone_scale(180))],
                    [NSValue valueWithCGSize:CGSizeMake(iPhone_scale(150), iPhone_scale(115))],
                    [NSValue valueWithCGSize:CGSizeMake(iPhone_scale(150), iPhone_scale(115))],
                    [NSValue valueWithCGSize:CGSizeMake(iPhone_scale(150), iPhone_scale(150))],
                    [NSValue valueWithCGSize:CGSizeMake(iPhone_scale(150), iPhone_scale(95))]
                    ] mutableCopy];
        
        
        _items = @[@"找设计师",@"看攻略",@"亲体验",@"找方案",@"我是设计师"];

        
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    OGHomeLayout *flowLayout = [OGHomeLayout new];
    
    [_myCollectionView setCollectionViewLayout:flowLayout];
    
    UINib * nib = [UINib nibWithNibName:cellIdentifer bundle:[NSBundle mainBundle]];
    [_myCollectionView registerNib:nib forCellWithReuseIdentifier:cellIdentifer];
    
    [_myCollectionView registerClass:[OGCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"OGCollectionReusableView"];
    

}


#pragma -mark UICollectionViewDelegate
//每个section的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _array.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionViews cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    OGHomeCollectionViewCell *cell = (OGHomeCollectionViewCell *)[collectionViews dequeueReusableCellWithReuseIdentifier:@"OGHomeCollectionViewCell" forIndexPath:indexPath];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    cell.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.5];
    
    cell.imageView.image= [UIImage imageNamed:_items[indexPath.row]];
    
    cell.titleLabel.text = _items[indexPath.row];
    
    return cell;
}

#pragma  mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(320, 150);
}

#pragma mark - UICollectionViewDataSource
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    OGCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"OGCollectionReusableView" forIndexPath:indexPath];
    headView.backgroundColor = [UIColor redColor];
    return headView;
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSValue * sizeValue = _array[indexPath.row];
    
    CGSize size = [sizeValue  CGSizeValue];
    
    return size;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,0, 0,0);
}


#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0://找设计师
            
            [self performSegueWithIdentifier:@"pushMapViewController" sender:nil];
            break;
        case 1://看攻略

            [self performSegueWithIdentifier:@"pushLookStrategy" sender:nil];
            break;
        case 2://亲体验
            
            [self performSegueWithIdentifier:@"pushExperience" sender:nil];
            break;

        case 3://找方案
            
            [self performSegueWithIdentifier:@"pushSchemeView" sender:nil];
            break;

        case 4://我是设计师

            [self performSegueWithIdentifier:@"pushStylistView" sender:nil];
            break;
            
        default:
            break;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

#pragma  mark - Action
- (IBAction)callUpAction:(UIBarButtonItem *)sender {
    
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
