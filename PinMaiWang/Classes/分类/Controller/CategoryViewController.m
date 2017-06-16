//
//  CategoryViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/15.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "CategoryViewController.h"
#import "PMGoodsDetailViewController.h"

#import "PMCategoryCollectionViewCell.h"
#import "PMCategoryCollectionViewHeaderView.h"
#define CellIdentifier @"CellIdentifier"

//#import "PMCategoryItemView.h"
//#import "PMCategoryHeaderView.h"
//#import "PMCategoryContentView.h"


@interface CategoryViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
///<PMCategoryContentViewDataSource, PMCategoryContentViewDelegate>

@property (nonatomic,strong) UITableView * leftTableView;
@property (nonatomic,strong) UICollectionView * rightCollectionView;

@property (nonatomic,assign) NSInteger  selectIndex;
@property (nonatomic,assign) BOOL  isScrollDown;
@property (nonatomic,strong) UIView * lineView;
@property (nonatomic,strong) UICollectionViewFlowLayout * flowLayout;
@property (nonatomic,strong) NSArray * dataSource;
@property (nonatomic,strong) NSArray * array;


@end

@implementation CategoryViewController

-(UITableView *)leftTableView{
    
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width*0.3-2, self.view.bounds.size.height-64) style:UITableViewStylePlain];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
    }
    return _leftTableView;
}

-(UIView *)lineView{
    
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.leftTableView.frame)+1, 64, 1, self.view.bounds.size.height-64)];
        _lineView.backgroundColor =[UIColor blackColor];
    }
    return _lineView;
}

-(UICollectionView *)rightCollectionView{
    
    if (!_rightCollectionView) {
        
        self.flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _rightCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*0.3, 70, self.view.bounds.size.width*0.7, self.view.bounds.size.height-80) collectionViewLayout:self.flowLayout];
        self.flowLayout.minimumLineSpacing = 10;
        self.flowLayout.minimumInteritemSpacing = 10;
        
        self.flowLayout.itemSize = CGSizeMake((self.rightCollectionView.bounds.size.width-31)/2, (self.rightCollectionView.bounds.size.height-30)/3.5);
        self.flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _rightCollectionView.delegate = self;
        _rightCollectionView.dataSource = self;
        
        [_rightCollectionView registerClass:[PMCategoryCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
        _rightCollectionView.backgroundColor = [UIColor whiteColor];
        
        [_rightCollectionView registerClass:[PMCategoryCollectionViewHeaderView class]
                 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                        withReuseIdentifier:@"CollectionViewHeaderView"];
        
    }
    return _rightCollectionView;
}

-(NSArray *)dataSource{
    
    if (!_dataSource) {
        
        _dataSource = @[@{@"title":@"龙虾",@"list":@[@"加拿大龙虾",@"美国龙虾",@"爱尔兰龙虾",@"西澳龙",@"南澳龙",@"南非油龙",@"巴基斯坦油龙",@"南非龙",@"南非玫瑰龙",@"葡萄牙玫瑰龙",@"琵琶龙虾"],@"imgs":@[@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong"]},
                        @{@"title":@"蟹类",@"list":@[@"加拿大珍宝蟹",@"美国珍宝蟹",@"英国面包蟹",@"爱尔兰面包蟹",@"美国面包蟹",@"澳大利亚皇帝蟹",@"美国白雪蟹",@"美国红雪蟹",@"阳澄湖大闸蟹",@"加拿大帝王蟹"],@"imgs":@[@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong"]},
                        @{@"title":@"贝类",@"list":@[@"法国生蚝",@"爱尔兰生蚝",@"新西兰生蚝",@"加拿大生蚝",@"澳洲生蚝",@"美国生蚝",@"中国生蚝",@"纳米比亚生蚝",@"英国生蚝",@"澳洲鲍鱼",@"新西兰鲍鱼",@"南非鲍鱼",@"中国鲍鱼",@"加拿大象拔蚌",@"墨西哥象拔蚌",@"大西洋海螺",@"爱尔兰活海螺",@"新西兰青口贝",@"加拿大青口贝",@"美国北极哈"],@"imgs":@[@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong"]},
                        @{@"title":@"其他活鲜",@"list":@[@"智利三文鱼",@"加拿大三文鱼",@"苏格兰三文鱼",@"法罗群岛三文鱼",@"牡丹虾",@"新西兰鳗鱼",@"中国鳗鱼",@"加拿大海胆",@"南非海胆",@"美国海胆"],@"imgs":@[@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong"]},
                        @{@"title":@"冻品",@"list":@[@"波虾",@"海鳌虾",@"红虾",@"油龙",@"小龙虾",@"白虾",@"蓝虾",@"小蜜蜂",@"玫瑰龙",@"南非龙",@"帝王蟹",@"面包蟹",@"三文鱼",@"金枪鱼",@"鳕鱼",@"鳗鱼",@"比目鱼",@"冻带鱼",@"文莱龙趸石斑",@"红斑鱼",@"金昌鱼",@"马头鱼",@"北极贝",@"青口贝",@"海螺",@"鲍鱼",@"生蚝",@"兰花蚌",@"日月贝",@"墨鱼仔",@"花枝卷",@"朝鲜蚌",@"牛扒",@"牛板腱",@"牛肉",@"穗香鸡",@"鱿鱼"],@"imgs":@[@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong",@"bolong"]}];
    }
    return _dataSource;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"商品分类";
    self.view.backgroundColor = [UIColor whiteColor];
//    [self setupHeaderView];
//    [self setupContentView];
    
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.lineView];
    [self.view addSubview:self.rightCollectionView];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
}

/*
- (void)setupHeaderView {
    
    PMCategoryHeaderView *headerView = [PMCategoryHeaderView categoryHeaderView];
    headerView.y = 64;
    [headerView adjusHeaderViewFrame];
    headerView.tag = 10;
    [self.view addSubview:headerView];
    
}

- (void)setupContentView {
    
    PMCategoryHeaderView *headerView = [self.view viewWithTag:10];
    PMCategoryContentView *contentView = [PMCategoryContentView categoryContentViewWithFrame:CGRectMake(0, headerView.maxY, self.view.width, self.view.height-headerView.height)];
    contentView.dataSource = self;
    contentView.delegate = self;
    
    [self.view addSubview:contentView];
}

- (NSInteger)category:(PMCategoryContentView *)content forSide:(PMCategoryContentSide)side numberOfElementsInSection:(NSInteger)section {
    
    return (side == PMCategoryContentSideLeft) ? 3 : 3;
    
}

- (id)category:(PMCategoryContentView *)content forSide:(PMCategoryContentSide)side dataAtIndexPath:(NSIndexPath *)indexPath {
    
    return (side == PMCategoryContentSideLeft) ? XHBFormatString(@"%ld", indexPath.row+1) : @{@"imgColor":[UIColor cyanColor],@"lblTxt":@"2"};
}

- (void)category:(PMCategoryContentView *)content didSelectElementforSide:(PMCategoryContentSide)side AtIndex:(NSInteger)index {
    
    PMGoodsDetailViewController *vc = [[PMGoodsDetailViewController alloc] init];
    NSLog(@"详情页");
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

*/



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        UIView *view = [[UIView alloc]initWithFrame:cell.frame];
        view.backgroundColor = XHBRGBColor(206, 206, 206);
        cell.selectedBackgroundView = view;
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2, 44)];
        line.backgroundColor = [UIColor redColor];
        [view addSubview:line];
    }
    cell.textLabel.text = self.dataSource[indexPath.row][@"title"];
    cell.textLabel.font = [UIFont systemFontOfSize:15.0];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.selectIndex = indexPath.row;
    [self scrollToTopOfSection:self.selectIndex animated:YES];
    [self.leftTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.selectIndex inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}

- (void)scrollToTopOfSection:(NSInteger)section animated:(BOOL)animated{
    
    CGRect headerRect = [self frameForHeaderForSection:section];
    CGPoint topOfHeader = CGPointMake(0, headerRect.origin.y-self.rightCollectionView.contentInset.top);
    [self.rightCollectionView setContentOffset:topOfHeader animated:animated];
}

-(CGRect)frameForHeaderForSection:(NSInteger)section{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
    UICollectionViewLayoutAttributes *attributes = [self.rightCollectionView layoutAttributesForItemAtIndexPath:indexPath];
    CGRect frameForFirstCell = attributes.frame;
    CGFloat headerHeight = [self collectionView:self.rightCollectionView layout:self.flowLayout referenceSizeForHeaderInSection:section].height;
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.rightCollectionView.collectionViewLayout;
    CGFloat cellTopEdge = flowLayout.sectionInset.top;
    return CGRectOffset(frameForFirstCell, 0, -headerHeight-cellTopEdge);
    
    
}


#pragma mark UICollectionView
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return self.dataSource.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [self.dataSource[section][@"list"]count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PMCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor purpleColor];
    cell.name.text = self.dataSource[indexPath.section][@"list"][indexPath.row];
    cell.imgView.image =[UIImage imageNamed: self.dataSource[indexPath.section][@"imgs"][indexPath.row]];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdentifier;
    // header
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        reuseIdentifier = @"CollectionViewHeaderView";
    }
    PMCategoryCollectionViewHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                        withReuseIdentifier:reuseIdentifier
                                                                               forIndexPath:indexPath];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view.label.text = self.dataSource[indexPath.section][@"title"];
    }
    return view;
    
}

// 右边CollectionView的头部视图的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(self.rightCollectionView.frame.size.width, 30);
}

// CollectionView分区标题即将展示
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // 当前CollectionView滚动的方向向上，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）
    if (!self.isScrollDown && collectionView.dragging) {
        [self selectRowAtIndexPath:indexPath.section];
    }
}

// CollectionView分区标题展示结束
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // 当前CollectionView滚动的方向向下，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的
    if (self.isScrollDown && collectionView.dragging) {
        [self selectRowAtIndexPath:indexPath.section];
    }
}


// 当拖动CollectionView的时候,处理TableView
-(void)selectRowAtIndexPath:(NSInteger)index{
    
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

#pragma mark - UIScrollView Delegate
// 标记一下CollectionView的滚动方向，是向上还是向下
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    static float lastOffSetY = 0;
    if (self.rightCollectionView == scrollView) {
        self.isScrollDown = lastOffSetY < scrollView.contentOffset.y;
        lastOffSetY = scrollView.contentOffset.y;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            NSLog(@"别摸我");
        }
    }
    NSLog(@"%ld分组 %ld单元格",indexPath.section,indexPath.row);
    
    PMGoodsDetailViewController *vc = [[PMGoodsDetailViewController alloc] init];
    NSLog(@"详情页");
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
