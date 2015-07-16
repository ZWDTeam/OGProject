//
//  OGExperienceDetailViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/27.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGExperienceDetailViewController.h"
#import "OGExprienceTableViewCell1.h"
#import "OGExprienceTableViewCell2.h"
#import "OGTableSectionView.h"


@interface OGExperienceDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong , nonatomic)UIImageView * headerImageView;

@property (strong , nonatomic)OGTableSectionView * sectionView;

@property (strong , nonatomic)UITextView * footView;

@property (strong , nonatomic)NSString *tel;


@end

@implementation OGExperienceDetailViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"体验馆详情";
        self.tel = @"0731-3456789";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.headerImageView;
    self.tableView.tableFooterView = self.footView;
    self.footView.text = @"国际欧工以“为改变中国室内环境而不懈努力”为核心的企业使命，以“做最值得尊敬与信赖的整体软装”为宗旨，以有别于传统商业的O2O模式，致力于为设计师、软装企业、房地产等行业服务，专注于为别墅、会所、样板房、精装房和酒店等提供服务。让销售更简单、让设计风格模块化，这是我们的目标，也是我们正在做的，即集案例搜索、模拟搭配、产品展示、在线交易于一体的软装数据库平台，利用遍及全国的设计师团队和丰富的产品线资源，将终端客户与厂家直接对接，形成厂家、设计师、终端三点一线的软装产业链平台。这样就大幅度降低了成本，提高了产品性价比。";
    [self.footView sizeToFit];

}

- (UIImageView *)headerImageView{
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kPercenX_scale(150))];
        _headerImageView.image = [UIImage imageNamed:@"home17.jpg"];
        _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headerImageView.clipsToBounds = YES;
    }
    return _headerImageView;
}

- (OGTableSectionView *)sectionView{
    _sectionView = [[[NSBundle mainBundle] loadNibNamed:@"OGTableSectionView" owner:self options:nil] lastObject];
    return _sectionView;
}

- (UITextView *)footView{
    if (!_footView) {
        _footView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        _footView.userInteractionEnabled = NO;
        _footView.scrollEnabled = NO;
        _footView.textColor = [UIColor grayColor];
        _footView.font = [UIFont systemFontOfSize:17];
    }
    return _footView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
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
            static NSString * identifier = @"OGExprienceTableViewCell1";
            OGExprienceTableViewCell1 * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            cell.titleLabel.text = self.info[@"address"];
            cell.headerImageView.image = [UIImage imageNamed:@"10-地址"];
            return cell;
        }
        break;

        case 1:
        {
            static NSString * identifier = @"OGExprienceTableViewCell1";
            OGExprienceTableViewCell1 * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
            }
            cell.titleLabel.text = self.info[@"tel"];
            cell.headerImageView.image = [UIImage imageNamed:@"10-电话"];
            return cell;
        }

        break;
            
        default:
        {
            static NSString * identifier = @"OGExprienceTableViewCell2";
            OGExprienceTableViewCell2 * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

            }
            cell.payRangeLabel.text = @"长沙市 二环内";
            cell.styleLabel.text = @"复古清新风";
            return cell;
        }

            break;
    }
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return CGRectGetHeight(cell.frame);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==1) {
        NSString * tel = [NSString stringWithFormat:@"tel://%@",self.info[@"tel"]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:tel]];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    OGTableSectionView * view = self.sectionView;
    view.titleLabel.text = self.info[@"address"];
    
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    OGTableSectionView * view = self.sectionView;
    view.titleLabel.text = @"体验馆介绍";
    view.titleLabel.textColor = [UIColor orangeColor];
    view.heightLightLabel.hidden = YES;
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
