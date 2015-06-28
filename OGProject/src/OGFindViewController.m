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
#import "OGDesignCircleViewController.h"

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
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarSelectedIndex:) name:tabbar_selectedIndex_notification object:nil];
    }
    return self;
    
}

- (NSArray *)items{
    if (ex_identityType == OGIdentityTypeUser) {
        
        _items = @[@{@"title":@"附近的设计师",
                     @"image":@"15-1"},
                   @{@"title":@"附近的体验馆",
                     @"image":@"15-3"}];
    }else{
        _items = @[@{@"title":@"设计圈",
                   @"image":@"15-设计圈"},
                 @{@"title":@"淘订单",
                   @"image":@"15-淘订单"}];
    }
    
    return _items;

}

#pragma mark - 点击tabbar触发通知
- (void)tabBarSelectedIndex:(NSNumber *)selectedIndex{
    if (ex_identityType == OGIdentityTypeUser) {
        
    }else if (ex_identityType == OGIdentityTypeStylist){
    
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"OGFindTableViewCell";
    OGFindTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.headerImageView.image = [UIImage imageNamed:self.items[indexPath.row][@"image"]];
    cell.titleLabel.text = self.items[indexPath.row][@"title"];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (ex_identityType == OGIdentityTypeUser) {
        [self performSegueWithIdentifier:@"pushMapViewController" sender:indexPath];
    }else{
        if (indexPath.row == 0) {
            OGDesignCircleViewController * DesignCircleVC = [[OGDesignCircleViewController alloc]init];
            [self.navigationController pushViewController:DesignCircleVC animated:YES];
        }else{
            [self performSegueWithIdentifier:@"OGTaoOrderFormViewController" sender:indexPath];
        }
    }
    
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

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
