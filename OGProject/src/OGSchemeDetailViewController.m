//
//  OGSchemeDetailViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/23.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGSchemeDetailViewController.h"
#import "OGSchemeTableViewCell.h"
#import "OGSchemeMenuView.h"
#import "DGExpandheader.h"
#import "VPStretchBaseView.h"

@interface OGSchemeDetailViewController ()<UITableViewDataSource ,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation OGSchemeDetailViewController{
    DGExpandheader * _header;

}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"整体方案";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    VPStretchBaseView * view = [[[NSBundle mainBundle] loadNibNamed:@"VPStretchBaseView" owner:self options:nil] lastObject];
    view.headerImageView.image = [UIImage imageNamed:@"mm14.jpg"];
    
  _header = [DGExpandheader expandWithScrollView:_tableView expandView:view];
    
    
//    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            static NSString * identifier = @"OGSchemeTableViewCell";
            OGSchemeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            }

            return cell;

        }
            break;
            
            case 1:
        {
            static NSString * identifier = @"OGSchemeSecondTableViewCell";
            OGSchemeSecondTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

            }
            
            return cell;
        }
            
            break;
            
        case 2:{
            static NSString * identifier = @"OGSchemeThreeTableViewCell";
            OGSchemeThreeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[OGSchemeThreeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

            }
            
            return cell;
        }
            break;
            
        default:{
            static NSString * identifier = @"OGSchemeImagesTableViewCell";
            OGSchemeImagesTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
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
    if (indexPath.row ==2) {
        OGLookCommentViewController * commentVC = [[OGLookCommentViewController alloc]init];
        
        [self.navigationController pushViewController:commentVC animated:YES];
        return;
    }
    
    if (indexPath.row >=3) {
        [self performSegueWithIdentifier:@"pushNnitViewController" sender:indexPath];
    }
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
