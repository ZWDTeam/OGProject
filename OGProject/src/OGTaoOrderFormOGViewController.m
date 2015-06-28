//
//  OGTaoOrderFormOGViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/28.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGTaoOrderFormOGViewController.h"
#import "VPTribeSegmentedControl.h"
#import "OGTaoOrderFormTableViewCell.h"
#import "OrderFormInfo.h"
#import "OGSchemeMenuView.h"
#import "OGDemandDetailsViewController.h"

@interface OGTaoOrderFormOGViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet VPTribeSegmentedControl *tpyeSegmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong , nonatomic)OGSchemeMenuView * menuView;


@property (strong , nonatomic)NSArray * items;

@end

@implementation OGTaoOrderFormOGViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"淘订单";
        OrderFormInfo * info1 = [OrderFormInfo new];
        info1.headerImageString = @"7-图";
        info1.address = @"北京海淀区";
        info1.style = @"三室两厅";
        info1.area = @"123 mm";
        info1.title = @"想要找个好的设计";
        
        OrderFormInfo * info2 = [OrderFormInfo new];
        info2.headerImageString = @"7-图";
        info2.address = @"长沙雨花区";
        info2.style = @"三室两厅";
        info2.area = @"123 mm";
        info2.title = @"性价比高点就好";
        
        OrderFormInfo * info3 = [OrderFormInfo new];
        info3.headerImageString = @"7-图";
        info3.address = @"广州白云区";
        info3.style = @"三室两厅";
        info3.area = @"123 mm";
        info3.title = @"一分钱,一分货";

        _items = @[info1,info2,info3];

    }
    return self;
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tpyeSegmentedControl.items = @[@"风格",@"户型",@"颜色",@"预算"];
    self.tpyeSegmentedControl.isExchangeItemColor = YES;
    self.tpyeSegmentedControl.selectedIndex = 0;
    [self.tpyeSegmentedControl addTarget:self action:@selector(exchaneSortType:)];
    
}

- (OGSchemeMenuView *)menuView{
    if (!_menuView) {
        _menuView =  [[OGSchemeMenuView alloc] initWithDelegate:self withItems:nil];
        _menuView.origin = CGPointMake(0, 98);
    }
    return _menuView;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"OGTaoOrderFormTableViewCell";
    OGTaoOrderFormTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    OrderFormInfo *info = self.items[indexPath.row];
    
    cell.headerImageView.image = [UIImage imageNamed:info.headerImageString];
    cell.titleLabel.text = info.title;
    cell.detailTypeLabel.text = [NSString stringWithFormat:@"%@ %@",info.style,info.area];
    cell.addressLabel.text = info.address;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return CGRectGetHeight(cell.frame);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OGDemandDetailsViewController * DetailVC = [[OGDemandDetailsViewController alloc]init];
    [self.navigationController pushViewController:DetailVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - OGSchemeMenuViewDelegate
- (void)selectedMenuView:(OGSchemeMenuView *)menuView withIndexPath:(NSIndexPath *)indexPath{
    [self.menuView dismiss];
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
