//
//  PMMineHeaderView.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMMineHeaderView.h"

@implementation PMMineHeaderView

+ (NSString *)headerIdentifier {
    
    return NSStringFromClass([PMMineHeaderView class]);
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initializeHeaderView];
    }
    
    return self;
}

- (void)initializeHeaderView {
    
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT/1.8)];
    header.backgroundColor = [UIColor whiteColor];
    header.userInteractionEnabled = YES;
    
    UIImageView *bgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, header.width, header.height*0.6)];
    bgView.image = [UIImage imageNamed:@"me_bg"];
    bgView.userInteractionEnabled = YES;
    
    UIButton *headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headBtn.frame = CGRectMake(bgView.width/2-40, 20, 80, 80);
    [headBtn setImage:[UIImage resizeImage:[UIImage imageNamed:@"headicon"] toNewSize:CGSizeMake(80, 80)] forState:UIControlStateNormal];
    [headBtn addTarget:self action:@selector(headBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    headBtn.layer.cornerRadius = 40;
    headBtn.layer.masksToBounds = YES;
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(header.width/2-40, headBtn.maxY+10, headBtn.width, 30);
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [loginBtn setTitle:@"登录/注册" forState:UIControlStateNormal];
    loginBtn.layer.borderWidth = 1.0;
    loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark 余额
    UILabel *lalances = [[UILabel alloc]initWithFrame:CGRectMake(0, loginBtn.maxY+10, header.width/2-2, 30)];
    lalances.textAlignment = NSTextAlignmentCenter;
    lalances.font = [UIFont systemFontOfSize:12.0];
    lalances.text = @"账户余额\n0.00";
    lalances.numberOfLines = 0;
    lalances.textColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(lalances.maxX, loginBtn.maxY+10, 1, 30)];
    view.backgroundColor = [UIColor grayColor];
    
#pragma mark 积分
    UILabel *integrate = [[UILabel alloc]initWithFrame:CGRectMake(view.maxX, loginBtn.maxY+10, lalances.width, lalances.height)];
    integrate.textAlignment = NSTextAlignmentCenter;
    integrate.font = [UIFont systemFontOfSize:12.0];
    integrate.text = @"我的积分\n0";
    integrate.numberOfLines = 0;
    integrate.textColor = [UIColor whiteColor];
    
    UILabel *myorder = [[UILabel alloc]initWithFrame:CGRectMake(10, bgView.maxY+5, bgView.width/2, 40)];
    myorder.text = @"我的订单";
    
    UIButton *allOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    allOrderBtn.frame = CGRectMake(myorder.maxX, bgView.maxY+5, myorder.width, 40);
    [allOrderBtn setTitle:@"查看全部订单" forState:UIControlStateNormal];
    [allOrderBtn setImage:[UIImage resizeImage:[UIImage imageNamed:@"next_01"] toNewSize:CGSizeMake(10, 15)] forState:UIControlStateNormal];
    allOrderBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    allOrderBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -myorder.width-40);
    allOrderBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [allOrderBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [allOrderBtn addTarget:self action:@selector(allAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, myorder.maxY+5, XHB_SCREEN_WIDTH, 3)];
    bottomView.backgroundColor = XHBRGBColor(244, 244, 244);
    
#pragma mark 我的订单功能按钮
    NSArray *titles = @[@"待付款",@"待发货",@"待收货",@"待评价",@"已取消"];
    NSArray *imgArray = @[@"me_03",@"me_04",@"me_05",@"me_06",@"me_15"];
    for (int i = 0; i < 5; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*((XHB_SCREEN_WIDTH-30)/5+5)+5, bottomView.maxY+10, (XHB_SCREEN_WIDTH-30)/5, 70);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setImage:[UIImage resizeImage:[UIImage imageNamed:imgArray[i]] toNewSize:CGSizeMake(25, 25)] forState:UIControlStateNormal];
        if (UI_IS_IPHONE5) {
            button.titleEdgeInsets = UIEdgeInsetsMake(30, -30, 0, 0);
            button.imageEdgeInsets = UIEdgeInsetsMake(-30, 10, 0, 0);
        }else if (UI_IS_IPHONE6){
            button.titleEdgeInsets = UIEdgeInsetsMake(45, -30, 0, 0);
            button.imageEdgeInsets = UIEdgeInsetsMake(-10, 10, 0, 0);
        }else{
            button.titleEdgeInsets = UIEdgeInsetsMake(55, -30, 0, 0);
            button.imageEdgeInsets = UIEdgeInsetsMake(-10, 10, 0, -20);
        }
        
        button.tag = i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:button];
    }
    
    [header addSubview:bgView];
    [bgView addSubview:headBtn];
    [bgView addSubview:loginBtn];
    [bgView addSubview:lalances];
    [bgView addSubview:view];
    [bgView addSubview:integrate];
    [header addSubview:myorder];
    [header addSubview:allOrderBtn];
    [header addSubview:bottomView];
    
    [self addSubview:header];
    
}

-(void)headBtnAction:(UIButton *)sender{
    
    NSLog(@"头像");
}

-(void)loginAction:(UIButton *)sender{
    
    NSLog(@"登录/注册");
}

-(void)allAction:(UIButton *)sender{
    
    NSLog(@"查看全部订单");
}

-(void)buttonAction:(UIButton *)sender{
    
    switch (sender.tag) {
        case 0:
            NSLog(@"待付款");
            break;
        case 1:
            NSLog(@"待发货");
            break;
        case 2:
            NSLog(@"待收货");
            break;
        case 3:
            NSLog(@"待评价");
            break;
        case 4:
            NSLog(@"已取消");
        default:
            break;
    }
}


@end
