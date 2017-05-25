//
//  PMCommodityViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/25.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMCommodityViewController.h"
#import "PMCommditTableViewCell.h"

@interface PMCommodityViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * commditTableView;
@property (nonatomic,strong) NSMutableArray<NSDictionary *> * dataSource;

@end

@implementation PMCommodityViewController

-(UITableView *)commditTableView{
    
    if (!_commditTableView) {
        _commditTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT-114) style:UITableViewStylePlain];
        _commditTableView.delegate = self;
        _commditTableView.dataSource = self;
        [_commditTableView registerClass:[PMCommditTableViewCell class] forCellReuseIdentifier:NSStringFromClass([PMCommditTableViewCell class])];
        
        _commditTableView.rowHeight = 90;
    }return _commditTableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.commditTableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PMCommditTableViewCell class])];
//    cell.textLabel.text = @"你敢动我试试?";
    return cell;
}

@end
