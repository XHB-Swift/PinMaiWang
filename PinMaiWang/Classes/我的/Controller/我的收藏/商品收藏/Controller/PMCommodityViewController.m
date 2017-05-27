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

-(NSMutableArray<NSDictionary *> *)dataSource{
    
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithObjects:
                      @{@"img":@"num1",@"title":@"海洋玉爱尔兰生蚝生长三年"},
                      @{@"img":@"num2",@"title":@"原装进口 新西兰荣格拍2014梅洛赤霞珠干红葡萄酒"},
                      @{@"img":@"num3",@"title":@"澳大利亚进口 洛神山庄"},
                      @{@"img":@"num1",@"title":@"海洋玉爱尔兰生蚝生长三年"},
                      @{@"img":@"num2",@"title":@"原装进口 新西兰荣格拍2014梅洛赤霞珠干红葡萄酒"},
                      @{@"img":@"num3",@"title":@"澳大利亚进口 洛神山庄"},nil];
    }
    return _dataSource;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.commditTableView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(BuyAction:) name:@"BuyCommdityName" object:nil];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PMCommditTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PMCommditTableViewCell class]) forIndexPath:indexPath];
    cell.dict = self.dataSource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)BuyAction:(NSNotification *)sender{
    
    int text = [sender.userInfo[@"Value"] intValue];
    if ((text = 1001011)) {
        XHBLogObject(@"购买");
    }
}

// 设置cell可以编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}
// 定义编辑模式
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"删除";
}
// 进入编辑模式,按下出现的编辑按钮后,进行删除操作
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataSource removeObjectAtIndex:indexPath.row];
    }
    [self.commditTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}


@end
