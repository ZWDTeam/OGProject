//
//  OGMapViewController.m
//  OGProject
//
//  Created by 钟伟迪 on 15/6/15.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGMapViewController.h"
#import "LocationHeaderView.h"
#import "DGMKAninotationView.h"

@interface OGMapViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong , nonatomic)CLLocationManager * locationManager;


@end

@implementation OGMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //定位管理
    self.locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;//定位的精度级别
    _locationManager.distanceFilter = 10;//最小更新距离
    [_locationManager requestAlwaysAuthorization];//始终允许访问位置信息
    [_locationManager startUpdatingLocation];//开始定位
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
}

#pragma mark - CLLocationManagerDelegate
//返回定位信息
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation * newLocation = [locations lastObject];
    CLLocationCoordinate2D cordinate = newLocation.coordinate;
    
    LocationHeaderView *pAnno = [[LocationHeaderView alloc] init];
    pAnno.coordinate = cordinate;
    pAnno.title = @"中国";
    [self.mapView addAnnotation:pAnno];//添加大头针
    
    
    //放大地图到自身的经纬度位置。
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(cordinate, 10000, 10000);
    [self.mapView setRegion:region];//设置定位区域
    
    //
    //    CLLocationCoordinate2D cord = CLLocationCoordinate2DMake(cordinate.latitude-10, cordinate.longitude-10);
    //
    //    MKCoordinateRegion region1 = MKCoordinateRegionMakeWithDistance(cord, 10000, 10000);
    //
    //
    //    [self.myMKMapView setRegion:region1];//设置定位呼吸灯
    
    
    
    
    
    //    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
    //        for (CLPlacemark *place in placemarks) {
    //            NSLog(@"name,%@",place.name);                          // 位置名
    //            NSLog(@"thoroughfare,%@",place.thoroughfare);        // 街道
    //            NSLog(@"subThoroughfare,%@",place.subThoroughfare); // 子街道
    //            NSLog(@"locality,%@",place.locality);                 // 市
    //            NSLog(@"subLocality,%@",place.subLocality);          // 区
    //            NSLog(@"country,%@",place.country);
    //        }
    //    }];
}


/////
-(MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if (![annotation isKindOfClass:[LocationHeaderView class]]) {
        return nil;
    }
    
    static NSString * identifier = @"Cell";
    
    DGMKAninotationView *newAnnotation= (DGMKAninotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (newAnnotation == nil) {
        newAnnotation=[[DGMKAninotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier withColor:[UIColor grayColor]];
    }
    newAnnotation.headerImageView.image = [UIImage imageNamed:@"mm4.jpg"];
    
    return newAnnotation;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    NSLog(@"%ld",view.tag);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
