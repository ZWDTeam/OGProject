//
//  OGStrategyClassViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/26.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGStrategyClassViewController.h"
#import "OGLookSchemeTableViewCell.h"
#import "OGStrategyDetailViewController.h"

@interface OGStrategyClassViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong , nonatomic)NSArray * items;

@end

@implementation OGStrategyClassViewController


- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"软装攻略";
        NSString * path = [[NSBundle mainBundle] pathForResource:@"strategyModel" ofType:@"plist"];
        _items = [NSArray arrayWithContentsOfFile:path];
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
}


#pragma  mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"OGLookSchemeTableViewCell";
    OGLookSchemeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
        cell.detailContentLabel.hidden  = YES;
        cell.styleLabel.textColor = [UIColor grayColor];
    }
    NSDictionary * dic = _items[indexPath.row];
    cell.headerImageView.image = [UIImage imageNamed:dic[@"contentImage"]];
    cell.titleLabel.text = dic[@"name"];
    cell.styleLabel.text = dic[@"time"];//时间label
    cell.userImageView.image = [UIImage imageNamed:dic[@"headerImage"]];
    cell.lookCountLabel.text = [NSString stringWithFormat:@"%d",arc4random()%1024];
    cell.commentCountLabel.text = [NSString stringWithFormat:@"%d",arc4random()%1024];
    cell.priceLabel.text = dic[@"title"];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return CGRectGetHeight(cell.frame);
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
    OGStrategyDetailViewController * viewController = [segue destinationViewController];
    NSIndexPath * indexPath = sender;
    viewController.info = _items[indexPath.row];
}


@end
