//
//  PMMyAccountViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMMyAccountViewController.h"

@interface PMMyAccountViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIView * topView;
@property (nonatomic,strong) UITableView * myAccountTbaleView;
@property (nonatomic,strong) NSArray * dataSource;

@end

@implementation PMMyAccountViewController

-(UIView *)topView{
    
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT/5)];
        _topView.backgroundColor = XHBRGBColor(58, 148, 231);
        // 当前余额
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, _topView.width/3, 30)];
        label.text = @"当前余额(元)";
        label.textColor = [UIColor whiteColor];
        
        UILabel *money = [[UILabel alloc]initWithFrame:CGRectMake(label.x, label.maxY+5, _topView.width-40, _topView.height-label.height-20)];
        money.font = [UIFont systemFontOfSize:40];
        money.textColor = [UIColor whiteColor];
        money.text = [NSString stringWithFormat:@"%@%@",@"¥",@"0.00"];
        [_topView addSubview:label];
        [_topView addSubview:money];
    }
    return _topView;
}


-(NSArray *)dataSource{
    
    if (!_dataSource) {
     
        _dataSource = @[@[@"转入金额",@"消费金额",@"提现金额"],@[@"充值",@"提现",@"流水"]];
    }
    return _dataSource;
}

-(UITableView *)myAccountTbaleView{
    
    if (!_myAccountTbaleView) {
        
        if ([[[UIDevice currentDevice]systemName]floatValue] >= 7.0 ? YES:NO) {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _myAccountTbaleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT*0.7+10) style:UITableViewStyleGrouped];
        _myAccountTbaleView.delegate = self;
        _myAccountTbaleView.dataSource = self;
        _myAccountTbaleView.tableHeaderView = self.topView;
        _myAccountTbaleView.backgroundColor = XHBRGBColor(244, 244, 244);
        _myAccountTbaleView.showsVerticalScrollIndicator = NO;
        _myAccountTbaleView.showsHorizontalScrollIndicator = NO;
        _myAccountTbaleView.separatorColor = [UIColor grayColor];
        
    }return _myAccountTbaleView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view .backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"我的账户";
    [self.view addSubview:self.myAccountTbaleView];
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataSource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = self.dataSource[section];
    return array.count;
    
}

static NSString *account = @"accountCell";
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:account];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:account];
    }
    cell.backgroundColor = [UIColor whiteColor];
    NSArray *array = self.dataSource[indexPath.section];
    cell.textLabel.text = array[indexPath.row];
    
    if (indexPath.section == 0) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%@",@"¥",@"0.00"];
        if (indexPath.row == 0) {
            cell.detailTextLabel.textColor = [UIColor redColor];
        }else if (indexPath.row == 1){
            cell.detailTextLabel.textColor = [UIColor blueColor];
        }
        
    }else{
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}



@end
