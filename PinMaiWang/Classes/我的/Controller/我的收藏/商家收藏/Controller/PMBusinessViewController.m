//
//  PMBusinessViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/25.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMBusinessViewController.h"
#import "PMBusinessTableViewCell.h"

@interface PMBusinessViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray<NSDictionary *> * dataSource;
@property (nonatomic,strong) UITableView * businessTableView;

@end

@implementation PMBusinessViewController

-(UITableView *)businessTableView{
    
    if (!_businessTableView) {
        _businessTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT)];
        _businessTableView.delegate = self;
        _businessTableView.dataSource = self;
        [_businessTableView registerClass:[PMBusinessTableViewCell class] forCellReuseIdentifier:NSStringFromClass([PMBusinessTableViewCell class])];
    }
    return _businessTableView;
}

-(NSMutableArray<NSDictionary *> *)dataSource{
    
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithObjects:@{@"title":@"海蓝宝",@"origin":@"法国"},@{@"title":@"卡梅隆",@"origin":@"加拿大"},@{@"title":@"锐迪",@"origin":@"美国"}, nil];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titles = @[@"供应商",@"所在地",@"操作"];
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(idx*XHB_SCREEN_WIDTH/3, 10, XHB_SCREEN_WIDTH/3, 30)];
        label.text = obj;
        label.backgroundColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15.0];
        [self.view addSubview:label];
    }];
    
    [self.view addSubview:self.businessTableView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cance:) name:@"CanceNotificationName" object:nil];
    
}


-(void)cance:(NSNotification *)sender{
    int num = [sender.userInfo[@"Value"] intValue];
    if (num == 10086) {
        XHBLogObject(@"取消");
        UIAlertController *VC = [UIAlertController alertControllerWithTitle:@"提示" message:@"您确认删除该条信息吗?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *cance = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [VC addAction:cance];
        [VC addAction:ok];
        [self presentViewController:VC animated:YES completion:nil];
        
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PMBusinessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PMBusinessTableViewCell class]) forIndexPath:indexPath];
    cell.dictionary = self.dataSource[indexPath.row];
    
    return cell;
}


-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}

@end
