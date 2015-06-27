//
//  OGDemandDetailsView.h
//  OGProject
//
//  Created by ww on 15/6/27.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OGDemandDetailsView : UIView

-(id)initOGDemandDetailsView;


/**
 *  设置需求详情相关信息
 *
 *  @param strTitle       标题
 *  @param strTime        时间
 *  @param strDesignerNum 抢单设计师数量
 *  @param arrDesignerPic 抢单设计师头像--最多为2
 */
-(void)DemandDetailsViewSetTitle:(NSString *)strTitle
                            Time:(NSString *)strTime
                     DesignerNum:(NSString *)strDesignerNum
                     DesignerPic:(NSArray *)arrDesignerPic;


/**
 *  设置需求详情相关信息
 *
 *  @param strArea         面积
 *  @param strHouseType    户型
 *  @param strStyle        装修风格
 *  @param strAddress      小区地址
 *  @param strBudget       预算
 *  @param strHouseTypeImg 户型图
 *  @param strDetailedMsg  详细信息
 */
-(void)DemandDetailsViewSetArea:(NSString *)strArea
                      HouseType:(NSString *)strHouseType
                          Style:(NSString *)strStyle
                        Address:(NSString *)strAddress
                         Budget:(NSString *)strBudget
                   HouseTypeImg:(NSString *)strHouseTypeImg
                    DetailedMsg:(NSString *)strDetailedMsg;




@end
