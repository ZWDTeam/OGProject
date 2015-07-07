//
//  OGSchemeUnitViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/24.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGSchemeUnitViewController.h"
#import "OGSchemeUnitTableViewCell1.h"
#import "OGSchemeUnitTableViewCell2.h"
#import "OGTableSectionView.h"
#import "OGUnitCollectionView.h"
#import "OGLookCommentViewController.h"

@interface OGSchemeUnitViewController ()<UITableViewDataSource,UITableViewDelegate,OGUnitCollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong , nonatomic)UIImageView * headerImageView;
@property (strong , nonatomic)OGUnitCollectionView * tableViewFootView;
@property (strong , nonatomic)OGTableSectionView * sectionView;


@end

@implementation OGSchemeUnitViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"单品详情";
        
        UIBarButtonItem * bar1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"星星"] style:UIBarButtonItemStylePlain target:nil action:nil];
        UIBarButtonItem * bar2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"分享"] style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.rightBarButtonItems = @[bar1,bar2];

        if (!self.info) {
            self.info = @{@"headImage":@"home5.jpg",
                          @"oldPrice" :@"32142",
                          @"price"    :@"29999",
                          @"commentCount":@"213"};
        }

    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];


    
    self.tableView.tableHeaderView = self.headerImageView;
    self.tableView.tableFooterView = self.tableViewFootView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImageView *)headerImageView{
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.info[@"headImage"]]];
        _headerImageView.frame =CGRectMake(0, 0, SCREEN_WIDTH, 150);
        _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headerImageView.clipsToBounds = YES;
    }
    return _headerImageView;
}

- (OGTableSectionView *)sectionView{
        _sectionView = [[[NSBundle mainBundle] loadNibNamed:@"OGTableSectionView" owner:self options:nil] lastObject];
    return _sectionView;
}

- (OGUnitCollectionView *)tableViewFootView{
    if (!_tableViewFootView) {
        _tableViewFootView = [[OGUnitCollectionView alloc] initWithDelegate:self withMembers:@[@"dp1.png",@"dp2.png",@"dp3.png",@"dp4.png"]];
    }
    return _tableViewFootView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            static NSString * identifier = @"OGSchemeUnitTableViewCell1";
            OGSchemeUnitTableViewCell1 * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            cell.oldPriceLabel.text = _info[@"oldPrice"];
            cell.newsPriceLabel.text = _info[@"price"];
            return cell;
            
        }
            break;
            
        default:
        {
            static NSString * identifier = @"OGSchemeUnitTableViewCell2";
            OGSchemeUnitTableViewCell2 * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            cell.commentCountLabel.text = [NSString stringWithFormat:@"评价数:%@",_info[@"commentCount"]];
            return cell;

        }
            break;
    }
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    OGTableSectionView * view = self.sectionView;
    view.titleLabel.text = @"20平米左右的小户型客厅方案";
    
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    OGTableSectionView * view = self.sectionView;
    view.titleLabel.text = @"搭配单品";
    view.heightLightLabel.hidden = YES;
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        OGLookCommentViewController * commentVC = [[OGLookCommentViewController alloc]init];
        
        [self.navigationController pushViewController:commentVC animated:YES];

    }
   
}

#pragma mark - OGUnitCollectionViewDelegate
- (void)selectedIndexPath:(NSIndexPath *)indexPath{

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
