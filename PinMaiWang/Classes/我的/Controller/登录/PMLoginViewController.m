//
//  PMLoginViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMLoginViewController.h"
#import "LZHTextField.h"

@interface PMLoginViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UIImageView * logoView;
@property (nonatomic,strong) UITextField * userName;
@property (nonatomic,strong) UITextField * userPwd;

@property (nonatomic,strong) UIButton * loginBtn;
@property (nonatomic,strong) UIButton * registerBtn;
@property (nonatomic,strong) UIButton * findBtn;

@end

@implementation PMLoginViewController

-(UIImageView *)logoView{
    
    if (!_logoView) {
        _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(XHB_SCREEN_WIDTH/3, 128, XHB_SCREEN_WIDTH/3, 60)];
        _logoView.image = [UIImage resizeImage:[UIImage imageNamed:@"logo"] toNewSize:CGSizeMake(XHB_SCREEN_WIDTH/3, 80)];
        
    }
    return _logoView;
}

-(UITextField *)userName{
    
    if (!_userName) {
        _userName = [[LZHTextField alloc]initWithFrame:CGRectMake(40, self.logoView.maxY+40, XHB_SCREEN_WIDTH-80, 40)];
        _userName.borderStyle = UITextBorderStyleRoundedRect;
        _userName.leftView = [[UIImageView alloc]initWithImage:[UIImage resizeImage:[UIImage imageNamed:@"login_01"] toNewSize:CGSizeMake(20, 20)]];
        _userName.leftViewMode = UITextFieldViewModeAlways;
        _userName.placeholder = @"请输入用户名";
        _userName.clearButtonMode = UITextFieldViewModeWhileEditing;
        _userName.delegate = self;
    }
    return _userName;
}

-(UITextField *)userPwd{
    
    if (!_userPwd) {
        _userPwd = [[LZHTextField alloc]initWithFrame:CGRectMake(self.userName.x, self.userName.maxY+10, self.userName.width, self.userName.height)];
        _userPwd .borderStyle = UITextBorderStyleRoundedRect;
        _userPwd.leftView = [[UIImageView alloc]initWithImage:[UIImage resizeImage:[UIImage imageNamed:@"login_02"] toNewSize:CGSizeMake(15, 20)]];
        _userPwd.leftViewMode = UITextFieldViewModeAlways;
        _userPwd.placeholder = @"请输入密码";
        _userPwd.clearButtonMode = UITextFieldViewModeWhileEditing;
        _userPwd.delegate = self;
    }
    return _userPwd;
}

-(UIButton *)loginBtn{
    
    if (!_loginBtn) {
        
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.frame = CGRectMake(self.userPwd.x, self.userPwd.maxY+15, self.userPwd.width, self.userPwd.height);
        _loginBtn.backgroundColor = XHBRGBColor(58, 148, 231);
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:20.0];
        _loginBtn .titleLabel.textAlignment = NSTextAlignmentCenter;
        _loginBtn.layer.cornerRadius = 5.0;
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

-(UIButton *)registerBtn{
    
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerBtn.frame = CGRectMake(self.loginBtn.x, self.loginBtn.maxY+10, self.loginBtn.width/3, 30);
        [_registerBtn setTitle:@"用户注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_registerBtn addTarget:self action:@selector(registerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}

-(UIButton *)findBtn{
    
    if (!_findBtn) {
        _findBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _findBtn.frame = CGRectMake(self.registerBtn.maxX+self.registerBtn.width, self.registerBtn.y, self.registerBtn.width, self.registerBtn.height);
        [_findBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_findBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _findBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_findBtn addTarget:self action:@selector(finBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _findBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"账户登录";
    [self.view addSubview:self.logoView];
    [self.view addSubview:self.userName];
    [self.view addSubview:self.userPwd];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.registerBtn];
    [self.view addSubview:self.findBtn];
    
}

-(void)loginBtnAction:(UIButton *)sender{
    
    NSLog(@"登录");
}

-(void)registerBtnAction:(UIButton *)sender{
    
    NSLog(@"用户注册");
}

-(void)finBtnAction:(UIButton *)sender{
    
    NSLog(@"忘记密码");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
    
}

@end
