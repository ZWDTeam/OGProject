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

@interface OGMyselfViewController ()<UITableViewDataSource,UITableViewDelegate>

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
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.headerView;
}

- (MyselfHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[[NSBundle mainBundle] loadNibNamed:@"MyselfHeaderView" owner:self options:nil] lastObject];
    }
    return _headerView;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"OGMyselfTableViewCell";
    OGMyselfTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.titleLabel.text = _items[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
