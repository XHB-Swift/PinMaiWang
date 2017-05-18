//
//  MineViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/15.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "MineViewController.h"
#import "PMMineCollectionViewCell.h"
#import "PMSettingViewController.h"


@interface MineViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UIView * myHeaderView;
@property (nonatomic,strong) UICollectionView * mineCollectionView;
@property (nonatomic,strong) NSArray<NSDictionary *> * items;
@end

@implementation MineViewController

-(NSArray<NSDictionary *> *)items{
    
    if (!_items) {
        _items = @[
                   @{@"image":@"me_07",@"title":@"我的账户"},
                   @{@"image":@"me_08",@"title":@"我的积分"},
                   @{@"image":@"me_09",@"title":@"我的拍卖"},
                   @{@"image":@"me_10",@"title":@"我的收藏"},
                   @{@"image":@"me_11",@"title":@"收货地址"},
                   @{@"image":@"me_12",@"title":@"我的发票"},
                   @{@"image":@"me_13",@"title":@"我的优惠券"},
                   @{@"image":@"me_15_2",@"title":@"分享App"},
                   @{@"image":@"me_01",@"title":@"应用设置"}
                ];
    }
    return _items;
}



-(UICollectionView *)mineCollectionView{
    
    if (!_mineCollectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        CGFloat Spacing = 3;
        flowLayout.itemSize = CGSizeMake((XHB_SCREEN_WIDTH-13)/3, (XHB_SCREEN_WIDTH-4*Spacing)/3);
        flowLayout.minimumInteritemSpacing = Spacing;
        flowLayout.minimumLineSpacing = Spacing;
        flowLayout.sectionInset = UIEdgeInsetsMake(Spacing, Spacing, Spacing, Spacing);
        
        _mineCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, -20, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT) collectionViewLayout:flowLayout];
        _mineCollectionView.delegate = self;
        _mineCollectionView.dataSource = self;
        _mineCollectionView.backgroundColor = XHBRGBColor(244, 244, 244);
        _mineCollectionView.showsVerticalScrollIndicator = NO;
        _mineCollectionView.showsHorizontalScrollIndicator = NO;
        [_mineCollectionView registerClass:[PMMineCollectionViewCell class] forCellWithReuseIdentifier:cellID];
        [_mineCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:header];
        flowLayout.headerReferenceSize = CGSizeMake(XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT/1.8);
        
    }
    return _mineCollectionView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XHBRGBColor(244, 244, 244);
    [self.view addSubview:self.mineCollectionView];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.items.count;;
}

static NSString *cellID = @"MineCellId";

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PMMineCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.mineDict = self.items[indexPath.row];
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            NSLog(@"我的账户");
            break;
        case 1:
            NSLog(@"我的积分");
            break;
        case 2:
            NSLog(@"我的拍卖");
            break;
        case 3:
            NSLog(@"我的收藏");
            break;
        case 4:
            NSLog(@"收货地址");
            break;
        case 5:
            NSLog(@"我的发票");
            break;
        case 6:
            NSLog(@"我的优惠券");
            break;
        case 7:
            NSLog(@"分享App");
            break;
        case 8:{
            NSLog(@"应用设置");
            PMSettingViewController *VC = [[PMSettingViewController alloc]init];
            [self.navigationController pushViewController:VC animated:YES];
            
        }
            
        default:
            break;
    }
}

-(UIView *)myHeaderView{
    if (!_myHeaderView) {
        _myHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT/1.8)];
        _myHeaderView.backgroundColor = [UIColor whiteColor];
        _myHeaderView.userInteractionEnabled = YES;
        
        UIImageView *bgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _myHeaderView.width, _myHeaderView.height*0.6)];
        bgView.image = [UIImage imageNamed:@"me_bg"];
        bgView.userInteractionEnabled = YES;
        
        UIButton *headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        headBtn.frame = CGRectMake(bgView.width/2-40, 20, 80, 80);
        [headBtn setImage:[UIImage resizeImage:[UIImage imageNamed:@"headicon"] toNewSize:CGSizeMake(80, 80)] forState:UIControlStateNormal];
        [headBtn addTarget:self action:@selector(headBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        headBtn.layer.cornerRadius = 40;
        headBtn.layer.masksToBounds = YES;
        
        UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        loginBtn.frame = CGRectMake(_myHeaderView.width/2-40, headBtn.maxY+10, headBtn.width, 30);
        loginBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [loginBtn setTitle:@"登录/注册" forState:UIControlStateNormal];
        loginBtn.layer.borderWidth = 1.0;
        loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        [loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
        
#pragma mark 余额
        UILabel *lalances = [[UILabel alloc]initWithFrame:CGRectMake(0, loginBtn.maxY+10, _myHeaderView.width/2-2, 30)];
        lalances.textAlignment = NSTextAlignmentCenter;
        lalances.font = [UIFont systemFontOfSize:12.0];
        lalances.text = @"账户余额\n0.00";
        lalances.numberOfLines = 0;
        lalances.textColor = [UIColor whiteColor];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(lalances.maxX, loginBtn.maxY+10, 1, 30)];
        view.backgroundColor = [UIColor grayColor];
        
#pragma mark 积分
        UILabel *integrate = [[UILabel alloc]initWithFrame:CGRectMake(view.maxX, loginBtn.maxY+10, lalances.width, lalances.height)];
        integrate.textAlignment = NSTextAlignmentCenter;
        integrate.font = [UIFont systemFontOfSize:12.0];
        integrate.text = @"我的积分\n0";
        integrate.numberOfLines = 0;
        integrate.textColor = [UIColor whiteColor];
        
        UILabel *myorder = [[UILabel alloc]initWithFrame:CGRectMake(10, bgView.maxY+5, bgView.width/2, 40)];
        myorder.text = @"我的订单";
        
        UIButton *allOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        allOrderBtn.frame = CGRectMake(myorder.maxX, bgView.maxY+5, myorder.width, 40);
        [allOrderBtn setTitle:@"查看全部订单" forState:UIControlStateNormal];
        [allOrderBtn setImage:[UIImage resizeImage:[UIImage imageNamed:@"next_01"] toNewSize:CGSizeMake(10, 15)] forState:UIControlStateNormal];
        allOrderBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        allOrderBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -myorder.width-40);
        allOrderBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [allOrderBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [allOrderBtn addTarget:self action:@selector(allAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, myorder.maxY+5, XHB_SCREEN_WIDTH, 3)];
        bottomView.backgroundColor = XHBRGBColor(244, 244, 244);
        
#pragma mark 我的订单功能按钮
        NSArray *titles = @[@"待付款",@"待发货",@"待收货",@"待评价",@"已取消"];
        NSArray *imgArray = @[@"me_03",@"me_04",@"me_05",@"me_06",@"me_15"];
        for (int i = 0; i < 5; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i*((XHB_SCREEN_WIDTH-30)/5+5)+5, bottomView.maxY+10, (XHB_SCREEN_WIDTH-30)/5, 70);
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:12.0];
            [button setTitle:titles[i] forState:UIControlStateNormal];
            [button setImage:[UIImage resizeImage:[UIImage imageNamed:imgArray[i]] toNewSize:CGSizeMake(25, 25)] forState:UIControlStateNormal];
            if (UI_IS_IPHONE5) {
                button.titleEdgeInsets = UIEdgeInsetsMake(30, -30, 0, 0);
                button.imageEdgeInsets = UIEdgeInsetsMake(-30, 10, 0, 0);
            }else if (UI_IS_IPHONE6){
                button.titleEdgeInsets = UIEdgeInsetsMake(45, -30, 0, 0);
                button.imageEdgeInsets = UIEdgeInsetsMake(-10, 10, 0, 0);
            }else{
                button.titleEdgeInsets = UIEdgeInsetsMake(55, -30, 0, 0);
                button.imageEdgeInsets = UIEdgeInsetsMake(-10, 10, 0, -20);
            }
            
            button.tag = i;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [_myHeaderView addSubview:button];
        }
        
        [_myHeaderView addSubview:bgView];
        [bgView addSubview:headBtn];
        [bgView addSubview:loginBtn];
        [bgView addSubview:lalances];
        [bgView addSubview:view];
        [bgView addSubview:integrate];
        [_myHeaderView addSubview:myorder];
        [_myHeaderView addSubview:allOrderBtn];
        [_myHeaderView addSubview:bottomView];
    }
    return _myHeaderView;
}

static NSString *header = @"Header";
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:header forIndexPath:indexPath];
        [headerView addSubview:self.myHeaderView];
        return headerView;
    }
    return 0;
}

-(void)headBtnAction:(UIButton *)sender{
    
    NSLog(@"头像");
}

-(void)loginAction:(UIButton *)sender{
    
    NSLog(@"登录/注册");
}

-(void)allAction:(UIButton *)sender{
    
    NSLog(@"查看全部订单");
}

-(void)buttonAction:(UIButton *)sender{
    
    switch (sender.tag) {
        case 0:
            NSLog(@"待付款");
            break;
        case 1:
            NSLog(@"待发货");
            break;
        case 2:
            NSLog(@"待收货");
            break;
        case 3:
            NSLog(@"待评价");
            break;
        case 4:
            NSLog(@"已取消");
        default:
            break;
    }
}




- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.hidden = NO;
    
}



@end
