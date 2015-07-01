//
//  OGRegisterThreeViewController.m
//  OGProject
//
//  Created by ww on 15/7/1.
//  Copyright (c) 2015年 钟伟迪. All rights reserved.
//

#import "OGRegisterThreeViewController.h"

@interface OGRegisterThreeViewController (){
    UIImage * imageData;
    
    
    NSData * imageUpload;
}

@end

@implementation OGRegisterThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设计师注册";
    
    self.btnAddFace.layer.masksToBounds= YES;
    self.btnAddFace.layer.cornerRadius =  8;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//提交
- (IBAction)submit:(id)sender {
    //数据收集--图片data   已经做了压缩处理
    /*--
    imageUpload
    -- */
}
- (IBAction)addFace:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"返回" destructiveButtonTitle:nil otherButtonTitles:@"相机", @"照片库", nil];
    [sheet showInView:self.view.window];

}



#pragma mark - picPickerCtl
-(BOOL)startCameraController{//摄像头
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        return  NO;
    }
    UIImagePickerController * cameraUI = [[UIImagePickerController alloc]init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraUI.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    cameraUI.allowsEditing = NO;
    cameraUI.delegate =self;
    [self presentViewController:cameraUI animated:YES completion:nil];
    return  YES;
}


-(BOOL)startMediaBrowser{//图片库
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]==NO) {
        return NO;
    }
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc]init];
    mediaUI.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    mediaUI.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    mediaUI.delegate =self;
    mediaUI.allowsEditing =YES;
    [self presentViewController:mediaUI animated:YES completion:nil];
    return YES;
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            if (![self startCameraController]) {
                NSLog(@"没有设备");
            }
            break;
        case 1:
            if (![self startMediaBrowser]) {
                NSLog(@"访问不到图片库");
            }
            break;
        case 2:
            break;
        default:
            break;
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
        UIImage * originalImage,*editedImage,*imageToSave;
        if (CFStringCompare((CFStringRef)mediaType,kUTTypeImage, 0)==kCFCompareEqualTo) {
            editedImage = (UIImage *)[info objectForKey:UIImagePickerControllerEditedImage];
            originalImage =(UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
            if (editedImage) {
                imageToSave =editedImage;
            }else{
                imageToSave =originalImage;
            }
            
            imageData = imageToSave;

            
        }
    }else if(picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary){
        NSString * mediaType =[info objectForKey:UIImagePickerControllerMediaType];
        UIImage * originalImage,*editedImage,*imageToSave;
        if (CFStringCompare((CFStringRef)mediaType, kUTTypeImage, 0)==kCFCompareEqualTo) {
            editedImage = (UIImage *)[info objectForKey:UIImagePickerControllerEditedImage];
            originalImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
            if (editedImage) {
                imageToSave =editedImage;
            }else{
                imageToSave =originalImage;
            }
            imageData = imageToSave;
            
            

        }
    }
    
    
    
    //照相机界面取消
    [self dismissViewControllerAnimated:YES completion:^{
        [self eidtImage:imageData];
    }];
    
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [[picker parentViewController]dismissViewControllerAnimated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 照片处理，确保照片一定是正方形

-(void)eidtImage:(UIImage *)imageObj{
    MLImageCrop * imageCrop = [[MLImageCrop alloc]init];
    imageCrop.delegate = self;
    imageCrop.ratioOfWidthAndHeight = 800.0f/800.0f;
    imageCrop.image = imageObj;
    [imageCrop showWithAnimation:YES];
}

-(UIImage *)imgEditWithImg:(UIImage *)img{
    CGImageRef imageRef =img.CGImage;
    CGRect rect = CGRectMake(0.0, 0.0, 800.0, 800.0);
    CGImageRef imageRefRect = CGImageCreateWithImageInRect(imageRef, rect);
    UIImage *imageRect = [[UIImage alloc] initWithCGImage: imageRefRect];
    return imageRect;
}

//图片缩放
-(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
    
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
    
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;
}
- (void)cropImage:(UIImage*)cropImage forOriginalImage:(UIImage*)originalImage{
    UIImage * imageTemp = [self scaleImage:cropImage toScale:800/cropImage.size.width];
    UIImage * imageNew = [self imgEditWithImg:imageTemp];
    [self.btnAddFace setBackgroundImage:imageNew forState:UIControlStateNormal];
    
    imageUpload = UIImageJPEGRepresentation(imageNew, 0.5);
    

    
}
@end
