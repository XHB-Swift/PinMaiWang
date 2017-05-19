//
//  ViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/15.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "ViewController.h"
#import "XRCarouselView.h"
#import "SGAdvertScrollView.h"
#import "HomeModel.h"
#import "HomeTableViewCell.h"

@interface ViewController ()<XRCarouselViewDelegate,SGAdvertScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITextField * searTextField;
@property (nonatomic,strong) UIView * headerView;
@property (nonatomic,strong) XRCarouselView * topScrollView;
@property (nonatomic,strong) UIButton * itemBtn;
@property (nonatomic,strong) UITableView * homeTableView;

@end

@implementation ViewController


-(UITextField *)searTextField{
    
    if (!_searTextField) {
        
        _searTextField = [[UITextField alloc]initWithFrame:CGRectMake(30, 0, XHB_SCREEN_WIDTH-60, 30)];
        _searTextField.backgroundColor = [UIColor whiteColor];
        _searTextField.layer.cornerRadius = 5.0;
        _searTextField.layer.masksToBounds = YES;
        _searTextField.placeholder = @"野生螯龙虾";
        _searTextField.textAlignment = NSTextAlignmentCenter;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10, 0, 30, 30);
        [btn setImage:[UIImage imageNamed:@"index_12"] forState:UIControlStateNormal];
        [_searTextField addSubview:btn];
        
        // 语音
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(_searTextField.width-30, 0, 30, 30);
        [button setImage:[UIImage imageNamed:@"index_13"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_searTextField addSubview:button];
        
    }
    return _searTextField;
}

-(UIView *)headerView{
    
#pragma mark 顶部广告轮播
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:self.view.bounds];
        _headerView.backgroundColor = [UIColor whiteColor];
        _headerView.layer.borderColor = [UIColor grayColor].CGColor;
        _headerView.layer.borderWidth = 0.3;
        self.topScrollView = [[XRCarouselView alloc]initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT*0.38)];
        NSArray *array = @[@"https://ht.pmb2b.com/uploads/ad/4d129ee9-e5fa-4388-b3e3-60b8040fda56.jpg",
                           @"https://ht.pmb2b.com/uploads/ad/8fe96d52-fdf9-4428-8fc5-757d6911cf12.jpg",
                           @"https://ht.pmb2b.com/uploads/ad/8faf72e5-7804-4779-be65-f08916063552.jpg",
                           @"https://ht.pmb2b.com/uploads/ad/500b130a-15eb-4350-b864-ac84b5651c12.jpg",
                           @"https://ht.pmb2b.com/uploads/ad/eb6187ad-36ce-4ce3-a5ff-cf945a2fe1af.jpg"
                           ];
        self.topScrollView.imageArray = array;
        self.topScrollView.delegate = self;
        self.topScrollView.changeMode = ChangeModeDefault;
        self.topScrollView.time = 3;
        [self.topScrollView setPageColor:[UIColor whiteColor] andCurrentPageColor:[UIColor redColor]];
        [_headerView addSubview:self.topScrollView];
        
#pragma mark 选项按钮
        NSArray *titles = @[@"龙虾",@"蟹类",@"生蚝",@"鲍鱼",@"象拔蚌",@"冻虾",@"冻蟹",@"冻鱼",@"冻贝",@"冻肉"];
        NSArray *imgs = @[@"index_lx",@"index_xl",@"index_sh",@"index_by",@"index_xbb",@"index_dxia",@"index_dxie",@"index_dy",@"index_db",@"index_qt"];
        
        for (int i = 0; i < 10; i++) {
            self.itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            if (UI_IS_IPHONE5) {
                self.itemBtn.frame = CGRectMake((i%5)*((self.view.bounds.size.width-30)/5+5)+5, self.topScrollView.maxY+10+(i/5)*(self.view.bounds.size.width/5+5), (self.view.bounds.size.width-30)/5, self.view.bounds.size.width/5);
                [self.itemBtn setImage:[UIImage resizeImage:[UIImage imageNamed:imgs[i]] toNewSize:CGSizeMake(40, 40)] forState:UIControlStateNormal];
                self.itemBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
                self.itemBtn.titleEdgeInsets = UIEdgeInsetsMake(40, -45, -5, 5);
                self.itemBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 25, 0);
                self.itemBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
                
            }else if (UI_IS_IPHONE6){
                self.itemBtn.frame = CGRectMake((i%5)*((self.view.bounds.size.width-30)/5+5)+5, self.topScrollView.maxY+10+(i/5)*(self.view.bounds.size.width/5+5), (self.view.bounds.size.width-30)/5, self.view.bounds.size.width/5);
                [self.itemBtn setImage:[UIImage resizeImage:[UIImage imageNamed:imgs[i]] toNewSize:CGSizeMake(50, 50)] forState:UIControlStateNormal];
                self.itemBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
                self.itemBtn.titleEdgeInsets = UIEdgeInsetsMake(50, -50, -5, 5);
                self.itemBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 25, 0);
                self.itemBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
                
            }else{
                
                self.itemBtn.frame = CGRectMake((i%5)*((self.view.bounds.size.width-30)/5+5)+5, self.topScrollView.maxY+10+(i/5)*(self.view.bounds.size.width/5+5), (self.view.bounds.size.width-30)/5, self.view.bounds.size.width/5);
                [self.itemBtn setImage:[UIImage resizeImage:[UIImage imageNamed:imgs[i]] toNewSize:CGSizeMake(60, 60)] forState:UIControlStateNormal];
                self.itemBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
                self.itemBtn.titleEdgeInsets = UIEdgeInsetsMake(60, -60, -5, 5);
                self.itemBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 25, 0);
                self.itemBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
            }
            
            self.itemBtn.tag = i;
            [self.itemBtn setTitle:titles[i] forState:UIControlStateNormal];
            [self.itemBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.itemBtn addTarget:self action:@selector(titleBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [_headerView addSubview:self.itemBtn];
        }
        
#pragma mark 消息资讯轮播
        UIImageView *new = [[UIImageView alloc]initWithFrame:CGRectMake(10, self.itemBtn.maxY+5, 35, 35)];
        new.image = [UIImage imageNamed:@"news_1"];
        [_headerView addSubview:new];
        SGAdvertScrollView *notice = [[SGAdvertScrollView alloc]init];
        notice.frame = CGRectMake(new.maxX, self.itemBtn.maxY+10, self.view.bounds.size.width-20, 25);
        notice.titleColor = [[UIColor blackColor] colorWithAlphaComponent:1.0];
        notice.scrollTimeInterval = 2;
        notice.leftImageString = @"news_2";
        notice.delegateAdvertScrollView = self;
        notice.titles = [NSMutableArray arrayWithObjects:@"暴走大事件",@"王尼玛",@"张全蛋",@"五道杠大队长",@"赵铁柱",@"其实我也不知道写什么了.....", nil];
        notice.titleFont = [UIFont systemFontOfSize:15.0];
        [_headerView addSubview:notice];
        
        UIImageView *billboardView = [[UIImageView alloc]initWithFrame:CGRectMake(0, notice.maxY+8, XHB_SCREEN_WIDTH, _headerView.height*0.22)];
        billboardView.image = [UIImage imageNamed:@"cdw"];
        [_headerView addSubview:billboardView];
        
        UIButton *newBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        newBtn.frame = CGRectMake(0, billboardView.maxY+5, self.view.bounds.size.width, 30);
        [newBtn setImage:[UIImage resizeImage:[UIImage imageNamed:@"index_05"] toNewSize:CGSizeMake(30, 20)] forState:UIControlStateNormal];
        [newBtn setTitle:@"最新上线" forState:UIControlStateNormal];
        [newBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        newBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        newBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -200, 0, 0);
        newBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -180, 0, 0);
        [_headerView addSubview:newBtn];
        
        
    }
    return _headerView;
}

-(UITableView *)homeTableView{
    
    if (!_homeTableView) {
        _homeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -64, self.view.bounds.size.width, self.view.bounds.size.height+15) style:UITableViewStylePlain];
        _homeTableView.delegate = self;
        _homeTableView.dataSource = self;
        _homeTableView.tableHeaderView = self.headerView;
        _homeTableView.backgroundColor = XHBRGBColor(243, 243, 243);
        [_homeTableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:NSStringFromClass([HomeTableViewCell class])];
        _homeTableView.rowHeight = 120;
        
    }
    return _homeTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = XHBRGBColor(243, 243, 243);

#pragma mark 自定义导航栏左右按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem customButtonInBarButtonItemWithFrame:CGRectMake(0, 0, 24, 40) NormalImage:[UIImage imageNamed:@"email_01"] ImageEdgInsets:UIEdgeInsetsMake(0, -10, 0, 0) Target:self Selector:@selector(leftBarButtonAction:)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem customButtonInBarButtonItemWithFrame:CGRectMake(0, 0, 24, 40) NormalImage:[UIImage imageNamed:@"phone_01"] ImageEdgInsets:UIEdgeInsetsMake(0, 0, 0, -10) Target:self Selector:@selector(rightBarButtonAction:)];
    self.navigationItem.title = nil;
    self.navigationItem.titleView = self.searTextField;
    [self.view addSubview:self.homeTableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeTableViewCell class]) forIndexPath:indexPath];
    
    return cell;
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

-(void)buttonAction:(UIButton *)sender{
    
    XHBLogObject(@"语音输入");
}

#pragma mark XRCarouselViewDelegate
- (void)carouselView:(XRCarouselView *)carouselView clickImageAtIndex:(NSInteger)index {
    //    NSLog(@"点击了第%ld张图片", index);
    switch (index) {
        case 0:
            NSLog(@"0");
            break;
        case 1:
            NSLog(@"1");
            break;
        case 2:
            NSLog(@"2");
            break;
        case 3:
            NSLog(@"3");
            break;
        case 4:
            NSLog(@"4");
        default:
            break;
    }
}


-(void)titleBtnAction:(UIButton *)sender{
    
    switch (sender.tag) {
        case 0:
            XHBLogObject(@"龙虾");
            break;
        case 1:
            XHBLogObject(@"蟹类");
            break;
        case 2:
            XHBLogObject(@"生蚝");
            break;
        case 3:
            XHBLogObject(@"鲍鱼");
            break;
        case 4:
            XHBLogObject(@"象拔蚌");
            break;
        case 5:
            XHBLogObject(@"冻虾");
            break;
        case 6:
            XHBLogObject(@"冻蟹");
            break;
        case 7:
            XHBLogObject(@"冻鱼");
            break;
        case 8:
            XHBLogObject(@"冻贝");
            break;
        case 9:
            XHBLogObject(@"冻肉");
        default:
            break;
    }
}


#pragma mark 消息的点击跳转代理方法
- (void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index {
    
}

#pragma mark 滚动代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat alpha = scrollView.contentOffset.y / self.topScrollView.height;
    [self.navigationController.navigationBar xhb_setBackgroundColor: XHBHexAColor(0x1E8CEE, alpha > 0 ? alpha : 0)];
    //XHBLogObject(@(alpha));
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self scrollViewDidScroll:self.homeTableView];

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar xhb_resetNavigationBar];
}




@end
