//
//  PMShareView.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/26.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMShareView.h"
#import "PMShareCollectionViewCell.h"


@interface PMShareView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UILabel          *titleLabel;
@property (nonatomic, strong) UICollectionView *shareCollect;
@property (nonatomic, strong) UIButton         *cancelButton;
@property (nonatomic, strong) NSMutableArray   *shareItems;

@end

@implementation PMShareView

+ (instancetype)shareViewWithAutoFrame {
    
    PMShareView *share = [[PMShareView alloc] init];
    [share createSharePage];
    [share initializeShareData];
    
    return share;
}

- (void)createSharePage {
    
    //self.backgroundColor = [UIColor whiteColor];
    self.width = XHB_SCREEN_WIDTH;
    CGFloat leftRightSpace = 5;
    self.titleLabel = ({
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 6, self.width-2*leftRightSpace, 30)];
        titleLabel.backgroundColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = XHBSystemFont(20.f);
        titleLabel.text = @"分享";
        
        titleLabel;
    });
    
    self.shareCollect = ({
        
        UICollectionViewFlowLayout *fllayout = [[UICollectionViewFlowLayout alloc] init];
        fllayout.itemSize = CGSizeMake(100, 100);
        fllayout.sectionInset = (UIEdgeInsets){0, 10, 0, 10};
        fllayout.minimumLineSpacing = 0;
        fllayout.minimumInteritemSpacing = 0;
        fllayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        UICollectionView *clv = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.titleLabel.maxY, self.width-2*leftRightSpace, 120) collectionViewLayout:fllayout];
        clv.delegate = self;
        clv.dataSource = self;
        clv.showsHorizontalScrollIndicator = NO;
        clv.backgroundColor = [UIColor whiteColor];
        [clv registerClass:[PMShareCollectionViewCell class] forCellWithReuseIdentifier:[PMShareCollectionViewCell cellIdentifier]];
        
        clv;
        
    });
    
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(leftRightSpace, 0, self.width-2*leftRightSpace, 162)];
    container.backgroundColor = [UIColor whiteColor];
    container.layer.mask = ({
        
        UIBezierPath *roundPath = [UIBezierPath bezierPathWithRoundedRect:container.bounds cornerRadius:8.f];
        CAShapeLayer *roundShape = [CAShapeLayer layer];
        roundShape.path = roundPath.CGPath;
        roundShape.backgroundColor = container.backgroundColor.CGColor;
        
        roundShape;
    });
    [container addSubview:self.titleLabel];
    [container addSubview:self.shareCollect];
    
    self.cancelButton = ({
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(leftRightSpace, container.maxY+leftRightSpace*2, self.width-2*leftRightSpace, 50);
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitle:@"取消" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:30.f];
        [btn addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        UIBezierPath *bp = [UIBezierPath bezierPathWithRoundedRect:btn.bounds cornerRadius:8.f];
        CAShapeLayer *roundShape = [CAShapeLayer layer];
        roundShape.backgroundColor = btn.backgroundColor.CGColor;
        roundShape.path = bp.CGPath;
        btn.layer.mask = roundShape;
        
        btn;
        
    });
    
    
    
    self.height = self.cancelButton.maxY+leftRightSpace;
    
    [self addSubview:container];
    [self addSubview:self.cancelButton];
    
}

- (void)initializeShareData {
    
    typedef struct PMShareData{
        
        char *imageName;
        char *title;
        
    }PMShareData;
    
    PMShareData shareData[] = {
        {"share_03","朋友圈"},{"share_05","微信"},
        {"share_07","QQ"},{"share_09","QQ空间"}};
    
    int count = sizeof(shareData)/sizeof(PMShareData);
    self.shareItems = [NSMutableArray array];
    for (int i=0; i<count; i++) {
        
        UIImage  *image = [UIImage imageNamed:XHBUTF8String(shareData[i].imageName)];
        NSString *title = XHBUTF8String(shareData[i].title);
        [self.shareItems addObject:@{PMShareImageKey:image,PMShareTitleKey:title}];
        
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.shareItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return [PMShareCollectionViewCell cellForCollectionView:collectionView atIndexPath:indexPath withDictionary:self.shareItems[indexPath.item]];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_delegate && [self.delegate respondsToSelector:@selector(shareView:didClickWithTitle:)]) {
        
        [self.delegate shareView:self didClickWithTitle:self.shareItems[indexPath.item][PMShareTitleKey]];
    }

}

- (void)cancelButtonAction:(UIButton *)sender {
    
    if (_delegate && [self.delegate respondsToSelector:@selector(shareActionDidCancelInView:)]) {
        
        [self.delegate shareActionDidCancelInView:self];
    }
}

@end
