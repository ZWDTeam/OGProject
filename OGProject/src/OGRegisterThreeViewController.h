//
//  OGRegisterThreeViewController.h
//  OGProject
//
//  Created by ww on 15/7/1.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "MLImageCrop.h"

@interface OGRegisterThreeViewController : UIViewController<UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,MLImageCropDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnAddFace;

@end
