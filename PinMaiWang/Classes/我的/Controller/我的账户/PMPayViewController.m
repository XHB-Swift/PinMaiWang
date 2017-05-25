//
//  PMPayViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/23.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMPayViewController.h"
#import "PMPayTableViewCell.h"

@interface PMPayViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * payTableView;
@property (nonatomic,strong) UILabel * label;
@property (nonatomic,strong) NSArray<NSDictionary *> * dataSource;
@property (nonatomic,strong) UIButton * payBtn;
@property (nonatomic,assign) int  selectCell;

@end

@implementation PMPayViewController


-(UITableView *)payTableView{
    
    if (!_payTableView) {
        
        _payTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.label.maxY+10, XHB_SCREEN_WIDTH, 135) style:UITableViewStylePlain];
        _payTableView.delegate = self;
        _payTableView.dataSource = self;
        _payTableView.backgroundColor = [UIColor whiteColor];
        [_payTableView registerClass:[PMPayTableViewCell class] forCellReuseIdentifier:NSStringFromClass([PMPayTableViewCell class])];
        _payTableView.showsVerticalScrollIndicator = NO;
        _payTableView.showsHorizontalScrollIndicator = NO;
        _payTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

        [self.view addSubview:self.payTableView];
    }
    return _payTableView;
}

-(NSArray<NSDictionary *> *)dataSource{
    
    if (!_dataSource) {
        _dataSource = @[@{@"img":@"zhifu_04",@"title":@"个人银行(借记卡)支付"},@{@"img":@"zhifu_08",@"title":@"支付宝支付"},@{@"img":@"zhifu_05",@"title":@"微信支付"}];
    }
    return _dataSource;
}

-(UIButton *)payBtn{
    
    if (!_payBtn) {
        _payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _payBtn.frame = CGRectMake(XHB_SCREEN_WIDTH/4, self.payTableView.maxY+20, XHB_SCREEN_WIDTH/2, 35);
        _payBtn.backgroundColor = XHBRGBColor(58, 148, 243);
        [_payBtn setTitle:@"充值" forState:UIControlStateNormal];
        [_payBtn addTarget:self action:@selector(payBtnAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _payBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"充值-我的账户";
    self.selectCell = -1;
    UILabel *rmbLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, XHB_SCREEN_WIDTH, 40)];
    rmbLabel.numberOfLines = 0;
    rmbLabel .backgroundColor = [UIColor whiteColor];
    rmbLabel.font = [UIFont systemFontOfSize:15.0];
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"您正在为拼买网账户充值,请立即完成支付!金额为:%@.00元",self.money]];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(24, self.money.length+4)];
    rmbLabel.attributedText = AttributedStr;
    [self.view addSubview:rmbLabel];
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, rmbLabel.maxY, rmbLabel.width, rmbLabel.height)];
    self.label.backgroundColor = [UIColor whiteColor];
    self.label.text = @"   充值方式";
    [self.view addSubview:self.label];
    [self.view addSubview:self.payBtn];
}


-(void)payBtnAction:(UIButton *)sender{
    
    XHBLogObject(@"充值");
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PMPayTableViewCell class]) forIndexPath:indexPath];
    
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    indexPath.row == self.selectCell ?(cell.accessoryType = UITableViewCellAccessoryCheckmark):(cell.accessoryType = UITableViewCellAccessoryNone);
    cell.imageView.image =[UIImage resizeImage:[UIImage imageNamed:self.dataSource[indexPath.row][@"img"]] toNewSize:CGSizeMake(24, 24)];
    cell.textLabel.text = self.dataSource[indexPath.row][@"title"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.selectCell = (int)indexPath.row;
    PMPayTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    switch (indexPath.row) {
        case 0:
            XHBLogObject(@"银行卡");
            break;
        case 1:
            XHBLogObject(@"支付宝");
            break;
        case 2:
            XHBLogObject(@"微信");
        default:
            break;
    }
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
}




@end
