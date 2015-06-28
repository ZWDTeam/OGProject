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
#import "OGSendTypeOptionViewController.h"
#import "PhotoOptional.h"
#import "MRProgressOverlayView.h"

@interface OGSendHelpViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,OGSendHelpTableViewCell1Delegate>
@property (weak, nonatomic) IBOutlet UIButton *sendHelpBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong , nonatomic)NSArray * titles;
@property (strong , nonatomic)NSArray *placeholders;

@property (strong , nonatomic)OGSendHelpModel * model;

@property (strong , nonatomic)UIView * tableViewFootView;


@end

@implementation OGSendHelpViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _model = [OGSendHelpModel new];
        _titles = @[@"标题",@"面积",@"户型",@"装修风格",@"上传户型",@"小区民称",@"预算"];
        _placeholders = @[@"请输入需求标题",@"请输入面积",@"请选择户型",@"请选择1至2种装修风格",@"请上传户型图",@"请选择所在小区",@"请选择软装预算"];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sendHelpBtn.layer.cornerRadius = CGRectGetHeight(self.sendHelpBtn.frame)/2.0f;
    self.sendHelpBtn.layer.masksToBounds = YES;
    self.sendHelpBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.sendHelpBtn.layer.borderWidth = 1.0f;
    
    self.tableView.tableFooterView= self.tableViewFootView;
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}


- (UIView *)tableViewFootView{
    if (!_tableViewFootView) {
        _tableViewFootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
        _tableViewFootView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 150-20)];
        textView.backgroundColor = [UIColor whiteColor];
        textView.font = [UIFont systemFontOfSize:16];
        textView.delegate = self;
        textView.returnKeyType = UIReturnKeyDone;
        [_tableViewFootView addSubview:textView];
    }
    return _tableViewFootView;
}

#pragma mark - Action
- (IBAction)sendHelpBtnAction:(id)sender {
    [self.view endEditing:YES];
    
    if (self.model.title.length ==0) {
        [self showAletView:@"标题不能为空"];
        return;
    }
    if (self.model.area.length ==0) {
        [self showAletView:@"请输入面积"];
        return;
    }

    if (self.model.type.length ==0) {
        [self showAletView:@"请选择户型"];
        return;
    }
    if (self.model.style.length ==0) {
        [self showAletView:@"请选择装修风格"];
        return;
    }
    if (self.model.typeImage== nil) {
        [self showAletView:@"请上传户型图片"];
        return;
    }
    
    if (self.model.villgeName.length ==0) {
        [self showAletView:@"请选择小区名称"];
        return;
    }
    if (self.model.money.length ==0) {
        [self showAletView:@"请选择预算"];
        return;
    }


    
    
    MRProgressOverlayView *progressView = [MRProgressOverlayView new];
    progressView.titleLabelText = @"提交中...";
    [self.navigationController.view addSubview:progressView];
    [progressView show:YES];
    
    [self performBlock:^{
        progressView.mode = MRProgressOverlayViewModeCheckmark;
        progressView.titleLabelText = @"提交成功";

        [self performBlock:^{
            [progressView dismiss:YES];
            [self.navigationController popViewControllerAnimated:YES];
        } afterDelay:0.5];
        
    } afterDelay:2.0];

}

- (void)performBlock:(void(^)())block afterDelay:(NSTimeInterval)delay {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}

- (void)showAletView:(NSString *)text{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:text delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil , nil];
    [alert show];
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
        cell.delegate = self;
    }
    
    cell.titleLabel.text = _titles[indexPath.row];
    cell.contentTedtField.placeholder = _placeholders[indexPath.row];
    
    switch (indexPath.row) {
        case 0:
        {
            cell.contentTedtField.enabled = YES;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.contentTedtField.text  =self.model.title;

        }
            break;
        case 1:
        {
            cell.contentTedtField.enabled = YES;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.contentTedtField.text  =self.model.area;
            cell.accessoryView = [self accessoryLabel];


        }
            break;

        case 2:
        {
            cell.contentTedtField.enabled = NO;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.contentTedtField.text  =self.model.type;

        }
            break;

        case 3:
        {
            cell.contentTedtField.enabled = NO;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.contentTedtField.text  =self.model.type;


        }
            break;

        case 4:
        {
            cell.contentTedtField.enabled = NO;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            if (self.model.typeImage) {
                cell.contentTedtField.text  =@" ";
                cell.accessoryView = [self accessoryView:self.model.typeImage];
            }else{
                cell.contentTedtField.text  =nil;
            }

        }
            break;

        case 5:
        {
            cell.contentTedtField.enabled = NO;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.contentTedtField.text  =self.model.villgeName;


        }
            break;
        case 6:
        {
            cell.contentTedtField.enabled = NO;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.contentTedtField.text  =self.model.money;


        }
            break;

            
        default:
            break;
    }
    
    return cell;
}

- (UILabel *)accessoryLabel{
    UILabel * l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    l.text = @"mm";
    l.textColor = [UIColor orangeColor];
    l.font = [UIFont systemFontOfSize:15];
    return l;
}


- (UIImageView *)accessoryView:(UIImage *)image{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    imageView.image = image;
    return imageView;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.view endEditing:YES];
    
    _selectedIndexPath = indexPath;
    
    if (indexPath.row >1) {
        if (indexPath.row == 4) {
            [[PhotoOptional newInstance] startMediaBrowser:self isAllowsEditing:YES photoImage:^(UIImage *image) {
                self.model.typeImage = image;
                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            }];
            return;
        }
        
        [self performSegueWithIdentifier:@"OGSendTypeOptionViewController" sender:indexPath];

    }
    
}


//刷新对应的信息
- (void)updataSelectdIndexPathWithText:(NSString *)text{
    switch (_selectedIndexPath.row) {
        case 2:
            self.model.type = text;
            
            break;
        case 3:
            self.model.style = text;

            break;
        case 5:
            self.model.villgeName = text;

            break;
        case 6:
            self.model.money = text;

            break;
            
        default:
            break;
    }
    
    [self.tableView reloadRowsAtIndexPaths:@[_selectedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 键盘通知
static bool _isBegin = NO;
- (void)keyboardWillChange:(NSNotification *)notification{
    if (!_isBegin) return;
    
    NSDictionary * dic = notification.userInfo;
    CGRect rect = [dic[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat y  =self.tableView.contentSize.height - rect.origin.y ;
    [self.tableView setContentOffset:CGPointMake(0, y) animated:NO];
}


#pragma mark -UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    _isBegin = YES;
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    _isBegin = NO;
}


#pragma mark - OGSendHelpTableViewCell1Delegate
- (void)textFieldDidEndEditing:(UITextField *)textField withCell:(OGSendHelpTableViewCell1 *)cell{
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    if (indexPath.row == 0) {
        self.model.title = textField.text;
    }else{
        self.model.area = textField.text;
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    OGSendTypeOptionViewController * controller =  [segue destinationViewController];
    controller.sendhelpController = self;

    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
