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

@property (strong , nonatomic)VPStretchBaseView * header;

@end

@implementation OGStrategyDetailViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"攻略详情";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];


    VPStretchBaseView * view = [[[NSBundle mainBundle] loadNibNamed:@"VPStretchBaseView" owner:self options:nil] lastObject];
    view.headerImageView.image = [UIImage imageNamed:@"mm14.jpg"];
    
    _header = [DGExpandheader expandWithScrollView:_tableView expandView:view];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2 +3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            static NSString * identifier = @"OGStrategyTitleTableViewCell";
            OGStrategyTitleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
            }
            
            cell.contentLabel.text = @"匆匆那年（电影《匆匆那年》主题曲\n 作词：林夕 \n作曲：梁翘柏 \n演唱：王菲 \n匆匆那年我们 \n究竟说了几遍 再见之后再拖延 \n 可惜谁有没有 爱过不是一场 \n七情上面的雄辩匆匆那年我们 \n 一时匆忙撂下  \n 难以承受的诺言 只有等别人兑现";
            return cell;

        }
            break;
        case 1:{
            static NSString * identifier = @"OGStrategyImageTableViewCell";
            OGStrategyImageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
            }
            return cell;

            
        }
            
            break;
            
        default:
            break;
    }
    
    static NSString * identifier = @"OGStrategyCommentTableViewCell";
    OGStrategyCommentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
    }
    
    cell.contentLabel.text = @"匆匆那年（电影《匆匆那年》主题曲 作词：林夕 作曲：梁翘柏演唱：王菲 匆匆那年我们 究竟说了几遍 再见之后再拖延 可惜谁有没有 爱过不是一场 七情上面的雄辩匆匆那年我们 一时匆忙撂下 难以承受的诺言 只有等别人兑现";
    cell.headerImageView.image = [UIImage imageNamed:@"mm5.jpg"];
    cell.nameLabel.text = @"迪哥";
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
