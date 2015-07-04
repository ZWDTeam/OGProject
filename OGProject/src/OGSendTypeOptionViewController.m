//
//  OGSendTypeOptionViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/28.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGSendTypeOptionViewController.h"
#import "OGSendHelpViewController.h"

@interface OGSendTypeOptionViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong , nonatomic)NSArray * items;

@end

@implementation OGSendTypeOptionViewController


- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"选择分类";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    switch (_showType) {
        case 2:
            _items = @[@"一居室",@"别墅",@"复式楼",@"客厅",@"两居室"];

            break;
        case 3:
            _items = @[@"欧美风",@"希腊风",@"中式风",@"小清晰",@"韩国风",@"泰式风"];

            break;
        case 5:
            _items = @[@"八家湾小区",@"龙腾虎小区",@"日康小区",@"梅溪湖校区",@"湾仔小区",@"朝阳小区"];

            break;
        case 6:
            _items = @[@"<5万",@"5万~10万",@"10万～15万",@"15万～20万",@">20万"];

            break;

            
        default:
            _items = @[@"一居室",@"别墅",@"复式楼",@"客厅",@"两居室"];

            break;
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.textColor = [UIColor grayColor];
    }
    cell.textLabel.text = self.items[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController popViewControllerAnimated:YES];
    [self.sendhelpController updataSelectdIndexPathWithText:self.items[indexPath.row]];
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
