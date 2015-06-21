//
//  OGOptionCityViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/21.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGOptionCityViewController.h"

@interface OGOptionCityViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong , nonatomic)NSArray * citys;
@property (strong, nonatomic)NSString * currentCity;

@end

@implementation OGOptionCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _citys = @[@"北京市",@"上海市",@"广州市",@"深圳市",@"杭州市",@"成都市"];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section ==0) {
       return @"GPS定位城市";
    }else{
       return @"当前已开通城市";
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _citys.count;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (indexPath.row == 0 &&indexPath.section == 0) {
        cell.textLabel.text = _currentCity;
    }else{
        cell.textLabel.text = _citys[indexPath.row];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


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
