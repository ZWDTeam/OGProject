//
//  OGStrategyDetailViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/26.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGStrategyDetailViewController.h"
#import "VPStretchBaseView.h"
#import "DGExpandheader.h"
#import "OGStrategyCommentTableViewCell.h"
#import "OGStrategyTitleTableViewCell.h"
#import "OGStrategyImageTableViewCell.h"

@interface OGStrategyDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong , nonatomic)NSArray * comments;

@property (strong , nonatomic)VPStretchBaseView * header;

@end

@implementation OGStrategyDetailViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"攻略详情";
        _comments = @[@{@"image"   :@"mm4.jpg",
                        @"content" :@"感觉说的挺有道理的",
                        @"name"    :@"ben"},
                      @{@"image"   :@"gg4.jpg",
                        @"content" :@"我比较喜欢这种调调!!!",
                        @"name"    :@"大康"},
                      @{@"image"   :@"mm14.jpg",
                        @"content" :@"不晓得多钱钱可以拿下😄",
                        @"name"    :@"小敏"},
                      ];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    VPStretchBaseView * view = [[[NSBundle mainBundle] loadNibNamed:@"VPStretchBaseView" owner:self options:nil] lastObject];
    view.image = [UIImage imageNamed:_info[@"contentImage"]];
    CGRect rect = view.frame;
    rect.size.width = MainView_Width;
    view.frame = rect;
    
    _header = [DGExpandheader expandWithScrollView:_tableView expandView:view];

    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
}


- (void)viewDidLayoutSubviews{

}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2 +_comments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            static NSString * identifier = @"OGStrategyTitleTableViewCell";
            OGStrategyTitleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            cell.contentLabel.text =_info[@"content"];
            cell.titleLabel.text = _info[@"title"];
            return cell;

        }
            break;
        case 1:{
            static NSString * identifier = @"OGStrategyImageTableViewCell";
            OGStrategyImageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

            }
            return cell;

            
        }
            
            break;
            
        default:
            break;
    }
    
    //评论信息
    static NSString * identifier = @"OGStrategyCommentTableViewCell";
    OGStrategyCommentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    
    NSDictionary * dic = _comments[indexPath.row-2];
    cell.contentLabel.text = dic[@"content"];
    cell.headerImageView.image = [UIImage imageNamed:dic[@"image"]];
    cell.nameLabel.text = dic[@"name"];
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return CGRectGetHeight(cell.frame);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
