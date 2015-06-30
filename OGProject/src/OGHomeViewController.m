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
#import "OGDemandDetailsViewController.h"
#import "OGMapViewController.h"


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
        self.title = @"欧工软装";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页"
                                                        image:[UIImage imageNamed:@"首页00"]
                                                selectedImage:[UIImage imageNamed:@"首页01"]];
        
        _array = [@[[NSValue valueWithCGSize:CGSizeMake(iPhone_scale(150), iPhone_scale(180))],
                    [NSValue valueWithCGSize:CGSizeMake(iPhone_scale(150), iPhone_scale(115))],
                    [NSValue valueWithCGSize:CGSizeMake(iPhone_scale(150), iPhone_scale(115))],
                    [NSValue valueWithCGSize:CGSizeMake(iPhone_scale(150), iPhone_scale(150))],
                    [NSValue valueWithCGSize:CGSizeMake(iPhone_scale(150), iPhone_scale(95))]
                    ] mutableCopy];
        
        
        _items = @[@{@"title" :@"找设计师",
                     @"color" :[UIColor colorWithRed:89.0f/255.0f green:105.0f/255.0f blue:174.0f/255.0f alpha:1.0f]},
                   @{@"title" :@"看攻略",
                     @"color" :[UIColor colorWithRed:255.0f/255.0f green:70.0f/255.0f blue:151.0f/255.0f alpha:1.0f]},
                   @{@"title" :@"亲体验",
                     @"color" :[UIColor colorWithRed:161.0f/255.0f green:132.0f/255.0f blue:190.0f/255.0f alpha:1.0f]},
                   @{@"title" :@"找方案",
                     @"color" :[UIColor colorWithRed:241.0f/255.0f green:202.0f/255.0f blue:75.0f/255.0f alpha:1.0f]},
                   @{@"title" :@"我是设计师",
                     @"color" :[UIColor colorWithRed:247.0f/255.0f green:85.0f/255.0f blue:13.0f/255.0f alpha:1.0f]}];

        
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
    
    if (!ex_identityType) {
        [self performSelector:@selector(optionCity:) withObject:self afterDelay:0.1];
    }
    
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (ex_locationCity) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:ex_locationCity style:UIBarButtonItemStylePlain target:self action:@selector(optionCity:)];
        
    }else{
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"定位"] style:UIBarButtonItemStylePlain target:self action:@selector(optionCity:)];
    }
}

#pragma mark - 选择城市
- (void)optionCity:(UIBarButtonItem *)item{
    [self performSegueWithIdentifier:@"optionCity" sender:nil];
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
    
    cell.imageView.image= [UIImage imageNamed:_items[indexPath.row][@"title"]];
    
    cell.titleLabel.text = _items[indexPath.row][@"title"];
    
    cell.contentBkView.backgroundColor = _items[indexPath.row][@"color"];
    
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
            
            [self performSegueWithIdentifier:@"pushMapViewController" sender:indexPath];
            break;
        case 1://看攻略

            [self performSegueWithIdentifier:@"pushLookStrategy" sender:indexPath];
            break;
        case 2://亲体验
            
            [self performSegueWithIdentifier:@"pushMapViewController" sender:indexPath];
            break;

        case 3://找方案
            
            [self performSegueWithIdentifier:@"pushSchemeView" sender:indexPath];
            break;

        case 4://我是设计师

            [self performSegueWithIdentifier:@"pushStylistView" sender:indexPath];
            break;
            
        default:
            break;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

#pragma  mark - Action
- (IBAction)callUpAction:(UIBarButtonItem *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://400"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"pushMapViewController"]) {
        OGMapViewController * viewController = [segue destinationViewController];
        NSIndexPath * indexPath = (NSIndexPath *)sender;
        
        if (indexPath.row == 0) {
            viewController.showType = MapShowTypePeople;
        }else if (indexPath.row ==2)
            viewController.showType = MapShowTypeHouse;

    }
}


@end
