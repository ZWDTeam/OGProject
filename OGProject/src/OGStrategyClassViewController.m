//
//  OGStrategyClassViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/26.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGStrategyClassViewController.h"
#import "OGLookSchemeTableViewCell.h"

@interface OGStrategyClassViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation OGStrategyClassViewController


- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"软装攻略";
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
}


#pragma  mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"OGLookSchemeTableViewCell";
    OGLookSchemeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
        cell.detailContentLabel.hidden  = YES;
        cell.styleLabel.textColor = [UIColor grayColor];
    }
    
    cell.headerImageView.image = [UIImage imageNamed:@"home1.jpg"];
    cell.titleLabel.text = @"欧工家装";
    cell.styleLabel.text = @"2015-06-23";//时间label
    cell.userImageView.image = [UIImage imageNamed:@"mm4.jpg"];
    cell.lookCountLabel.text = @"1023";
    cell.commentCountLabel.text = @"342";
    cell.priceLabel.text = @"搭配总价: ￥45300";
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 188.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"OGStrategyDetailViewController" sender:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
