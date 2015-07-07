//
//  OGMyselfViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/15.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGMyselfViewController.h"
#import "MyselfHeaderView.h"
#import "OGMyselfTableViewCell.h"

@interface OGMyselfViewController ()<UITableViewDataSource,UITableViewDelegate,MyselfHeaderViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong , nonatomic)MyselfHeaderView * headerView;
@property (strong , nonatomic)NSArray * items;

@end

@implementation OGMyselfViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"我的";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的"
                                                        image:[UIImage imageNamed:@"我的00"]
                                                selectedImage:[UIImage imageNamed:@"我的01"]];
        
        _items = @[@"我的关注",@"我的收藏",@"我的需求",@"设置"];
        
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarSelectedIndex:) name:tabbar_selectedIndex_notification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarSelectedIndex:) name:login_notification object:nil];
        
    }
    return self;
    
}

#pragma mark - 点击tabbar触发通知
- (void)tabBarSelectedIndex:(NSNumber *)selectedIndex{
    if (ex_identityType == OGIdentityTypeUser) {
        _items = @[@"我的关注",@"我的收藏",@"我的需求",@"设置"];
        self.headerView.backImageView.hidden = YES;
        self.headerView.backgroundColor = [UIColor clearColor];
        [self.tableView reloadData];
        
    }else if (ex_identityType == OGIdentityTypeStylist){
        self.headerView.backImageView.hidden = NO;
        self.headerView.backgroundColor = [UIColor blackColor];
        _items = @[@"我的作品",@"我的订单",@"我的关注",@"我的收藏",@"设置"];
        [self.tableView reloadData];

    }
}

- (NSArray *)items{
    if (ex_identityType == OGIdentityTypeUser) {
        
        _items = @[@"我的关注",@"我的收藏",@"我的需求",@"设置"];
    }else{
        _items = @[@"我的作品",@"我的订单",@"我的关注",@"我的收藏",@"设置"];
    }
    
    return _items;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.headerView;
}

- (MyselfHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[[NSBundle mainBundle] loadNibNamed:@"MyselfHeaderView" owner:self options:nil] lastObject];
        _headerView.frame =CGRectMake(0, 0, MainView_Width, 170);
        _headerView.delegate =self;
    }
    return _headerView;
}

#pragma mark - MyselfHeaderViewDelegate
- (void)selectedHeaderView:(MyselfHeaderView *)headerView{

    [self performSegueWithIdentifier:@"pushUserInfoView" sender:headerView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"OGMyselfTableViewCell";
    OGMyselfTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.titleLabel.text = self.items[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    if (ex_identityType == OGIdentityTypeStylist && indexPath.row ==4) {
        [self performSegueWithIdentifier:@"pushSetingView" sender:indexPath];
        return;
    }
    
    if (indexPath.row <2) {
        
        return;
    }
    
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"pushMyAttentionView" sender:indexPath];
            break;
        case 1:
            [self performSegueWithIdentifier:@"pushMyRepositoryView" sender:indexPath];

            break;
        case 2:
            [self performSegueWithIdentifier:@"pushMyNeedView" sender:indexPath];

            break;
        case 3:
            [self performSegueWithIdentifier:@"pushSetingView" sender:indexPath];

            break;
            
        default:
            break;
    }
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
