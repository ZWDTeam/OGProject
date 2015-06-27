//
//  OGDemandDetailsView.m
//  OGProject
//
//  Created by ww on 15/6/27.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGDemandDetailsView.h"

@implementation OGDemandDetailsView{
    UILabel * labelTitle;
    UILabel * labelTime;
    UILabel * labelDesignerNum;
    
    
    UILabel * labelArea;
    UILabel * labelHouseType;
    UILabel * labelStyle;
    UILabel * labelAddress;
    UILabel * labelBudget;
    
    UIImageView * imgHouseType;
    
    UILabel * labelDetailedMsg;
 
    UIScrollView * scrollViewDetail;
}


-(id)initOGDemandDetailsView{
    self = [super initWithFrame:CGRectMake(0, 0, MainView_Width, MainView_Height)];
    
    if (self)
        
    {
        [self setBackgroundColor:[UIColor whiteColor]];
        scrollViewDetail = [[UIScrollView alloc]initWithFrame:self.frame];
        scrollViewDetail.alwaysBounceVertical = YES;
        
        [self addSubview:scrollViewDetail];
        //灰色小条
        //灰色的破条子创建
        UIImageView * imgTemp = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, MainView_Width, 8)];
        [imgTemp setBackgroundColor:Color_Brey_BG];
        [scrollViewDetail addSubview:imgTemp];

        
        //标题
        labelTitle = [[UILabel alloc]initWithFrame:iphone_rect_scale(15, 27, 200, 15)];
        [labelTitle setFont:Font_middle];
        [labelTitle setTextColor:Color_Black_Text];
        [labelTitle setNumberOfLines:1];
        
        [scrollViewDetail addSubview:labelTitle];
        
        
        //时间
        labelTime = [[UILabel alloc]initWithFrame:CGRectMake(kPercenX_scale(15), CGRectGetMaxY(labelTitle.frame), 200, 30)];
        [labelTime setFont:Font_small];
        [labelTime setTextColor:Color_Grey_Text];
        [labelTime setNumberOfLines:1];
        
        [scrollViewDetail addSubview:labelTime];
        
        //抢单按钮
        UIButton * btnGrabSingle = [[UIButton alloc]initWithFrame:iphone_rect_scale(250, 35, 50, 20)];
        [btnGrabSingle setBackgroundColor:Color_Orange_UIBG];
        [btnGrabSingle.titleLabel setFont:Font_small];
        btnGrabSingle.layer.masksToBounds= YES;
        btnGrabSingle.layer.cornerRadius =  5;
        [btnGrabSingle setTitle:@"抢单" forState:UIControlStateNormal];
        [btnGrabSingle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [scrollViewDetail addSubview:btnGrabSingle];
        
        //灰线
        UIImageView * imgTemp01 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(labelTime.frame)+5, MainView_Width, 1)];
        [imgTemp01 setBackgroundColor:Color_Brey_UIBG];
        [scrollViewDetail addSubview:imgTemp01];
        
        
        //2个设计师抢单
        labelDesignerNum = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(imgTemp01.frame)+12, kPercenX_scale(200), kPercenX_scale(30))];
        [labelDesignerNum setFont:Font_middle];
        [labelDesignerNum setTextColor:Color_Grey_Text];
        
        [scrollViewDetail addSubview:labelDesignerNum];
        
        UIImageView * imgTemp02 = [[UIImageView alloc]initWithFrame:iphone_rect_scale(300, 90, 10, 18)];
        [imgTemp02 setImage:[UIImage imageNamed:@"4-1.png"]];
        [scrollViewDetail addSubview:imgTemp02];
        
        
        
        //大灰条
        //灰色的破条子创建
        UIImageView * imgTemp03 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imgTemp02.frame)+20, MainView_Width, 16)];
        [imgTemp03 setBackgroundColor:Color_Brey_BG];
        [scrollViewDetail addSubview:imgTemp03];
        
        
        //面积
        UILabel * labelTemp = [[UILabel alloc]initWithFrame:iphone_rect_scale(15, 140, 130, 30)];
        [labelTemp setText:@"面积"];
        [labelTemp setFont:Font_middle];
        [labelTemp setTextColor:Color_Grey_Text];
        [labelTemp setTextAlignment:NSTextAlignmentLeft];
        
        [scrollViewDetail addSubview:labelTemp];
        
        labelArea = [[UILabel alloc]initWithFrame:iphone_rect_scale(100, 140, 145, 30)];
        [labelArea setFont:Font_middle];
        [labelArea setTextColor:Color_Black_Text];
        [labelArea setTextAlignment:NSTextAlignmentLeft];
        
        [scrollViewDetail addSubview:labelArea];
        
        //灰线
        UIImageView * imgTemp04 = [[UIImageView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(labelTemp.frame), MainView_Width-30, 1)];
        [imgTemp04 setBackgroundColor:Color_Brey_UIBG];
        [scrollViewDetail addSubview:imgTemp04];
        
        
        //户型
        UILabel * labelTemp01 = [[UILabel alloc]initWithFrame:iphone_rect_scale(15, 170, 130, 30)];
        [labelTemp01 setText:@"户型"];
        [labelTemp01 setFont:Font_middle];
        [labelTemp01 setTextColor:Color_Grey_Text];
        [labelTemp01 setTextAlignment:NSTextAlignmentLeft];
        
        [scrollViewDetail addSubview:labelTemp01];
        
        labelHouseType = [[UILabel alloc]initWithFrame:iphone_rect_scale(100, 170, 145, 30)];
        [labelHouseType setFont:Font_middle];
        [labelHouseType setTextColor:Color_Black_Text];
        [labelHouseType setTextAlignment:NSTextAlignmentLeft];
        
        [scrollViewDetail addSubview:labelHouseType];
        
        //灰线
        UIImageView * imgTemp05 = [[UIImageView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(labelTemp01.frame), MainView_Width-30, 1)];
        [imgTemp05 setBackgroundColor:Color_Brey_UIBG];
        [scrollViewDetail addSubview:imgTemp05];

        
        
        //装修风格
        UILabel * labelTemp02 = [[UILabel alloc]initWithFrame:iphone_rect_scale(15, 200, 130, 30)];
        [labelTemp02 setText:@"装修风格"];
        [labelTemp02 setFont:Font_middle];
        [labelTemp02 setTextColor:Color_Grey_Text];
        [labelTemp02 setTextAlignment:NSTextAlignmentLeft];
        
        [scrollViewDetail addSubview:labelTemp02];
        
        labelStyle = [[UILabel alloc]initWithFrame:iphone_rect_scale(100, 200, 145, 30)];
        [labelStyle setFont:Font_middle];
        [labelStyle setTextColor:Color_Black_Text];
        [labelStyle setTextAlignment:NSTextAlignmentLeft];
        
        [scrollViewDetail addSubview:labelStyle];
        
        //灰线
        UIImageView * imgTemp06 = [[UIImageView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(labelTemp02.frame), MainView_Width-30, 1)];
        [imgTemp06 setBackgroundColor:Color_Brey_UIBG];
        [scrollViewDetail addSubview:imgTemp06];

        
        
        //小区地址
        UILabel * labelTemp03 = [[UILabel alloc]initWithFrame:iphone_rect_scale(15, 230, 130, 30)];
        [labelTemp03 setText:@"小区地址"];
        [labelTemp03 setFont:Font_middle];
        [labelTemp03 setTextColor:Color_Grey_Text];
        [labelTemp03 setTextAlignment:NSTextAlignmentLeft];
        
        [scrollViewDetail addSubview:labelTemp03];
        
        labelAddress = [[UILabel alloc]initWithFrame:iphone_rect_scale(100, 230, 145, 30)];
        [labelAddress setFont:Font_middle];
        [labelAddress setTextColor:Color_Black_Text];
        [labelAddress setTextAlignment:NSTextAlignmentLeft];
        
        [scrollViewDetail addSubview:labelAddress];
        
        //灰线
        UIImageView * imgTemp07 = [[UIImageView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(labelTemp03.frame), MainView_Width-30, 1)];
        [imgTemp07 setBackgroundColor:Color_Brey_UIBG];
        [scrollViewDetail addSubview:imgTemp07];
        
        
        //预算
        UILabel * labelTemp04 = [[UILabel alloc]initWithFrame:iphone_rect_scale(15, 260, 130, 30)];
        [labelTemp04 setText:@"预算"];
        [labelTemp04 setFont:Font_middle];
        [labelTemp04 setTextColor:Color_Grey_Text];
        [labelTemp04 setTextAlignment:NSTextAlignmentLeft];
        
        [scrollViewDetail addSubview:labelTemp04];
        
        labelBudget = [[UILabel alloc]initWithFrame:iphone_rect_scale(100, 260, 145, 30)];
        [labelBudget setFont:Font_middle];
        [labelBudget setTextColor:Color_Black_Text];
        [labelBudget setTextAlignment:NSTextAlignmentLeft];
        
        [scrollViewDetail addSubview:labelBudget];
        
        //灰线
        UIImageView * imgTemp08 = [[UIImageView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(labelTemp04.frame), MainView_Width-30, 1)];
        [imgTemp08 setBackgroundColor:Color_Brey_UIBG];
        [scrollViewDetail addSubview:imgTemp08];
        
        
        
        //户型图
        UILabel * labelTemp05 = [[UILabel alloc]initWithFrame:iphone_rect_scale(15, 295, 130, 30)];
        [labelTemp05 setText:@"户型图"];
        [labelTemp05 setFont:Font_middle];
        [labelTemp05 setTextColor:Color_Grey_Text];
        [labelTemp05 setTextAlignment:NSTextAlignmentLeft];
        
        [scrollViewDetail addSubview:labelTemp05];
        
        UIImageView * imgTemp09 = [[UIImageView alloc]initWithFrame:iphone_rect_scale(300, 305, 9, 17)];
        [imgTemp09 setImage:[UIImage imageNamed:@"4-1.png"]];
        [scrollViewDetail addSubview:imgTemp09];
        
        imgHouseType = [[UIImageView alloc]initWithFrame:iphone_rect_scale(265, 300, 25, 25)];
        [scrollViewDetail addSubview:imgHouseType];
        
        
        //更大灰条
        //灰色的破条子创建
        UIImageView * imgTemp10 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(labelTemp05.frame)+10, MainView_Width, 20)];
        [imgTemp10 setBackgroundColor:Color_Brey_BG];
        [scrollViewDetail addSubview:imgTemp10];
        
        
        //详细信息
        
        UILabel * labelDetail = [[UILabel alloc]initWithFrame:CGRectMake(kPercenX_scale(20), CGRectGetMaxY(imgTemp10.frame)+15, 100, 7)];
        [labelDetail setText:@"详细信息"];
        [labelDetail setFont:Font_small];
        [labelDetail setTextColor:Color_Red_Text];
        
        [scrollViewDetail addSubview:labelDetail];
        
        labelDetailedMsg = [[UILabel alloc]initWithFrame:CGRectMake(kPercenX_scale(20), CGRectGetMaxY(labelDetail.frame)+7, kPercenX_scale(280), 40)];
        [labelDetailedMsg setFont:Font_middle];
        [labelDetailedMsg setTextColor:Color_Black_Text];
        labelDetailedMsg.numberOfLines = 0;
        
        [scrollViewDetail addSubview:labelDetailedMsg];
        
    }
    return self;
}


-(void)DemandDetailsViewSetTitle:(NSString *)strTitle
                            Time:(NSString *)strTime
                     DesignerNum:(NSString *)strDesignerNum
                     DesignerPic:(NSArray *)arrDesignerPic
{
    labelTitle.text = strTitle;
    labelTime.text = strTime;
    labelDesignerNum.text = [NSString stringWithFormat:@"%@个设计师抢单",strDesignerNum];
    
    //抢单设计师图片赋值
    for (int i = 0; i <arrDesignerPic.count; i++) {
        if (i<2) {
            UIImageView * imgTemp = [[UIImageView alloc]initWithFrame:iphone_rect_scale(300-i*33, 85, 28, 28)];
            [imgTemp setImage:[UIImage imageNamed:arrDesignerPic[i]]];
            [scrollViewDetail addSubview:imgTemp];
        }
    }
    
}


-(void)DemandDetailsViewSetArea:(NSString *)strArea
                      HouseType:(NSString *)strHouseType
                          Style:(NSString *)strStyle
                        Address:(NSString *)strAddress
                         Budget:(NSString *)strBudget
                   HouseTypeImg:(NSString *)strHouseTypeImg
                    DetailedMsg:(NSString *)strDetailedMsg
{
    labelArea.text = strArea;
    labelHouseType.text = strHouseType;
    labelStyle.text = strStyle;
    labelAddress.text = strAddress;
    labelBudget.text = strBudget;
    
    imgHouseType.image = [UIImage imageNamed:strHouseTypeImg];
    
    labelDetailedMsg.text = strDetailedMsg;
    
    //计算高度
    CGSize size = CGSizeMake(labelDetailedMsg.frame.size.width, 1000);
    CGRect labelRect = [strDetailedMsg boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:labelDetailedMsg.font forKey:NSFontAttributeName] context:nil];
    labelDetailedMsg.frame = CGRectMake(labelDetailedMsg.frame.origin.x, labelDetailedMsg.frame.origin.y, labelRect.size.width, labelRect.size.height);
    
    
    [scrollViewDetail setContentSize:CGSizeMake(MainView_Width, CGRectGetMaxY(labelDetailedMsg.frame)+10)];
    
}

@end
