//
//  SelectView.m
//  UILabel文本自适应
//
//  Created by 嚼华先森 on 2017/6/28.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "SelectView.h"
#import "SelectSizeCollectionViewCell.h"

@interface SelectView ()<UICollectionViewDelegate,UICollectionViewDataSource>

// 单价
@property (nonatomic,strong) UILabel * priceLabel;
// 库存
@property (nonatomic,strong) UILabel * stockLabel;
// 选择规格
@property (nonatomic,strong) UILabel * selectLabel;

@property (nonatomic,strong) UICollectionView * sizeCollectionView;

@property (nonatomic,strong) NSArray * dataSource;

@property (nonatomic, assign) int buyNum;
@property (nonatomic,strong) UILabel *buyNumsLabel;



@end

@implementation SelectView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setUpView];
    }
    return self;
}

-(NSArray *)dataSource{
    
    if (!_dataSource) {
        _dataSource = @[@{@"title":@"100-200克",@"price":@"789"},@{@"title":@"300-400克",@"price":@"888"},
                        @{@"title":@"400-500克",@"price":@"999"},@{@"title":@"500-600克",@"price":@"1100"},
                        @{@"title":@"600-700克",@"price":@"1200"},@{@"title":@"700-800克",@"price":@"1314"},
                        @{@"title":@"900-1000克",@"price":@"1500"}];
    }
    return _dataSource;
}
-(void)setUpView{
    
    // 取消按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(self.bounds.size.width-35, 5, 30, 30);
    backBtn.backgroundColor =[UIColor redColor];
    [backBtn addTarget:self action:@selector(backBtnDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backBtn];
    
    // 图片
    self.headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(16, -33, self.bounds.size.width/3, self.bounds.size.width/3)];
    self.headerImageView.backgroundColor = [UIColor redColor];
    self.headerImageView.layer.cornerRadius = 5.0;
    self.headerImageView.layer.masksToBounds = YES;
    [self addSubview:self.headerImageView];
    
    self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.headerImageView.frame)+10, 5, self.bounds.size.width/2.5, 20)];
    self.priceLabel.textColor = [UIColor redColor];
    self.priceLabel.font = [UIFont systemFontOfSize:15.0];
    self.priceLabel.text = @"¥789";
    [self addSubview:self.priceLabel];
    
    // 库存
    self.stockLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.headerImageView.frame)+10, CGRectGetMaxY(self.priceLabel.frame)+2, self.bounds.size.width/2.5, 20)];
    self.stockLabel.font = [UIFont systemFontOfSize:15.0];
    self.stockLabel.text = @"库存9999件";
    [self addSubview:self.stockLabel];
    
    self.selectLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.headerImageView.frame)+10, CGRectGetMaxY(self.stockLabel.frame)+2, self.bounds.size.width/2, 30)];
    self.selectLabel.font = [UIFont systemFontOfSize:15.0];
    self.selectLabel.text = @"请选择产品规格";
    [self addSubview:self.selectLabel];
    // 头部视图分割线
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headerImageView.frame)+20, self.bounds.size.width, 0.3)];
    bottomView.backgroundColor = [UIColor grayColor];
    [self addSubview:bottomView];
    
    UILabel *hederLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(bottomView.frame)+10, self.bounds.size.width, 20)];
    hederLabel.text = @"产品规格:包装规格10千克/箱";
    [self addSubview:hederLabel];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.sizeCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(hederLabel.frame)+10, self.bounds.size.width, self.bounds.size.width/3) collectionViewLayout:flowLayout];
    self.sizeCollectionView.backgroundColor = [UIColor whiteColor];
    
    // 行距
    flowLayout.minimumLineSpacing = 10;
    // 列距
    flowLayout.minimumInteritemSpacing = 10;
    // 每个item的大小
    flowLayout.itemSize = CGSizeMake((self.bounds.size.width-41)/3, 30);
    // 设置上下左右的距离
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    // 滚动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.sizeCollectionView.delegate = self;
    self.sizeCollectionView.dataSource = self;
    [self.sizeCollectionView registerClass:[SelectSizeCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([SelectSizeCollectionViewCell class])];
    [self addSubview:self.sizeCollectionView];
    
    UIView *View = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.sizeCollectionView.frame), self.bounds.size.width, 0.3)];
    View.backgroundColor = [UIColor grayColor];
    [self addSubview:View];
    
    // 购买数量
    UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(View.frame)+20, self.bounds.size.width/3, 30)];
    numLabel.text = @"购买数量";
    [self addSubview:numLabel];
    
    // -
    self.buyNum = 1;
    UIButton *minusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    minusBtn.frame = CGRectMake(self.bounds.size.width/1.8, CGRectGetMaxY(View.frame)+20, 40, 30);
    [minusBtn setTitle:@"-" forState:UIControlStateNormal];
    [minusBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    minusBtn.layer.borderColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0].CGColor;
    minusBtn.layer.borderColor = XHBRGBColor(245, 245, 245).CGColor;
    minusBtn.layer.borderWidth = 1.0;
    minusBtn.layer.cornerRadius = 5.0;
    minusBtn.layer.masksToBounds = YES;
//    minusBtn.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    minusBtn.backgroundColor = XHBRGBColor(245, 245, 245);
    [minusBtn addTarget:self action:@selector(minusBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:minusBtn];
    
    self.buyNumsLabel= [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(minusBtn.frame)+2, CGRectGetMaxY(View.frame)+20, 40, 30)];
    self.buyNumsLabel.text = [NSString stringWithFormat:@"%d",self.buyNum];
    self.buyNumsLabel.textAlignment = NSTextAlignmentCenter;
    self.buyNumsLabel.layer.cornerRadius = 5.0;
    self.buyNumsLabel.layer.masksToBounds = YES;
//    self.buyNumsLabel.layer.borderColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0].CGColor;
    self.buyNumsLabel.layer.borderColor = XHBRGBColor(245, 245, 245).CGColor;
    self.buyNumsLabel.layer.borderWidth = 1.0;
    self.buyNumsLabel.backgroundColor = XHBRGBColor(245, 245, 245);
    [self addSubview:self.buyNumsLabel];
    
    // +
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = CGRectMake(CGRectGetMaxX(self.buyNumsLabel.frame)+2, CGRectGetMaxY(View.frame)+20, 40, 30);
    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    addBtn.layer.cornerRadius = 5.0;
    addBtn.layer.masksToBounds = YES;
    addBtn.layer.borderColor =XHBRGBColor(245, 245, 245).CGColor;
    addBtn.layer.borderWidth = 1.0;
    addBtn.backgroundColor = XHBRGBColor(245, 245, 245);
    [addBtn addTarget:self action:@selector(addBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addBtn];
    
    UIView *baseView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(numLabel.frame)+20, self.bounds.size.width, 0.5)];
    baseView.backgroundColor =[UIColor grayColor];
    [self addSubview:baseView];
    
    // 加入购物车
    UIButton *joinCart = [UIButton buttonWithType:UIButtonTypeCustom];
    joinCart.frame = (CGRect){0, CGRectGetHeight(self.frame)-55, CGRectGetWidth(self.frame)/2, 55};
//    joinCart.backgroundColor = [UIColor colorWithRed:255/255.0 green:194/255.0 blue:56/255.0 alpha:1.0];
    joinCart.backgroundColor = XHBRGBColor(255, 194, 56);
    [joinCart setTitle:@"加入购物车" forState:UIControlStateNormal];
    [joinCart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [joinCart addTarget:self action:@selector(joinCartAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:joinCart];
    
    // 立即购买
    UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect bottomRect = joinCart.frame;
    bottomRect.origin.x = CGRectGetMaxX(joinCart.frame);
    buyBtn.frame = bottomRect;
//    buyBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:106/255.0 blue:30/255.0 alpha:1.0];
    buyBtn.backgroundColor = XHBRGBColor(255, 106, 30);
    [buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buyBtn addTarget:self action:@selector(buyBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buyBtn];
    
    self.backgroundColor = [UIColor whiteColor];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SelectSizeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SelectSizeCollectionViewCell class]) forIndexPath:indexPath];
    cell.backgroundColor = XHBRGBColor(245, 245, 245);
    cell.cellLabel.text = self.dataSource[indexPath.row][@"title"];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%ld单元格",indexPath.row);
    self.selectLabel.textColor = [UIColor redColor];
    self.selectLabel.text = [NSString stringWithFormat:@"已选:%@",self.dataSource[indexPath.row][@"title"]];
    self.priceLabel.text = [NSString stringWithFormat:@"%@",self.dataSource[indexPath.row][@"price"]];
    
}


-(void)minusBtnAction:(UIButton *)sender{
    
    NSLog(@"减法");
    if (self.buyNum == 1) return;
    self.buyNumsLabel.text = [NSString stringWithFormat:@"%d",--self.buyNum];
    
}

-(void)addBtnAction:(UIButton *)sender{
    
    NSLog(@"加法");
    self.buyNumsLabel.text = [NSString stringWithFormat:@"%d",++self.buyNum];
    
}


-(void)joinCartAction:(UIButton *)sender{
    
    NSLog(@"加入购物车");
}

-(void)buyBtnAction:(UIButton *)sender{
    
    NSLog(@"立即购买");
}

- (void)hideSelectView:(UITapGestureRecognizer *)sender {
    
    [self backBtnDidPressed:nil];
}

-(void)backBtnDidPressed:(UIButton *)sender {
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIView *bgView = [keyWindow viewWithTag:100000];
    if (bgView) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            CGRect unVisibleRect = self.frame;
            unVisibleRect.origin.y = keyWindow.frame.size.height;
            self.frame = unVisibleRect;
            bgView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [self removeFromSuperview];
            [bgView removeFromSuperview];
            
        }];
        
    }
    
}


- (void)showSelectView {
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIView *bgView = [[UIView alloc] initWithFrame:keyWindow.bounds];
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideSelectView:)];
    bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    bgView.alpha = 0;
    bgView.tag = 100000;
    bgView.userInteractionEnabled = YES;
    [bgView addGestureRecognizer:tapGest];
    
    [keyWindow addSubview:bgView];
    [keyWindow addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect visibleRect = self.frame;
        visibleRect.origin.y = keyWindow.frame.size.height/3;
        self.frame = visibleRect;
        bgView.alpha = 1;
        
    } completion:nil];
    
}


@end
