//
//  PMNormalInvoiceViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/22.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMNormalInvoiceViewController.h"
#import "BLAreaPickerView.h"

@interface PMNormalInvoiceViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,BLPickerViewDelegate>
@property (nonatomic,strong) UITableView * normTableView;
@property (nonatomic,strong) NSArray * dataSource;
// 抬头
@property (nonatomic,strong) UITextField * invoiceTitle;
// 收票人姓名
@property (nonatomic,strong) UITextField * name;
// 选择区域
@property (nonatomic,strong) UILabel * area;
// 详细地址
@property (nonatomic,strong) UITextField * detailAddress;
// 收票人号码
@property (nonatomic,strong) UITextField * number;
@property (nonatomic,strong) BLAreaPickerView * prickerView;

@end

@implementation PMNormalInvoiceViewController

-(UITableView *)normTableView{
    
    if (!_normTableView) {
        _normTableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 74, XHB_SCREEN_WIDTH-20, XHB_SCREEN_HEIGHT*0.5-64) style:UITableViewStylePlain];
        _normTableView.delegate =self;
        _normTableView.dataSource =self;
        [_normTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        _normTableView.backgroundColor = XHBRGBColor(244, 244, 244);

    }
    return _normTableView;
}

-(NSArray *)dataSource{
    
    if (!_dataSource) {
        _dataSource = @[@"(发票抬头)" ,@"收票人姓名",@"选择区域",@"详细地址",@"收票人手机号码"];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    self.title = @"增值税普通发票";
    UIButton *OK = [UIButton buttonWithType:UIButtonTypeCustom];
    OK.frame = CGRectMake(XHB_SCREEN_WIDTH/4, self.normTableView.maxY+10, XHB_SCREEN_WIDTH-((XHB_SCREEN_WIDTH/4)*2), 40);
    OK.backgroundColor = XHBRGBColor(58, 148, 243);
    OK.layer.cornerRadius = 5.0;
    OK.layer.masksToBounds = YES;
    [OK setTitle:@"保存" forState:UIControlStateNormal];
    [OK addTarget:self action:@selector(OKAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:OK];
    [self.view addSubview:self.normTableView];

}

-(void)OKAction:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"保存");
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    switch (indexPath.row) {
        case 0:
            self.invoiceTitle = [[UITextField alloc]initWithFrame:CGRectMake(self.normTableView.width/2.5+15, 6, XHB_SCREEN_WIDTH/2, 30)];
            self.invoiceTitle.delegate = self;
            self.invoiceTitle.font = [UIFont systemFontOfSize:12.0];
            [cell addSubview:self.invoiceTitle];
            break;
        case 1:
            self.name = [[UITextField alloc]initWithFrame:CGRectMake(self.invoiceTitle.x, self.invoiceTitle.y, self.invoiceTitle.width, self.invoiceTitle.height)];
            self.name.font = [UIFont systemFontOfSize:12.0];
            self.name.delegate = self;
            [cell addSubview:self.name];
            break;
        case 2:
            self.area = [[UILabel alloc]initWithFrame:CGRectMake(self.name.x, self.name.y, self.name.width, self.name.height)];
            self.area.font = [UIFont systemFontOfSize:12.0];
            [cell addSubview:self.area];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 3:
            self.detailAddress = [[UITextField alloc]initWithFrame:CGRectMake(self.area.x, self.area.y, self.area.width, self.area.height)];
            self.detailAddress.font = [UIFont systemFontOfSize:12.0];
            self.detailAddress.delegate = self;
            [cell addSubview:self.detailAddress];
            break;
        case 4:
            self.number =[[UITextField alloc]initWithFrame:CGRectMake(self.detailAddress.x, self.detailAddress.y, self.detailAddress.width, self.detailAddress.height)];
            self.number.font = [UIFont systemFontOfSize:12.0];
            self.number.delegate = self;
            [cell addSubview:self.number];
        default:
            break;
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==2) {
        self.prickerView = [[BLAreaPickerView alloc]initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH, 150)];
        self.prickerView.pickViewDelegate = self;
        self.prickerView.pickViewBackgroundColor = XHBRGBColor(255, 255, 255);
        [self.prickerView bl_show];
    }
    
}

-(void)bl_selectedAreaResultWithProvince:(NSString *)provinceTitle city:(NSString *)cityTitle area:(NSString *)areaTitle{
    
    self.area.text = [NSString stringWithFormat:@"%@%@%@",provinceTitle,cityTitle,areaTitle];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    return YES;
}

@end
