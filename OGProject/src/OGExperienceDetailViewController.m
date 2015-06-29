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
    self.footView.text = @"自盐城国家高新区正式挂牌后，盐都区加快对接“中国制造2015”规划纲要，突出发展新产业、新业态、新模式、新技术“四新”经济，紧盯深圳手机产业项目抱团转移机遇，加快智能终端（手机）产业园等平台建设，推动项目加快落户，目前，已签约落户智能终端（手机）产业研究院、华宇彩晶、泰奇科技、西特新能源、富勤精密电子等项目。";
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
        _footView.font = [UIFont systemFontOfSize:main_text_font];
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
            cell.titleLabel.text = @"开福区芙蓉北路伍家岭南111号";
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
            cell.titleLabel.text = self.tel;
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
        NSString * tel = [NSString stringWithFormat:@"tel://%@",self.tel];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:tel]];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    OGTableSectionView * view = self.sectionView;
    view.titleLabel.text = @"伍家岭南软装体验馆";
    
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
