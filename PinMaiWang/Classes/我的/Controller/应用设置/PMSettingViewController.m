//
//  PMSettingViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/18.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMSettingViewController.h"
#import "PMUpdateViewController.h"
#import "PMAboutViewController.h"

@interface PMSettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView * setingTableView;
@property (nonatomic,strong) NSArray * dataSource;

@end

@implementation PMSettingViewController

-(UITableView *)setingTableView{
    
    if (!_setingTableView) {
        _setingTableView = [[UITableView alloc]init];
        if (UI_IS_IPHONE5) {
            _setingTableView.frame =CGRectMake(0, 0, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT*0.55);
        }else if (UI_IS_IPHONE6){
            _setingTableView.frame =CGRectMake(0, 0, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT*0.47);
        }else if (UI_IS_IPHONE6PLUS){
            _setingTableView.frame =CGRectMake(0, 0, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT*0.42);
        }
        _setingTableView.delegate = self;
        _setingTableView.dataSource = self;
        _setingTableView.separatorColor = [UIColor grayColor];
        
    }
    return _setingTableView;
}

-(NSArray *)dataSource{
    
    if (!_dataSource) {
        _dataSource = @[@"个人信息",@"安全设置",@"清除缓存",@"客服电话",@"软件更新",@"拼买服务协议",@"关于拼买网"];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = XHBRGBColor(255, 255, 255);
    self.title = @"设置";
    [self.view addSubview:self.setingTableView];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];

    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 3) {
        cell.detailTextLabel.text = @"020-81718859";
        cell.detailTextLabel.textColor = XHBRGBColor(33, 157, 211);
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            XHBLogObject(@"个人信息");
            break;
        case 1:
            XHBLogObject(@"安全设置");
            break;
        case 2:{
            XHBLogObject(@"清除缓存");
            NSInteger fileSize = [[SDImageCache sharedImageCache] getSize]/1024/1024>1 ? [[SDImageCache sharedImageCache] getSize]/1024/1024 : [[SDImageCache sharedImageCache] getSize]/1024;
            NSString *sizeString = [[SDImageCache sharedImageCache] getSize]/1024/1024>1 ? @"MB":@"KB";
            
            UIAlertController *VC = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"%ld%@图片缓存",(long)fileSize,sizeString] message:@"您确认清除缓存吗?" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *OK = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [[SDImageCache sharedImageCache] clearDisk];
            }];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [VC addAction:cancel];
            [VC addAction:OK];
            [self presentViewController:VC animated:YES completion:nil];
        }
            break;
        case 3:{
            XHBLogObject(@"客服电话");
            NSString *callString = [NSString stringWithFormat:@"tel:020-81718859"];
            UIAlertController *VC = [UIAlertController alertControllerWithTitle:callString message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *call = [UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                // 调用系统拨号功能
                [[UIApplication sharedApplication]openURL:[NSURL URLWithString:callString] options:@{} completionHandler:^(BOOL success) {
                    success = YES;
                } ];
            }];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [VC addAction:call];
            [VC addAction:cancel];
            [self presentViewController:VC animated:YES completion:nil];

        }
            break;
        case 4:{
            XHBLogObject(@"软件更新");
            PMUpdateViewController *VC = [[PMUpdateViewController alloc]init];
            VC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 5:
            XHBLogObject(@"拼买服务协议");
            break;
        case 6:{
            XHBLogObject(@"关于拼买网");
            PMAboutViewController *VC = [[PMAboutViewController alloc]init];
            VC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        default:
            break;
    }
}



@end
