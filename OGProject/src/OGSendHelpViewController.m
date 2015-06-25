//
//  OGSendHelpViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/25.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGSendHelpViewController.h"
#import "OGSendHelpModel.h"
#import "OGSendHelpTableViewCell1.h"

@interface OGSendHelpViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *sendHelpBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong , nonatomic)NSArray * titles;
@property (strong , nonatomic)NSArray *placeholders;

@property (strong , nonatomic)OGSendHelpModel * model;


@end

@implementation OGSendHelpViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _model = [OGSendHelpModel new];
        _titles = @[@"标题",@"面积",@"上传户型",@"装修风格",@"户型",@"小区民称",@"预算"];
        _placeholders = @[@"请输入需求标题",@"请输入面积",@"请选择户型",@"请选择1至2种装修风格",@"请上传户型图",@"请选择所在小区",@"请选择软装预算"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sendHelpBtn.layer.cornerRadius = CGRectGetHeight(self.sendHelpBtn.frame)/2.0f;
    self.sendHelpBtn.layer.masksToBounds = YES;
    self.sendHelpBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.sendHelpBtn.layer.borderWidth = 1.0f;
}


- (IBAction)sendHelpBtnAction:(id)sender {
    

}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier  = @"OGSendHelpTableViewCell1";
    OGSendHelpTableViewCell1 * cell = [tableView  dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
    }
    
    cell.titleLabel.text = _titles[indexPath.row];
    cell.contentTedtField.placeholder = _placeholders[indexPath.row];
    
    switch (indexPath.row) {
        case 0:
            
            break;
        case 1:
            
            break;

        case 2:
            
            break;

        case 3:
            
            break;

        case 4:
            
            break;

        case 5:
            
            break;
        case 6:
            
            break;

            
        default:
            break;
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
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
