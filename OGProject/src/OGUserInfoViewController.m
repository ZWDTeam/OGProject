//
//  OGUserInfoViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/20.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGUserInfoViewController.h"
#import "OGUserInfoTableViewCell.h"

@interface OGUserInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong , nonatomic)UIView * footView;

@end

@implementation OGUserInfoViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"个人资料";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = self.footView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"OGUserInfoTableViewCell";
    OGUserInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
            cell.titleLabel.text = @"头像";
            cell.detailContentLabel.hidden = YES;
            cell.accessoryView =[self userHeaderImageView];
          
            }
                break;
            case 1:{
                cell.titleLabel.text = @"昵称";
                cell.detailContentLabel.text = ex_userInfo.nickName;
            }
                break;
            case 2:{
                cell.titleLabel.text = @"性别";
                cell.detailContentLabel.text = ex_userInfo.sex;
 
            }
                break;
            case 3:{
                cell.titleLabel.text = @"所在城市";
                cell.detailContentLabel.text = ex_userInfo.city;

            }
                break;
                
            default:
                break;
        }
    }else{
        switch (indexPath.row) {
            case 0:{
                cell.titleLabel.text = @"装修风格";
                cell.detailContentLabel.text = ex_userInfo.style;

            }
                break;
            case 1:{
                cell.titleLabel.text = @"户型";
                cell.detailContentLabel.text = ex_userInfo.type;
 
            }
                break;
            case 2:{
                cell.titleLabel.text = @"面积";
                cell.detailContentLabel.text = ex_userInfo.area;

            }
                break;
            case 3:{
                cell.titleLabel.text = @"我的地址";
                cell.detailContentLabel.text = ex_userInfo.address;

            }
                break;
                
            default:
                break;
        }
    
    }
    return cell;
}

#pragma  mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (UIImageView * )userHeaderImageView{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    imageView.layer.cornerRadius = CGRectGetHeight(imageView.frame)/2.0f;
    imageView.layer.masksToBounds = YES;
    imageView.image = ex_userInfo.headerImage;
    return imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (UIView * )footView{
    if (!_footView) {
        _footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
        _footView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:OG_BASE_COLOR];
        [btn setTitle:@"退出登录" forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, SCREEN_WIDTH - 40, 50);
        btn.center = CGPointMake(_footView.frame.size.width/2.0f, _footView.frame.size.height/2.0f);
        btn.layer.cornerRadius = 5.0f;
        btn.layer.masksToBounds = YES;
        [btn addTarget:self action:@selector(tuichuAction:) forControlEvents:UIControlEventTouchUpInside];
        [_footView addSubview:btn];
    }
    return _footView;
}

- (IBAction)tuichuAction:(id)sender {
    UIStoryboard * stroyboard =[UIStoryboard storyboardWithName:@"OGLogin" bundle:[NSBundle mainBundle]];
    
    UINavigationController * navigationController = [stroyboard instantiateViewControllerWithIdentifier:@"OGLoginNavigationController"];
    
    [self presentViewController:navigationController animated:YES completion:nil];
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
