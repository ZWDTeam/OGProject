//
//  OGFindViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/15.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGFindViewController.h"
#import "OGFindTableViewCell.h"
#import "OGMapViewController.h"

@interface OGFindViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong , nonatomic)NSArray * items;

@end

@implementation OGFindViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"发现";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现"
                                                        image:[UIImage imageNamed:@"发现00"]
                                                selectedImage:[UIImage imageNamed:@"发现01"]];
        
        _items = @[@{@"title":@"附近的设计师",
                     @"image":@"15-1"},
                   @{@"title":@"附近的体验馆",
                     @"image":@"15-3"}];
    }
    return self;
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"OGFindTableViewCell";
    OGFindTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.headerImageView.image = [UIImage imageNamed:_items[indexPath.row][@"image"]];
    cell.titleLabel.text = _items[indexPath.row][@"title"];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"pushMapViewController" sender:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"pushMapViewController"]) {
        OGMapViewController * viewController = [segue destinationViewController];
        NSIndexPath * indexPath = (NSIndexPath *)sender;
        
        if (indexPath.row == 0) {
            viewController.showType = MapShowTypePeople;
        }else if (indexPath.row ==1)
            viewController.showType = MapShowTypeHouse;
        
    }
}


@end
