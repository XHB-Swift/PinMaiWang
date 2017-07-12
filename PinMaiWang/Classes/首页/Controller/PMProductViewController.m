//
//  PMProductViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/6/16.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMProductViewController.h"
#import "PMGoodsDetailViewController.h"
#import "CategoryViewController.h"
#import "PMProductTableViewCell.h"
#import "PMProductModel.h"

@interface PMProductViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * proudctTable;
@property (nonatomic,strong) NSMutableArray<PMProductModel *> * dataSource;
@property (nonatomic,strong) NSArray * array;

@end

@implementation PMProductViewController

-(UITableView *)proudctTable{
    
    if (!_proudctTable) {
        _proudctTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT) style:UITableViewStylePlain];
        _proudctTable.delegate = self;
        _proudctTable.dataSource = self;
        [_proudctTable registerClass:[PMProductTableViewCell class] forCellReuseIdentifier:NSStringFromClass([PMProductTableViewCell class])];
        _proudctTable.rowHeight = XHB_SCREEN_HEIGHT/5;
        
    }
    return _proudctTable;
}

-(NSMutableArray<PMProductModel *> *)dataSource{
    
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        NSDictionary *dict = @{@"name":@"大洋世家阿根廷红虾",@"sizes":@"12千克/箱",@"number" : @"¥31.50起/500克",@"allNumb":@"¥750.00/箱",@"sellOut":@"售罄",@"CutePet":@"已售168箱",@"img":@"hongxia",@"pic":@"index_06"};
        PMProductModel *model = [PMProductModel modelDealWithDict:dict];
        for (int i = 0; i < 20; i++) {
            [_dataSource addObject:model];
        }
    }
    return _dataSource;

}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = XHBRGBColor(243, 243, 243);
    self.array = @[@1,@2,@4,@7,@9,@11,@16];
    [self.view addSubview:self.proudctTable];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage resizeImage:[UIImage imageNamed:@"fenlei_01"] toNewSize:CGSizeMake(25, 20)] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
}

-(void)rightAction:(UIBarButtonItem *)sender{
    CategoryViewController *VC = [CategoryViewController new];
    [self.navigationController pushViewController:VC animated:YES];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell isKindOfClass:[PMProductTableViewCell class]]) {
        PMProductModel *model = self.dataSource[indexPath.row];
        PMProductTableViewCell *c = (PMProductTableViewCell *)cell;
        c.model = model;
    }
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PMProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PMProductTableViewCell class])];
    if ([self.array containsObject:@(indexPath.row)]) {
        cell.sellUp.hidden = NO;
        cell.price.hidden = YES;
        cell.total.hidden = YES;
        cell.sold.hidden = YES;
        cell.size.text = @"已售200";
        cell.size.textColor = [UIColor blueColor];
    }else {
        cell.sellUp.hidden = YES;
        cell.price.hidden = NO;
        cell.total.hidden = NO;
        cell.sold.hidden = NO;
        cell.size.text = self.dataSource[indexPath.row].sizes;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PMGoodsDetailViewController *VC = [PMGoodsDetailViewController new];
    [self.navigationController pushViewController:VC animated:YES];

    
}



@end
