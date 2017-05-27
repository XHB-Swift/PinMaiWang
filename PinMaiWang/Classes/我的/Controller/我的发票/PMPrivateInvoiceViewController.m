//
//  PMPrivateInvoiceViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/22.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMPrivateInvoiceViewController.h"
#import "BLAreaPickerView.h"

@interface PMPrivateInvoiceViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,BLPickerViewDelegate>
@property (nonatomic,strong) UITableView * privateTbaleView;
@property (nonatomic,strong) NSArray * dataSource;

// 单位名称
@property (nonatomic,strong) UITextField * unitName;
// 纳税人识别码
@property (nonatomic,strong) UITextField * taxpayer;
// 注册电话
@property (nonatomic,strong) UITextField * registerNumber;
// 注册地址
@property (nonatomic,strong) UITextField * registeAddress;
// 开户银行
@property (nonatomic,strong) UITextField * bankName;
// 银行账户
@property (nonatomic,strong) UITextField * bankAccount;
// 收票人姓名
@property (nonatomic,strong) UITextField * name;
// 收票人电话
@property (nonatomic,strong) UITextField * phone;
// 选择区域
@property (nonatomic,strong) UILabel * area;
// 详细地址
@property (nonatomic,strong) UITextField * textField;

@property (nonatomic,strong) BLAreaPickerView * pickerView;
@end

@implementation PMPrivateInvoiceViewController

-(UITableView *)privateTbaleView{
    
    if (!_privateTbaleView) {
        _privateTbaleView =[[UITableView alloc]initWithFrame:CGRectMake(10, 74, XHB_SCREEN_WIDTH-20, XHB_SCREEN_HEIGHT-135) style:UITableViewStylePlain];
        _privateTbaleView.delegate = self;
        _privateTbaleView.dataSource = self;
        [_privateTbaleView registerClass:[UITableViewCell classForKeyedUnarchiver] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _privateTbaleView;
}

-(NSArray *)dataSource{
    
    if (!_dataSource) {
        _dataSource = @[@"单位名称",@"纳税人识别码",@"注册电话",@"注册地址",@"开户银行",@"银行账户",@"收票人姓名",@"收票人电话",@"选择区域",@"详细地址"];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"增值税专用发票";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(XHB_SCREEN_WIDTH/4, self.privateTbaleView.maxY+10, XHB_SCREEN_WIDTH-((XHB_SCREEN_WIDTH/4)*2), 40);
    button.layer.cornerRadius = 5.0;
    button.layer.masksToBounds = YES;
    button.backgroundColor = XHBRGBColor(58, 148, 243);
    [button setTitle:@"保存" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self .view addSubview:button];

    [self.view addSubview:self.privateTbaleView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    switch (indexPath.row) {
        case 0:
            self.unitName = [[UITextField alloc]initWithFrame:CGRectMake(self.privateTbaleView.width/2.5+15, 6, self.privateTbaleView.width/2, 30)];
            self.unitName.font = [UIFont systemFontOfSize:12.0];
            self.unitName.delegate = self;
            [cell addSubview:self.unitName];
            break;
        case 1:
            self.taxpayer = [[UITextField alloc]initWithFrame:CGRectMake(self.unitName.x, self.unitName.y, self.unitName.width, self.unitName.height)];
            self.taxpayer.font = [UIFont systemFontOfSize:12.0];
            self.taxpayer.delegate = self;
            [cell addSubview:self.taxpayer];
            break;
        case 2:
            self.registerNumber = [[UITextField alloc]initWithFrame:CGRectMake(self.taxpayer.x, self.taxpayer.y, self.taxpayer.width, self.taxpayer.height)];
            self.registerNumber.font = [UIFont systemFontOfSize:12.0];
            self.registerNumber.delegate = self;
            [cell addSubview:self.registerNumber];
            
            break;
        case 3:
            self.registeAddress = [[UITextField alloc]initWithFrame:CGRectMake(self.registerNumber.x, self.registerNumber.y, self.registerNumber.width, self.registerNumber.height)];
            self.registeAddress.font = [UIFont systemFontOfSize:12.0];
            self.registeAddress.delegate = self;
            [cell addSubview:self.registeAddress];
            break;
        case 4:
            self.bankName = [[UITextField alloc]initWithFrame:CGRectMake(self.privateTbaleView.width/2.5+15,6, self.privateTbaleView.width/2 , 30)];
            self.bankName.font = [UIFont systemFontOfSize:12.0];
            self.bankAccount.delegate = self;
            [cell addSubview:self.bankName];
            break;
        case 5:
            self.bankAccount = [[UITextField alloc]initWithFrame:CGRectMake(self.bankName.x, self.bankName.y, self.bankName.width, self.bankName.height)];
            self.bankAccount.font = [UIFont systemFontOfSize:12.0];
            self.name.delegate = self;
            [cell addSubview:self.bankAccount];
            break;
        case 6:
            self.name =[[UITextField alloc]initWithFrame:CGRectMake(self.bankAccount.x, self.bankAccount.y, self.bankAccount.width, self.bankAccount.height)];
            self.name.font = [UIFont systemFontOfSize:12.0];
            self.name.delegate = self;
            [cell addSubview:self.name];
            break;
        case 7:
            self.phone = [[UITextField alloc]initWithFrame:CGRectMake(self.name.x, self.name.y, self.name.width, self.name.height)];
            self.phone.font = [UIFont systemFontOfSize:12.0];
            self.phone.delegate = self;
            [cell addSubview:self.phone];
            break;
        case 8:
            self.area = [[UILabel alloc]initWithFrame:CGRectMake(self.phone.x, self.phone.y, self.phone.width, self.phone.height)];
            self.area.font = [UIFont systemFontOfSize:12.0];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            [cell addSubview:self.area];
            break;
        case 9:
            self.textField = [[UITextField alloc]initWithFrame:CGRectMake(self.area.x, self.area.y, self.area.width, self.area.height)];
            self.textField.font = [UIFont systemFontOfSize:12.0];
            self.textField.delegate = self;
            [cell addSubview:self.textField];
        default:
            break;
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 8) {
        self.pickerView = [[BLAreaPickerView alloc]initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH, 150)];
        self.pickerView.pickViewBackgroundColor = XHBRGBColor(255, 255, 255);
        self.pickerView.pickViewDelegate = self;
        [self.pickerView bl_show];
    }

}

-(void)bl_selectedAreaResultWithProvince:(NSString *)provinceTitle city:(NSString *)cityTitle area:(NSString *)areaTitle{
    
    self.area.text = [NSString stringWithFormat:@"%@%@%@",provinceTitle,cityTitle,areaTitle];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    return YES;
}

-(void)buttonAction:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}



@end
