//
//  PMGoodsDetailViewController.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/18.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMGoodsDetailViewController.h"
#import <WebKit/WebKit.h>
#import "LZHScrollView.h"
#import "PMDeatilModel.h"
#import "PMDetailTableViewCell.h"
#import "SelectView.h"
#import "BottomBuyCartView.h"


@interface PMGoodsDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UIScrollView * scrollView;

@property (nonatomic,strong) WKWebView * webView;
@property (nonatomic,strong) LZHScrollView * detailHeaderView;

@property (nonatomic,strong) NSMutableArray * dataSource;
@property (nonatomic,strong) SelectView * selectView;
@property (nonatomic,strong) BottomBuyCartView * buyCartView;

@end

@implementation PMGoodsDetailViewController

-(LZHScrollView *)detailHeaderView{
    if (!_detailHeaderView) {
        if (UI_IS_IPHONE5) {
            _detailHeaderView = [[LZHScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width*0.65)];
        }else if (UI_IS_IPHONE6){
            _detailHeaderView = [[LZHScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width*0.75)];
        }else if (UI_IS_IPHONE6PLUS){
            _detailHeaderView = [[LZHScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width*0.85)];
        }
        _detailHeaderView.backgroundColor = [UIColor whiteColor];
        _detailHeaderView.layer.borderColor = [UIColor grayColor].CGColor;
        _detailHeaderView.layer.borderWidth = 0.3;
        _detailHeaderView.images = @[@"https://image.pmb2b.com/uploads/goods/frozen/beilei/heijinbao/4.jpg",
                                     @"https://image.pmb2b.com/uploads/goods/frozen/beilei/heijinbao/2.jpg",
                                     @"https://image.pmb2b.com/uploads/goods/frozen/beilei/heijinbao/3.jpg"];
        // 开启自动轮播
        //        _detailHeaderView.isAutomatic = YES;
        // 显示倒计时
        _detailHeaderView.isCountdown = YES;
        [_detailHeaderView didSelectCollectionViewItemAtIndex:^(NSInteger index) {
            NSLog(@"%ld",(long)index);
        }];
    }
    return _detailHeaderView;
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView  =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.detailHeaderView;
        _tableView.showsVerticalScrollIndicator = NO;
        //        _tableView.rowHeight = self.view.bounds.size.height/2.5;
        [_tableView registerClass:[PMDetailTableViewCell class] forCellReuseIdentifier:NSStringFromClass([PMDetailTableViewCell class])];
//        _tableView.backgroundColor =  [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
        _tableView.backgroundColor = XHBRGBColor(245, 245, 245);
    }
    return _tableView;
}

-(UIScrollView *)scrollView{
    if (!_scrollView ) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height*2);
        // 设置分页效果
        _scrollView.pagingEnabled = YES;
        // 禁止滚动
        _scrollView.scrollEnabled = NO;
        
        
    }
    return _scrollView;
}

-(WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height)];
    }
    return _webView;
}

#pragma mark 数据源
-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        NSArray *array = @[@[@{@"name":@"PH16 新西兰 冻黑金鲍",
                               @"tips":@"客户购买的数量必须是20的倍数，每20件产品中有2件大，15件中，3件小；生产日期为17年5月；具体到货时间可能会因为天气原因有所变动；广州市区内免费配送，广州市外运费自理，如有疑问请联系客服。",
                               @"price":@"¥154.25起/500克",@"allPrices":@"¥3085.98/箱"}],
                           @[@{@"title":@"到货日期",@"date":@"07月15日"},@{@"title":@"选择规格"},@{@"title":@"配送地区"}]];
#pragma mark  字典转模型
        for (int i = 0; i < array.count; i++) {
            NSMutableArray *temp = [NSMutableArray array];
            for (NSDictionary *dict in array[i]) {
                [temp addObject:[PMDeatilModel ModelWithDict:dict]];
            }
            [self.dataSource addObject:temp];
        }
    }
    return _dataSource;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.tableView];
    [self.scrollView addSubview:self.webView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //    self.edgesForExtendedLayout = UIRectEdgeNone;
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    
#pragma mark 上拉 下拉翻页效果
    MJDIYAutoFooter *footer = [MJDIYAutoFooter footerWithRefreshingBlock:^{
        [UIView animateWithDuration:0.20 animations:^{
            self.scrollView.contentOffset = CGPointMake(0, self.view.bounds.size.height-64);
        }];
        [self.tableView.mj_footer endRefreshing];
    }];
    self.tableView.mj_footer = footer;
    MJDIYHeader *header = [MJDIYHeader headerWithRefreshingBlock:^{
        [UIView animateWithDuration:0.25 animations:^{
            self.scrollView.contentOffset = CGPointMake(0, 0);
            [self.webView.scrollView.mj_header endRefreshing];
        }];
    }];
    self.webView.scrollView.mj_header = header;
    
    
    UIView *botomView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-50, self.view.bounds.size.width, 50)];
    botomView.backgroundColor = [UIColor redColor];
    [self.view addSubview:botomView];
    
#pragma mark 底部立即购买
    self.buyCartView = [[BottomBuyCartView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-50, self.view.bounds.size.width, 50)];
    self.buyCartView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.buyCartView];
    
}

// 返回多少分组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataSource.count;
}

// 返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataSource[section] count];
}

//配置cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        PMDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PMDetailTableViewCell class])];
        cell.model = self.dataSource[indexPath.section][indexPath.row];
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    PMDeatilModel *model = self.dataSource[indexPath.section][indexPath.row];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.date;
    cell.detailTextLabel.textColor = [UIColor redColor];
    if ( indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    return cell;
}

- (SelectView *)selectView {
    
    if (!_selectView) {
        _selectView = [[SelectView alloc]  initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height*2/3)];
        _selectView.headerImageView.image = [UIImage imageNamed:@"baoyu"];
    }
    
    return _selectView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 && indexPath.row == 1) {
        [self.selectView showSelectView];
    }
}


// 设置cell分组的间隔
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

// 返回行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 130;
    }
    return 44;
}



-(void)viewWillAppear:(BOOL)animated{
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.mi.com"]]];
}


@end
