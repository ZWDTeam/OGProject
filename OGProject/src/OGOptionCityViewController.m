//
//  OGOptionCityViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/21.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#define  locationCityKey @"locationCityKey"


#import "OGOptionCityViewController.h"

@interface OGOptionCityViewController ()<UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong , nonatomic)CLLocationManager *locationManager;


@property (strong , nonatomic)NSArray * citys;
@property (strong, nonatomic)NSString * currentCity;

@end

@implementation OGOptionCityViewController{

    NSIndexPath * _selectedIndexPath;
}


- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"切换城市";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //定位管理
    
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;//定位的精度级别
    _locationManager.distanceFilter = 100;//最小更新距离
    [_locationManager requestAlwaysAuthorization];//始终允许访问位置信息
    [_locationManager startUpdatingLocation];//开始定位
    
    
    _selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    _citys = @[@"北京市",@"上海市",@"广州市",@"深圳市",@"杭州市",@"成都市"];
    
    _currentCity = @"正在定位...";
}


#pragma mark - CLLocationManagerDelegate
//返回定位信息
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{

    CLLocation * newLocation = [locations lastObject];
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
            for (CLPlacemark *place in placemarks) {
                NSLog(@"name,%@",place.name);                          // 位置名
                NSLog(@"thoroughfare,%@",place.thoroughfare);        // 街道
                NSLog(@"subThoroughfare,%@",place.subThoroughfare); // 子街道
                NSLog(@"locality,%@",place.locality);                 // 市
                NSLog(@"subLocality,%@",place.subLocality);          // 区
                NSLog(@"country,%@",place.country);
                _currentCity = place.locality;
                [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
            }
        }];
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
    if (section ==0) {
        return 1;
    }
    return _citys.count;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];    
    }
    
    if (indexPath.row ==_selectedIndexPath.row && indexPath.section == _selectedIndexPath.section) {
        cell.accessoryView = [self cellAccessoryView];
    }else{
        cell.accessoryView = nil;
    }
    
    if (indexPath.row == 0 &&indexPath.section == 0) {
        cell.textLabel.text = _currentCity;
    }else{
        cell.textLabel.text = _citys[indexPath.row];
        if ([ex_locationCity isEqualToString:_citys[indexPath.row]]) {
            cell.accessoryView = [self cellAccessoryView];
        }else{
            cell.accessoryView = nil;
        }

    }
    

    
    
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedIndexPath = indexPath;
    if (indexPath.row ==0 &&indexPath.section ==0) {
        if ([_currentCity isEqualToString:@"正在定位..."]) {
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请确保手机已开启定位" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            [alertView show];
            return;
        }
        
        ex_locationCity = _currentCity;
    }else{
        ex_locationCity  =_citys[indexPath.row];
    }
    
    NSUserDefaults * userDefualts = [NSUserDefaults standardUserDefaults];
    [userDefualts setValue:ex_locationCity forKey:locationCityKey];
    [userDefualts synchronize];
    
    [self.navigationController popViewControllerAnimated:YES];
    [tableView reloadData];
    

}


- (UIImageView *)cellAccessoryView{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    imageView.image = [UIImage imageNamed:@"勾选"];
    return imageView;

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
