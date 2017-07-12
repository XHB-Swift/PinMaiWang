//
//  ViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/15.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "ViewController.h"
#import "HomeModel.h"
#import "HomeTableViewCell.h"
#import "PMProductViewController.h"
#import "PMGoodsDetailViewController.h"
#import "PMHomeHeaderView.h"
#import "UINavigationBar+ChangeNavigationBarColor.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) PMHomeHeaderView * headerView;
@property (nonatomic,strong) UITableView * homeTableView;
@property (nonatomic,strong) NSMutableArray<HomeModel *> * homeDataSource;
@end

@implementation ViewController
-(PMHomeHeaderView *)headerView{
    
    if (!_headerView) {
        self.headerView = [PMHomeHeaderView initializeWithHomeHeaderView:self.view WithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        self.headerView.backgroundColor =[UIColor whiteColor];
        self.headerView.layer.borderColor = [UIColor grayColor].CGColor;
        self.headerView.layer.borderWidth = 0.3;
    }
    return _headerView;
}

-(UITableView *)homeTableView{
    if (!_homeTableView) {
        _homeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -64, self.view.width, self.view.height+64) style:UITableViewStylePlain];
        _homeTableView.delegate = self;
        _homeTableView.dataSource = self;
        _homeTableView.tableHeaderView = self.headerView;
        _homeTableView.backgroundColor = XHBRGBColor(243, 243, 243);
        [_homeTableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:NSStringFromClass([HomeTableViewCell class])];
        _homeTableView.rowHeight = XHB_SCREEN_HEIGHT/5;;
    }
    return _homeTableView;
}

-(NSMutableArray<HomeModel *> *)homeDataSource{
    if (!_homeDataSource) {
        _homeDataSource = [NSMutableArray array];
        NSDictionary *dicionary = @{@"icon":@"lobster",@"img":@"index_06",@"name":@"吉利乔治法国生蚝",@"size":@"8.5千克/盒",@"price":@"¥25.33/500克",@"allPrice":@"¥9999/箱",@"sellOut":@"已售999999箱"};
        HomeModel *model = [HomeModel homeModelDealWithDict:dicionary];
        for (int i = 0; i < 20; i++) {
            [_homeDataSource addObject:model];
        }
    }return _homeDataSource;
}

#pragma mark 创建导航栏按钮
-(void)initNaigationBar{
    //导航栏左按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem customButtonInBarButtonItemWithFrame:CGRectMake(0, 0, 24, 40) NormalImage:[UIImage imageNamed:@"email_01"] ImageEdgInsets:UIEdgeInsetsMake(0, -10, 0, 0) Target:self Selector:@selector(leftBarButtonAction:)];
    self.navigationItem.title = nil;
    //导航栏右按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem customButtonInBarButtonItemWithFrame:CGRectMake(0, 0, 24, 40) NormalImage:[UIImage imageNamed:@"phone_01"] ImageEdgInsets:UIEdgeInsetsMake(0, 0, 0, -10) Target:self Selector:@selector(rightBarButtonAction:)];
    
    //中间搜索框
    UITextField *tfSearch = [[UITextField alloc]init];
    tfSearch.bounds = CGRectMake(0, 0, self.view.bounds.size.width - 100, 28);
    tfSearch.backgroundColor = [UIColor whiteColor];
    tfSearch.layer.cornerRadius = 5.0;
    tfSearch.layer.masksToBounds = YES;
    tfSearch.placeholder = @"野生螯龙虾";
    tfSearch.textAlignment = NSTextAlignmentCenter;
    tfSearch.borderStyle = UITextBorderStyleRoundedRect;
    tfSearch.font = [UIFont systemFontOfSize:14];
    self.navigationItem.titleView = tfSearch;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 0, 30, 30);
    [btn setImage:[UIImage imageNamed:@"index_12"] forState:UIControlStateNormal];
    [tfSearch addSubview:btn];
    
    // 语音
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(tfSearch.width-30, 0, 30, 30);
    [button setImage:[UIImage imageNamed:@"index_13"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(voiceAction:) forControlEvents:UIControlEventTouchUpInside];
    [tfSearch addSubview:button];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = XHBRGBColor(243, 243, 243);
    [self.view addSubview:self.homeTableView];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initNaigationBar];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
#pragma mark NSNotification
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(TopScrollIndexAction:) name:@"Index" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ItemBtnIndexAction:) name:@"itemBtnTag" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(NoticeIndexAction:) name:@"noticeIndex" object:nil];
    
}

-(void)voiceAction:(UIButton *)sender{
    
    NSLog(@"语音输入");
}

-(void)leftBarButtonAction:(UIBarButtonItem *)sender{
    
    XHBLogObject(@"消息");
}

-(void)rightBarButtonAction:(UIBarButtonItem *)sender{
    
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

-(void)TopScrollIndexAction:(NSNotification *)sender{
    
    NSInteger topScrollIndex = [sender.userInfo[@"Value"]intValue];
    switch (topScrollIndex) {
        case 0:
            XHBLogObject(@"topScrollIndex:零");
            break;
        case 1:
            XHBLogObject(@"topScrollIndex:一");
            break;
        case 2:
            XHBLogObject(@"topScrollIndex:二");
            break;
        case 3:
            XHBLogObject(@"topScrollIndex:三");
            break;
        case 4:
            XHBLogObject(@"topScrollIndex:四");
        default:
            break;
    }
}

-(void)ItemBtnIndexAction:(NSNotification *)sender{
    NSInteger itemBtnIndex = [sender.userInfo[@"Value"]intValue];
    NSLog(@"itemBtnIndex = %ld",(long)itemBtnIndex);
    PMProductViewController *VC = [PMProductViewController new];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)NoticeIndexAction:(NSNotification *)sender{
    NSInteger noticeIndex = [sender.userInfo[@"Value"]intValue];
    switch (noticeIndex) {
        case 0:
            XHBLogObject(@"noticeIndex:0");
            break;
        case 1:
            XHBLogObject(@"noticeIndex:1");
            break;
        case 2:
            XHBLogObject(@"noticeIndex:2");
            break;
        case 3:
            XHBLogObject(@"noticeIndex:3");
            break;
        case 4:
            XHBLogObject(@"noticeIndex:4");
        default:
            break;
    }
    
}

#pragma mark UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.homeDataSource.count;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
#pragma mark TbleView分割线补全
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell isKindOfClass:[HomeTableViewCell class]]) {
        HomeModel *model = self.homeDataSource[indexPath.row];
        HomeTableViewCell *c = (HomeTableViewCell *)cell;
        c.model = model;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeTableViewCell class]) forIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PMGoodsDetailViewController *VC = [PMGoodsDetailViewController new];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

/* 滑动过程中做处理 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.navigationController.navigationBar changeColor:XHBRGBColor(40, 142, 235) WithScrollView:scrollView AndValue:90];
}

// 移除通知
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar star];
    //该页面呈现时手动调用计算导航栏此时应当显示的颜色
    [self scrollViewDidScroll:self.homeTableView];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar reset];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}





@end
