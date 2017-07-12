//
//  LZHScrollView.m
//  UICollectionView无限轮播
//
//  Created by 嚼华先森 on 2017/6/22.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "LZHScrollView.h"
#import "LZHCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface LZHScrollView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView * collectionView;
@property (nonatomic,strong) UIPageControl    * pageControl;
@property (nonatomic,strong) NSTimer          *timer;
@property (nonatomic,copy) SelectIndex  selectiIndex;


@end
@implementation LZHScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setUpCollectionView];
    }
    return self;
}

-(void)setUpCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    [self.collectionView setContentOffset:CGPointMake(self.bounds.size.width , 0) animated:YES];
    self.collectionView.showsHorizontalScrollIndicator =NO;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    //取消CollectionView阻尼效果,这个属性很重要,否则快速滑动时能划出超出的部分,
    self.collectionView.bounces = NO;
    
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    [self.collectionView registerClass:[LZHCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([LZHCollectionViewCell class])];
    [self addSubview:self.collectionView];
    
    //PageControl,可自行设置位置,样式
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds) - 40, CGRectGetWidth(self.bounds), 40)];
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    [self addSubview:self.pageControl];
    // 添加NSTimer
//    [self exchangePictureEveryTime];
    
    
}


#pragma mark 重写isAutomatic的set方法,判断是否需要开启自动轮播
-(void)setIsAutomatic:(BOOL)isAutomatic{
    _isAutomatic = isAutomatic;
    if (isAutomatic == YES) {
        // 添加NSTimer开启自动轮播
        [self exchangePictureEveryTime];
    }
}

#pragma mark 显示倒计时
-(void)setIsCountdown:(BOOL)isCountdown{
    
    _isCountdown = isCountdown;
    if (isCountdown == YES) {
        [self setCountDownBootomView];
    }
}

-(void)setCountDownBootomView{
    UIView *bootomView = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.size.width*0.7, self.bounds.size.height-35, self.bounds.size.width/3-20, 30)];
    bootomView.layer.cornerRadius = 2.0;
    bootomView.layer.masksToBounds = YES;
    bootomView.backgroundColor = [UIColor redColor];
    [self addSubview:bootomView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 2, bootomView.bounds.size.width, 13)];
    label.text = @"距结束";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:13.0];
    [bootomView addSubview:label];
    
    UILabel*time = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame), bootomView.bounds.size.width, 15)];
    time.textColor = [UIColor whiteColor];
    time.font = [UIFont systemFontOfSize:15.0];
    time.textAlignment = NSTextAlignmentCenter;
    time.text = @"72:59:01";
    [bootomView addSubview:time];
}

#pragma mark - NSTimer
- (void)exchangePictureEveryTime{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(handleTimer) userInfo:nil repeats:YES];
}

-(void)setImages:(NSArray<NSString *> *)images{
    
    self.pageControl.numberOfPages = images.count;
    self.collectionView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds) * (images.count+2), 0);
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:images];
    //加首尾两个图片以达到循环(比如原始加入的图片名叫A,B,C,那么加入两张后的数组为C,A,B,C,A,有两张的情况下,我们换个名称,叫C1,A1,B,C2,A2)
    [arr addObject:images[0]];
    [arr insertObject:images[images.count-1] atIndex:0];
    _images = arr;
    [self.collectionView reloadData];
}

-(void)handleTimer{
    
    NSInteger pageNumber = self.collectionView.contentOffset.x/self.bounds.size.width;
    
    if (pageNumber == self.pageControl.numberOfPages){
        //从B右滑滑到C2时,切换到C1(这样还能右滑,视觉上跟没切换一样.因为是同一张图片)
        [self.collectionView setContentOffset:CGPointMake(0, 0) animated:NO];
        self.pageControl.currentPage = 0;
    }else{
        //这里是中间普通的滑动,CollectionView会切换Cell,我们只需要设置pageControl
        self.pageControl.currentPage = pageNumber;
    }
    
    //每隔一定时间切换cell
    [self.collectionView setContentOffset:CGPointMake(self.collectionView.contentOffset.x+self.bounds.size.width, 0) animated:YES];
}

#pragma mark - 手动滑动时也要切换图片(ScrollViewDelegate)
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //C1,A1,B,C2,A2
    
    NSInteger pageNumber = self.collectionView.contentOffset.x/self.bounds.size.width;
    
    if (pageNumber == 0) {
        //从A1左滑滑到C1时,切换到C2(这样还能左滑,视觉上跟没切换一样.因为是同一张图片)
        [self.collectionView setContentOffset:CGPointMake(self.bounds.size.width *self.pageControl.numberOfPages, 0) animated:NO];
        self.pageControl.currentPage = self.pageControl.numberOfPages - 1;
    }else if (pageNumber == _images.count - 1){
        //从C2右滑滑到A2时,切换到A1(这样还能右滑,视觉上跟没切换一样.因为是同一张图片)
        [self.collectionView setContentOffset:CGPointMake(self.bounds.size.width, 0) animated:NO];
        self.pageControl.currentPage = 0;
    }else{
        //这里是中间普通的滑动,CollectionView会切换Cell,我们只需要设置pageControl
        self.pageControl.currentPage = pageNumber - 1;
    }
    //手动滑动重新计算时间,这样不会松开手后一下子因为计时器过去太久而闪过去好几张图片
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
        [self exchangePictureEveryTime];
    }
}

#pragma mark - UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LZHCollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LZHCollectionViewCell class]) forIndexPath:indexPath];
    //这里做了判断,如果是http的网络图片可以用SDWebimage加载,本地的图片用imageNamed加载,这个可以实现轮播图的网络本地图片混合播放
    if (![self.images[indexPath.row] hasPrefix:@"http"]) {
        cell.imgView.image =[UIImage imageNamed:self.images[indexPath.row]];
    }else{
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:self.images[indexPath.row]]];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row  == 0) {
        self.selectiIndex(self.images.count-1);
    }else  if (indexPath.row  == (self.images.count-1)) {
        self.selectiIndex(0);
    }else{
        self.selectiIndex(indexPath.row-1);
    }
}

-(void)didSelectCollectionViewItemAtIndex:(SelectIndex)index{
    self.selectiIndex = index;
}


@end
