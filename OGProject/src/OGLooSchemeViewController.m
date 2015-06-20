//
//  OGLooSchemeViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGLooSchemeViewController.h"
#import "OGLookSchemeTableViewCell.h"
#import "VPTribeSegmentedControl.h"

@interface OGLooSchemeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong , nonatomic)NSMutableArray * schemes;
@property (strong , nonatomic)VPTribeSegmentedControl * segmentedControl;
@property (weak, nonatomic) IBOutlet VPTribeSegmentedControl *tpyeSegmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *rightBarBtn;

@end

@implementation OGLooSchemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _schemes = [NSMutableArray array];
    
    self.navigationItem.titleView =self.segmentedControl;
    
    self.tpyeSegmentedControl.items = @[@"风格",@"户型",@"颜色",@"预算"];
    self.tpyeSegmentedControl.isExchangeItemColor = YES;
    self.tpyeSegmentedControl.selectedIndex = 0;
    [self.tpyeSegmentedControl addTarget:self action:@selector(exchaneSortType:)];
    
    self.rightBarBtn.layer.cornerRadius = CGRectGetHeight(self.rightBarBtn.frame)/2.0f;
    self.rightBarBtn.layer.borderWidth = 1.0f;
    self.rightBarBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    
}

- (VPTribeSegmentedControl *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [[VPTribeSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 200, 45) withItems:@[@"配图设计",@"样板图"]];
        _segmentedControl.tintColor = [UIColor orangeColor];
        [_segmentedControl addTarget:self action:@selector(exchangeContent:)];
        
    }
    return _segmentedControl;
}


#pragma mark - segmentedControl Action
//切换类型
- (void)exchangeContent:(VPTribeSegmentedControl *)segmentedControl{

}

//切换排序方式
- (void)exchaneSortType:(VPTribeSegmentedControl *)segmentedControl{

}

- (IBAction)sendNeed:(UIButton *)sender {
    
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
    }
    
    cell.headerImageView.image = [UIImage imageNamed:@"home1.jpg"];
    cell.titleLabel.text = @"欧工家装";
    cell.styleLabel.text = @"小清新";
    cell.detailContentLabel.text = @"美洲豹";
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
