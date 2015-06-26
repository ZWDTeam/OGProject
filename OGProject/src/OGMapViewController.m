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
#import "OGMapShowTypeView.h"

@interface OGMapViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong , nonatomic)CLLocationManager * locationManager;
@property (assign , nonatomic , getter = isUpdataAnnotations)BOOL updataAnnotations;

@property (strong , nonatomic)NSArray * allPeoples;

@end

@implementation OGMapViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"找设计师";
        NSString * path = [[NSBundle mainBundle] pathForResource:@"LoctionUserModel" ofType:@"plist"];
        _allPeoples = [NSArray arrayWithContentsOfFile:path];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //定位管理
    self.locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;//定位的精度级别
    _locationManager.distanceFilter = 1000;//最小更新距离
    [_locationManager requestAlwaysAuthorization];//始终允许访问位置信息
    [_locationManager startUpdatingLocation];//开始定位
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    
    
    _updataAnnotations = YES;
    
    OGMapShowTypeView * mapShowTypeView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([OGMapShowTypeView class]) owner:self options:nil] lastObject];
    [mapShowTypeView addTarget:self action:@selector(selectedShowType:)];
    mapShowTypeView.center = CGPointMake(SCREEN_WIDTH/2.0f, 140);
    [self.view addSubview:mapShowTypeView];
    
    
    UIButton * btnTest = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    [btnTest setTitle:@"desiginer" forState:UIControlStateNormal];
    [btnTest setBackgroundColor:[UIColor redColor]];
    [btnTest addTarget:self action:@selector(goDesiginer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTest];
}

-(void)goDesiginer {
    OGDesignerHomeViewController * DesignerVC = [[OGDesignerHomeViewController alloc]init];
    [self.navigationController pushViewController:DesignerVC animated:YES];
}

- (void)selectedShowType:(OGMapShowTypeView *)view{
    NSLog(@"%ld",view.selectedIndex);
}

- (void)addLocations:(CLLocation *)firstLocation{
    
    CLLocationCoordinate2D cordinate = firstLocation.coordinate;

    
    if (self.isUpdataAnnotations) {
        _updataAnnotations =NO;
        
        double x =0;
        double y = 0;
        for (int  i = 0;  i <10; i++) {
            if (i%2) {
                x = arc4random()%20/1000.0f;
                y = arc4random()%13/1000.0f;
            }else{
                x = -(arc4random()%20/1000.0f);
                y = -(arc4random()%13/1000.0f);
            }
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(cordinate.latitude+x, cordinate.longitude+y);
            LocationHeaderView *pAnno = [[LocationHeaderView alloc] init];
            pAnno.coordinate = coord;
            pAnno.title = @"标题";
            pAnno.subtitle = @"子标题";
            pAnno.tag = i;
            [self.mapView addAnnotation:pAnno];//添加大头针
        }
    }

}

#pragma mark - CLLocationManagerDelegate
//返回定位信息
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation * newLocation = [locations firstObject];
    CLLocationCoordinate2D cordinate = newLocation.coordinate;
    
    //添加大头针
    [self addLocations:newLocation];
    
    //放大地图到自身的经纬度位置。
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(cordinate, 3000, 3000);
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


#pragma mark - MKMapViewDelegate
-(MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if (![annotation isKindOfClass:[LocationHeaderView class]]) {
        return nil;
    }
    
    static NSString * identifier = @"Cell";
    NSInteger index = [(LocationHeaderView *)annotation tag];

    
    DGMKAninotationView *newAnnotation= (DGMKAninotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    NSString * sex = _allPeoples[index][@"sex"];
    
    if (newAnnotation == nil) {
        newAnnotation=[[DGMKAninotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier withColor:[self annotationColor:sex]];
    }
    
    
    newAnnotation.headerImageView.image =[UIImage imageNamed:_allPeoples[index][@"image"]];
    newAnnotation.tag = index;
    
    newAnnotation.titleLabel.text = _allPeoples[index][@"name"];
    return newAnnotation;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    NSLog(@"%ld",view.tag);
}

- (UIColor *)annotationColor:(NSString *)sex{
    if ([sex isEqualToString:@"男"]) {
        return [UIColor colorWithRed:87.0f/255.0f green:112.0f/255.0f blue:176.0f/255.0f alpha:1.0f];
    }else{
        return [UIColor colorWithRed:245.0f/255.0f green:79.0f/255.0f blue:261.0f/255.0f alpha:1.0f];
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
