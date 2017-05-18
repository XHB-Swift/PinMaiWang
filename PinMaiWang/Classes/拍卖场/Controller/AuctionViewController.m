//
//  AuctionViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/15.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "AuctionViewController.h"

@interface AuctionViewController ()
@property (nonatomic,strong) UISegmentedControl * segment;
@property (nonatomic,strong) UIView * oneView;

@property (nonatomic,strong) UIView * twoView;
@property (nonatomic,strong) UIView * threeView;

@end

@implementation AuctionViewController

-(UIView *)oneView{
    
    if (!_oneView) {
        self.oneView = [[UIView alloc]initWithFrame:CGRectMake(0, 104, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT)];
        self.oneView.backgroundColor = XHBRGBColor(244, 244, 244);
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT/1.5)];
        label.backgroundColor = [UIColor whiteColor];
        label.numberOfLines = 0;
        label.font = [UIFont systemFontOfSize:15.0];
        label.textColor = XHBRGBColor(58, 148, 231);
        label.text = @"拍卖规则:\n1、参加拍卖前，用户需要确保账户余额不低于拍卖商品总货值的30%。\n2、用户出价必须为整数，且高于上一次的出价。 出价后系统将从帐户余额中冻结所拍商品总货值的30%。\n3、同一用户可以对一个商品多次出价，拍卖时间结束后以最高价为中标价，若有相同的出价，则先出价者中标。\n4、拍卖结束后，系统将通过短信及站内信通知中标用户。 出价中标者冻结的账户余额将作为订单的定金，拍卖结束后30分钟内，用户需支付订单剩余货款。若用户未在拍卖结束后30分钟内完成支付，系统将扣除冻结资金，不予返还，中标订单作废。 没有中标的用户，系统将释放冻结的账户余额。\n5、用户可以在订单信息-拍卖场中查看自己的所有出价记录，并查看是否中标。";
        label.lineBreakMode = NSLineBreakByCharWrapping;
        
        [self.oneView addSubview:label];
        [self.view addSubview:self.oneView];
        
        
    }
    return _oneView;
}

-(UIView *)twoView{
    
    if (!_twoView) {
        
        self.twoView = [[UIView alloc]initWithFrame:CGRectMake(0, 104, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT)];
        self.twoView.backgroundColor =[UIColor whiteColor];
        [self.view addSubview:self.twoView];
        
    }return _twoView;
}
-(UIView *)threeView{
    
    if (!_threeView) {
        self.threeView = [[UIView alloc]initWithFrame:CGRectMake(0, 104, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT)];
        self.threeView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.threeView];
    }
    return _threeView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpSegmnetedController];

}

-(void)setUpSegmnetedController{
    
    [self.view bringSubviewToFront:self.oneView];
    self.segment = [[UISegmentedControl alloc]initWithItems:@[@"正在拍卖",@"即将开始",@"拍卖结束"]];
    self.segment.frame = CGRectMake(5, 74, XHB_SCREEN_WIDTH-10, 30);
    self.segment.layer.cornerRadius = 3.0;
    self.segment.layer.masksToBounds = YES;
    
    self.segment.selectedSegmentIndex = 0;
    self.segment.layer.borderColor = XHBRGBColor(245, 30, 75).CGColor;
    self.segment.layer.borderWidth = 1.0;
    
    self.segment.tintColor = XHBRGBColor(245, 30, 75);
    self.segment.backgroundColor = [UIColor whiteColor];
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0],NSForegroundColorAttributeName: [UIColor whiteColor]};
    [self.segment setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0],NSForegroundColorAttributeName: XHBRGBColor(245, 30, 75)};
    [self.segment setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    [self.segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segment];
    
    
}

-(void)segmentAction:(UISegmentedControl *)sender{
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            NSLog(@"正在拍卖");
            [self.view bringSubviewToFront:self.oneView];
            break;
        case 1:
            NSLog(@"即将开始");
            [self.view bringSubviewToFront:self.twoView];
            break;
        case 2:
            NSLog(@"拍卖结束");
            [self.view bringSubviewToFront:self.threeView];
        default:
            break;
    }
}




@end
