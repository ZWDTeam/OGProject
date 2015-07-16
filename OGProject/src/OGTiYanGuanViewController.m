//
//  OGTiYanGuanViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/7/7.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGTiYanGuanViewController.h"
#import "OGTiYanGuanTableViewCell.h"
#import "OGExperienceDetailViewController.h"

@interface OGTiYanGuanViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong , nonatomic)NSArray * items;

@end

@implementation OGTiYanGuanViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"TYanGuan" ofType:@"plist"];
        
        _items = [NSArray arrayWithContentsOfFile:path];

    }
    return self;
}

- (IBAction)locationAction:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] init];

    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * indentifier = @"OGTiYanGuanTableViewCell";
    OGTiYanGuanTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:indentifier owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary * dic = _items[indexPath.row];
    
    cell.headerImageView.image =[UIImage imageNamed:dic[@"image"]];
    cell.titleLabel.text = dic[@"companyName"];
    cell.telLabel.text = dic[@"tel"];
    cell.cityLabel.text = dic[@"area"];
    cell.cityDetailLabel.text =dic[@"address"];
    cell.lookLabel.text = [NSString stringWithFormat:@"%d",arc4random()%1000+500];
    cell.distanceLabel.text = [NSString stringWithFormat:@"%dkm",(arc4random()%10000)/100];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"pushDetailView" sender:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return CGRectGetHeight(cell.frame);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    OGExperienceDetailViewController * v = [segue destinationViewController];
    if ([segue.identifier isEqualToString:@"pushDetailView"]) {
        NSIndexPath * indexPath = sender;
        v.info = _items[indexPath.row];
    }
}


@end
