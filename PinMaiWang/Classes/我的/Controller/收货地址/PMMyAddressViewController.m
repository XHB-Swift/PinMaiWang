//
//  PMMyAddressViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMMyAddressViewController.h"
#import "PMMyAddressTableViewCell.h"
#import "PMUser.h"
#import "PMAddNewAddresssViewController.h"

@interface PMMyAddressViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UIButton * addBtn;


@end

@implementation PMMyAddressViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64-55) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[PMMyAddressTableViewCell class] forCellReuseIdentifier:NSStringFromClass([PMMyAddressTableViewCell class])];
        _tableView.rowHeight = 145;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

-(UIButton *)addBtn{
    
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _addBtn.frame = CGRectMake(0, self.view.bounds.size.height-55, self.view.bounds.size.width, 55);
        _addBtn.backgroundColor = [UIColor redColor];
        [_addBtn setTitle:@"添加新地址" forState:UIControlStateNormal];
        _addBtn.titleLabel.font = [UIFont systemFontOfSize:20.0];
        [_addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(AddBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor =XHBRGBColor(244, 244, 244);
    self.title = @"收货地址";
    
    [self.view addSubview:self.addBtn];
    [self.view addSubview:self.tableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userAddressDidChange:) name:PMUserAddressListChangeMsg object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(userEditAction:) name:@"userEditAddress" object:nil];

}

- (void)userAddressDidChange:(NSNotification *)msg {
    
    if (msg.object && [msg.object isEqualToString:PMUserAddressListDidChanged]){
        
        [self.tableView reloadData];
        NSLog(@"%@,,,,,%ld", msg.object, [[PMUser shareUser] countOfAddress]);
    }
    
}

-(void)AddBtnAction:(UIButton *)sender{
    
    PMAddNewAddresssViewController *VC = [[PMAddNewAddresssViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    
}

-(void)userEditAction:(NSNotification *)sender{
    
    int num = [sender.userInfo[@"Value"] intValue];
    NSLog(@"num = %d",num);
    if (num == 100101011) {
        PMAddNewAddresssViewController *VC = [[PMAddNewAddresssViewController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[PMUser shareUser] countOfAddress];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PMMyAddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PMMyAddressTableViewCell class]) forIndexPath:indexPath];
    cell.name.text = [[PMUser shareUser] addressAtIndex:indexPath.row][@"name"];
    cell.number.text = [[PMUser shareUser] addressAtIndex:indexPath.row][@"phoneNum"];
    NSString *text = [[PMUser shareUser] addressAtIndex:indexPath.row][@"region"];
    NSString *num = [[PMUser shareUser] addressAtIndex:indexPath.row][@"ditailsAddress"];
    
    NSString *xiangxi = [NSString stringWithFormat:@"%@%@",text,num];
    cell.address.text = xiangxi;
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [[PMUser shareUser] removeAddressAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"删除";
}



@end
