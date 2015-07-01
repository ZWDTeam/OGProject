//
//  OGFindDesignerViewController.m
//  OGProject
//
//  Created by ww on 15/6/26.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGDesignerHomeViewController.h"
#import "ReservationDesignViewController.h"

@interface OGDesignerHomeViewController (){
    //用于处理作品风格按钮点击效果中间量
    UIButton *currenctButton;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewBackground;
@property (weak, nonatomic) IBOutlet UIView *viewDesignerProduction;


@property (weak, nonatomic) IBOutlet UIImageView *imgFace;
@property (weak, nonatomic) IBOutlet UIImageView *imgSex;
@property (weak, nonatomic) IBOutlet UIImageView *imgVipLevel;
@property (weak, nonatomic) IBOutlet UIImageView *imgIsSecurity;

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelWorkTime;
@property (weak, nonatomic) IBOutlet UILabel *labelCompany;
@property (weak, nonatomic) IBOutlet UILabel *labelPosition;
@property (weak, nonatomic) IBOutlet UILabel *labelFansNum;
@property (weak, nonatomic) IBOutlet UILabel *labelServiceRange;
@property (weak, nonatomic) IBOutlet UILabel *labelStyle;
@property (weak, nonatomic) IBOutlet UILabel *labelDesginerExplain;
@property (weak, nonatomic) IBOutlet UILabel *labelDesignerWorksNum;

@property (weak, nonatomic) IBOutlet UIButton *btnSubscribe;
@property (weak, nonatomic) IBOutlet UIButton *btnContact;
@property (weak, nonatomic) IBOutlet UIButton *btnAttention;



@end

#define iPhone_scale(value) (value /(320.0f/[UIScreen mainScreen].bounds.size.width))

@implementation OGDesignerHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设计师";
    
    /**
     右侧按钮--没法用xib拖
     */
    UIBarButtonItem * RBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"分享.png"] style:UIBarButtonItemStyleDone target:self action:@selector(shareDesigner)];
    self.navigationItem.rightBarButtonItem = RBtn;
    
    
    /**
     *  按钮带上圆角效果
     */
    self.btnAttention.layer.masksToBounds= YES;
    self.btnAttention.layer.cornerRadius =  5;
    
    self.btnContact.layer.masksToBounds= YES;
    self.btnContact.layer.cornerRadius =  3;
    
    self.btnSubscribe.layer.masksToBounds= YES;
    self.btnSubscribe.layer.cornerRadius =  3;
    

    [self setDesignerWorksPic];
    [self setProductStyleBoard];
    
    
    /**
     *  创建产品信息--第一次进去默认创建第一个
     */
    [self createProductMsg];
}



/**
 *  给上面8个图片赋值
 */
-(void)setDesignerWorksPic{
    for (int i = 1; i<9; i++) {
        UIImageView * imgTemp = (UIImageView *)[self.view viewWithTag:(10000+i)];
        [imgTemp setImage:[UIImage imageNamed:[NSString stringWithFormat:@"2-2图%d.png",i]]];
    }
}

/**
 *  作品信息创建--图片数量不固定
 */
-(void)createProductMsg{
    //模拟数据长度
    int arrayCount = 2;
    
    //移除view上原来的图片
    NSArray *views = [self.viewDesignerProduction subviews];
    for(UIView * view in views)
    {
        if ([view isKindOfClass:[UIImageView class]]) {
            [view removeFromSuperview];
        }
    }
    
    
    //创建新图片
    for (int i = 0; i<arrayCount; i++) {
        UIImageView * imgTemp = [[UIImageView alloc]init];
        [imgTemp setFrame:CGRectMake(iPhone_scale(12+(i%2*150)), iPhone_scale(44+i/2*115),iPhone_scale(145), iPhone_scale(110))];
        
        [imgTemp setImage:[UIImage imageNamed:@"home17.jpg"]];
        
        [self.viewDesignerProduction addSubview:imgTemp];
        
    }
    
    //注意将 4 替换为实际数据长度
    [self.viewDesignerProduction setFrame:CGRectMake(0, 481, SCREEN_WIDTH, iPhone_scale(44+(arrayCount%2+arrayCount/2)*117))];
    
    [self.scrollViewBackground setContentSize:CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(self.viewDesignerProduction.frame))];

}

-(void)switchProductStyle:(NSInteger)tag{
}


#pragma mark - Steup
/**
 *  设置作品按钮各个状态下的效果
 */
-(void)setProductStyleBoard{
    for (int i = 1; i< 5; i++) {
        UIButton * btnTemp = (UIButton *)[self.view viewWithTag:(20000+i)];
        [btnTemp.layer setMasksToBounds:YES];
        [btnTemp.layer setCornerRadius:3.0]; //设置矩圆角半径
        [btnTemp.layer setBorderWidth:1.0];   //边框宽度
        [btnTemp.layer setBorderColor:[UIColor colorWithRed:255.0/255.0 green:93.0/255.0 blue:0 alpha:1.0].CGColor];//边框颜色
        [btnTemp setBackgroundImage:createImageWithColor([UIColor colorWithRed:255.0/255.0 green:93.0/255.0 blue:0 alpha:1.0]) forState:UIControlStateSelected];
        [btnTemp setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        if (i==1) {
            btnTemp.selected = YES;
            currenctButton = btnTemp;
        }
    }
}


#pragma mark - FunctionButton
/**
 *  分享设计师
 */
-(void)shareDesigner{
}

/**
 *  预约设计
 */
- (IBAction)subscribe:(id)sender {
    ReservationDesignViewController * vc = [[ReservationDesignViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 *  联系设计师
 */
- (IBAction)ContactDesigner:(id)sender {
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://4000-888-186"]];
}

/**
 *  关注设计师
 */
- (IBAction)attentionDesigner:(id)sender {
}

/**
 *  作品风格按钮
 */
- (IBAction)productStyle:(id)sender {
    if (sender != currenctButton)
    {
        currenctButton.selected = NO;
        currenctButton = sender;
    }
    currenctButton.selected = YES;
    
    //调用添加作品图片方法
    [self createProductMsg];
    
}

#pragma mark -Image TOOL
UIImage* createImageWithColor(UIColor *color)
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
