//
//  PMAddNewAddresssViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/28.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMAddNewAddresssViewController.h"
#import "PMUser.h"


@interface PMAddNewAddresssViewController ()<UITableViewDelegate,UITableViewDataSource,BLPickerViewDelegate>
@property (nonatomic,strong) UITableView * addTableView;
@property (nonatomic,strong) NSArray * dataSource;
@property (nonatomic, strong) BLAreaPickerView *pickView;
@property (nonatomic,strong) UILabel * address;
@property (nonatomic,strong) UIButton * button;

@property (nonatomic,strong) UITextField * name;
@property (nonatomic,strong) UITextField * phone;
@property (nonatomic,strong) UITextField * detailed;
@property (nonatomic,strong) NSString * longAddress;
@end

@implementation PMAddNewAddresssViewController
-(UITableView *)addTableView{
    
    if (!_addTableView) {
        _addTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*0.6) style:UITableViewStyleGrouped];
        _addTableView.delegate = self;
        _addTableView.dataSource = self;
        _addTableView.backgroundColor = XHBRGBColor(244, 244, 244);
        _addTableView.showsVerticalScrollIndicator = NO;
        _addTableView.showsHorizontalScrollIndicator = NO;
    }
    return _addTableView;
}
-(NSArray *)dataSource{
    
    if (!_dataSource) {
        _dataSource = @[@[@"收货人",@"联系电话"],@[@"所在地区",@"详细地址"]];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    [self.view addSubview:self.addTableView];
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(self.view.bounds.size.width/4, CGRectGetMaxY(self.addTableView.frame)+40, self.view.bounds.size.width/2, 40);
    self.button.backgroundColor = [UIColor redColor];
    [self.button setTitle:@"保存" forState:UIControlStateNormal];
    self.button.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataSource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray*array = self.dataSource[section];
    return array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.section == 0 && indexPath.row == 0) {
        self.name = [[UITextField alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/3, 6, self.view.bounds.size.width/2+30, 30)];
        [cell addSubview:self.name];
    }else if (indexPath.section == 0 && indexPath.row ==1){
        self.phone = [[UITextField alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/3, 6, self.view.bounds.size.width/2+30, 30)];
        [cell addSubview:self.phone];
    }else if (indexPath.section == 1 && indexPath.row == 1){
        self.detailed = [[UITextField alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/3, 6, self.view.bounds.size.width/2+30, 30)];
        [cell addSubview:self.detailed];
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.address = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/3, 6, self.view.bounds.size.width/2+30, 30)];
        self.address.font = [UIFont systemFontOfSize:12.0];
        [cell addSubview:self.address];
    }
    NSArray *array = self.dataSource[indexPath.section];
    cell.textLabel.text = array[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        _pickView = [[BLAreaPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
        _pickView.pickViewDelegate = self;
        _pickView.pickViewBackgroundColor = XHBRGBColor(244, 244, 244);
        [_pickView bl_show];
    }
}

-(void)bl_selectedAreaResultWithProvince:(NSString *)provinceTitle city:(NSString *)cityTitle area:(NSString *)areaTitle{
    
    self.address.text = [NSString stringWithFormat:@"%@%@%@",provinceTitle,cityTitle,areaTitle];
    
}

-(void)buttonAction:(UIButton *)sender{
    
    if ([self.name.text isEqualToString:@""] || [self.phone.text isEqualToString:@""] || [self.address.text isEqualToString:@""]|| [self.detailed.text isEqualToString:@""]) {
        UIAlertController *VC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请添加新地址" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cance = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [VC addAction:cance];
        [VC addAction:ok];
        [self presentViewController:VC animated:YES completion:nil];
        return;
        
    }else{
        NSLog(@"保存");
        [[PMUser shareUser] addAddress:@{@"name":self.name.text,@"phoneNum":self.phone.text,@"region":self.address.text,@"ditailsAddress":self.detailed.text}];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}



@end
