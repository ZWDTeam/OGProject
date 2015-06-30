//
//  OGLooSchemeViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGLooSchemeViewController.h"
#import "OGLookSchemeTableViewCell.h"
#import "VPTribeSegmentedControl.h"
#import "OGSchemeMenuView.h"

#define title @"title"
#define headerImage @"headerImage"
#define lookCount @"lookCount"
#define commentCount @"commentCount"
#define type @"type"
#define style @"style"
#define imageName @"image"
#define price @"price"

@interface OGLooSchemeViewController ()<UITableViewDataSource,UITableViewDelegate,OGSchemeMenuViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong , nonatomic)UITableView * tableView1;
@property (strong , nonatomic)NSMutableArray * schemes;
@property (strong , nonatomic)VPTribeSegmentedControl * segmentedControl;
@property (weak, nonatomic) IBOutlet VPTribeSegmentedControl *tpyeSegmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *rightBarBtn;
@property (strong , nonatomic)OGSchemeMenuView * menuView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong , nonatomic)NSArray * items;

@property (strong , nonatomic)NSArray *arr;

@property (strong , nonatomic)NSArray * arr1;

@end

@implementation OGLooSchemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _schemes = [NSMutableArray array];
    
    self.navigationItem.titleView =self.segmentedControl;
    
    self.tpyeSegmentedControl.items = @[@"风格",@"户型",@"颜色",@"预算"];
    self.tpyeSegmentedControl.isExchangeItemColor = YES;
    self.tpyeSegmentedControl.selectedIndex = 0;
    [self.tpyeSegmentedControl addTarget:self action:@selector(exchaneSortType:)];
    
    self.rightBarBtn.layer.cornerRadius = CGRectGetHeight(self.rightBarBtn.frame)/2.0f;
    self.rightBarBtn.layer.borderWidth = 1.0f;
    self.rightBarBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *2.0f, 0);
    
    
    CGRect rect = _scrollView.bounds;
    rect.origin.x = SCREEN_WIDTH;
    _tableView1 = [[UITableView alloc] initWithFrame:rect];
    _tableView1.delegate =self;
    _tableView1.dataSource =self;
    [self.scrollView addSubview:_tableView1];
}


- (NSArray *)items{
    
    if (self.segmentedControl.selectedIndex ==0) {
        return self.arr;
    }else{
        return self.arr1;
    }
}

- (NSArray *)arr{
    if (!_arr) {
        NSString * stringPath = [[NSBundle mainBundle] pathForResource:@"OGSchemeModel1" ofType:@"plist"];
        _arr = [NSArray arrayWithContentsOfFile:stringPath];
    }
    return _arr;
}

- (NSArray *)arr1{
    if (!_arr1) {
        NSString * stringPath =[[NSBundle mainBundle] pathForResource:@"OGSchemeModel1" ofType:@"plist"];
        _arr1 = [NSArray arrayWithContentsOfFile:stringPath];
    }
    return _arr1;
}

- (VPTribeSegmentedControl *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [[VPTribeSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 200, 45) withItems:@[@"配图设计",@"样板图"]];
        _segmentedControl.tintColor = [UIColor orangeColor];
        [_segmentedControl addTarget:self action:@selector(exchangeContent:)];
        
    }
    return _segmentedControl;
}

- (OGSchemeMenuView *)menuView{
    if (!_menuView) {
        _menuView =  [[OGSchemeMenuView alloc] initWithDelegate:self withItems:nil];
        _menuView.origin = CGPointMake(0, 98);
    }
    return _menuView;
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;{
    NSInteger index = scrollView.contentOffset.x/SCREEN_WIDTH;
    _segmentedControl.selectedIndex = index;
}

#pragma mark - segmentedControl Action
//切换类型
- (void)exchangeContent:(VPTribeSegmentedControl *)segmentedControl{
    [self.scrollView setContentOffset:CGPointMake(segmentedControl.selectedIndex * SCREEN_WIDTH, 0) animated:YES];
}

//切换排序方式
- (void)exchaneSortType:(VPTribeSegmentedControl *)segmentedControl{

    switch (segmentedControl.selectedIndex) {
        case 0:
            self.menuView.items = @[@"全部",@"现代",@"简介",@"韩式",@"地中海",@"欧式"];
            break;
        case 1:
            self.menuView.items = @[@"一居室",@"别墅",@"复式楼",@"客厅",@"两居室"];

            break;
        case 2:
            self.menuView.items = @[@"红色",@"黑色",@"灰色",@"彩色",@"粉色",@"蓝色",@"棕色",@"白色"];

            break;
        case 3:
            self.menuView.items = @[@"<=4万",@"4万～10万",@"10万～15万",@"15万～20万",@">=20万"];

            break;


            
        default:
            break;
    }
    
    [_menuView showInView:self.view];

}

//发布需求
- (IBAction)sendNeed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"PushSendHelpView" sender:nil];
}

#pragma mark - OGSchemeMenuViewDelegate
- (void)selectedMenuView:(OGSchemeMenuView *)menuView withIndexPath:(NSIndexPath *)indexPath{
    [self.menuView dismiss];
}

#pragma  mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (self.segmentedControl.selectedIndex ==0) {
        return self.arr.count;
    }else{
        return self.arr1.count;
    }

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString * identifier = @"OGLookSchemeTableViewCell";
    OGLookSchemeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
    }
    NSDictionary * dic ;
    if (self.segmentedControl.selectedIndex ==0) {
        dic = self.arr[indexPath.row];
    }else{
        dic = self.arr1[indexPath.row];
    }

    cell.priceLabel.text =[NSString stringWithFormat:@"总价格: ¥%@",dic[price]];
    cell.commentCountLabel.text =dic[commentCount];
    cell.lookCountLabel.text =dic[lookCount];
    cell.titleLabel.text =dic[title];
    cell.styleLabel.text = dic[style];
    cell.detailContentLabel.text =dic[type];
    cell.headerImageView.image = [UIImage imageNamed:dic[imageName]];
    cell.userImageView.image =[UIImage imageNamed:dic[headerImage]];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 188.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"pushSchemeDetailView" sender:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
